clc;
clear;
%% Problem Definition

nVar = 10;
VarSize = [1 nVar];
VarMin = [2.6, 1.8, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 2.4];
VarMax = [3.7, 3.3, 3.2, 3.2, 3.5, 3.3, 3.1, 3.2, 3.35, 3.8];
%% Parameters of PSO

MaxIter = 30;   % Maximum number of iteration
nPop = 40;      % Population size
kappa = 1;        
phi1 = 2.05; %2.05         
phi2 = 2.05; %2.05
phi = phi1 + phi2;
chi = 2*kappa/abs(2-phi-sqrt(phi^2-4*phi));

w = chi;
c1 = chi*phi1;
c2 = chi*phi2;
%% Initialization

empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];
empty_particle.Area = [];
empty_particle.Position_all = [];
% Create population array
particle = repmat(empty_particle,nPop,1);

% Initialize global bset
GlobalBest.Cost = 100;

% Initialize population members
load 'data_initial.txt';
area_initial = csvread('area_initial.csv',1,1);
for i=1:nPop
    
    particle(i).Position = data_initial(i,:);
    % Initailize Velocity
    particle(i).Velocity = zeros(VarSize);
    % Evaluation
    particle(i).Cost = area_initial(i,1);
    particle(i).Area = area_initial(i,:);
    particle(i).Position_all = particle(i).Position;
    % Update the personal best
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;
    % Update global best
    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end
    
end

BestCosts = zeros(MaxIter, 1);

%resume running from round 18
load particle
GlobalBest.Position = [3.06145022172154,2.98316894759440,2.20988596644521,2.45506706770401,3.09336674564344,2.14417125456755,2.28075460085589,2.70910648293212,2.84575499547182,2.40000000000000];
GlobalBest.Cost =  6.36096972851000; 
%% Main Loop of PSO

for it=18:34
    for i=1:nPop
        
        fid = fopen( 'position_area.txt', 'a' ); % output position and area
        
        % Update Velocity
        particle(i).Velocity = w*particle(i).Velocity ...
            + c1*rand(VarSize).*(particle(i).Best.Position - particle(i).Position) ...
            + c2*rand(VarSize).*(GlobalBest.Position - particle(i).Position);
        % Update Position
        particle(i).Position = particle(i).Position + particle(i).Velocity;
        
        % Apply upper and lower bound limits
        particle(i).Position = max(particle(i).Position, VarMin);
        particle(i).Position = min(particle(i).Position, VarMax);
        
        call_solidworks_main( it, i, particle(i).Position);
        call_hypermesh( it, i);
        time = 48;
        pause(time);
        disp(time);
        inp_name = [pwd, '\inp\', num2str(it), '_', num2str(i), '.inp'];
        if exist(inp_name, 'file') == 0    % inp file doesn't exist
            pause(3);
            disp(time+3);
            if exist(inp_name, 'file') == 0
                pause(5)
                disp(time+10);
                if exist(inp_name, 'file') == 0
                    pause(5)
                    disp(time+15);
                    if exist(inp_name, 'file') == 0
                        pause(5)
                        disp(time+20);
                        if exist(inp_name, 'file') == 0
                            pause(10)
                            disp(time+30);
                            area = 40;
                			particle(i).Area = [particle(i).Area ; particle(i).Area(end,:)];
                			particle(i).Position_all = [particle(i).Position_all ; particle(i).Position_all(end,:)];

                        end
                    end
                end
             end
        end
         
        if exist(inp_name, 'file') == 2
            call_abaqus( it, i);
            str = fileread( 'ReadOdb_one.py' ); 
            pos = strfind( str, sprintf('\n') );
            str1 = str( 1 : pos(138) ) ;
            str_1 = '    odbPath = ''';
            str_2 = [strrep(pwd,'\','/'), '/odb/'];
            str_ = [str_1, str_2, num2str(it), '_', num2str(i), '.odb'''];
            str2 = str( pos(139)+1 : pos(284)+15 );

            ReadOdb = [pwd, '\ReadOdb_tmp.py'];
            fid_ReadOdb = fopen( ReadOdb, 'w' );
            fprintf( fid_ReadOdb, '%s', str1 );
            fprintf( fid_ReadOdb, '%s\n', str_ );
            fprintf( fid_ReadOdb, '%s', str2 );
            fclose( fid_ReadOdb );
            cmd = ['abaqus cae noGUI=', strrep(pwd,'\','/'), '/ReadOdb_tmp.py'];
            system(cmd);

            % check if area is empty. prevent .odb fails
            area_file = dir('area.csv');
            if area_file.bytes > 10
                area = csvread('area.csv',0,0);
                particle(i).Cost = area(1,1);
                particle(i).Area = [particle(i).Area ; area(1,:)];
                particle(i).Position_all = [particle(i).Position_all ; particle(i).Position];
            else % .odb fails
                area = 40;
                particle(i).Area = [particle(i).Area ; particle(i).Area(end,:)];
                particle(i).Position_all = [particle(i).Position_all ; particle(i).Position_all(end,:)];
            end
        end    
        % Update personal best
        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;
            
            % Update global best
            if particle(i).Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end
        
        % output position and area 
        fprintf( fid, '%d_%d ', it,i);
        for j=1:length(particle(i).Position)
            fprintf( fid, '%d ', particle(i).Position(j));
        end
        for k = 1:length(area)
            fprintf( fid, '%d ', area(1,k));
        end
        fprintf( fid, '\r\n');
        fclose( fid );
        
    end
    
    BestCosts(it) = GlobalBest.Cost;
    disp(['Iteration ' num2str(it) ' : Best cost = ' num2str(BestCosts(it))]);
    
    fid2 = fopen( 'Best.txt', 'a' );
    fprintf( fid2, '%d ',it);
    for g=1:nVar
        fprintf( fid2, '%d ', GlobalBest.Position(g));
    end
    fprintf( fid2, '%d ',GlobalBest.Cost);
    fprintf( fid2, '\r\n');
    fclose( fid2 );
    
    % save 'particle' as mat file
    save([pwd, '\particle\particle_', num2str(it),'.mat'], 'particle');
    
end
