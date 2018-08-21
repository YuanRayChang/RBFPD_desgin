function call_solidworks(round, number)
fix1 = [48.8 28.8;49.7 29.4;50.7 31.2;49.7 33.4;49 33.8];
center1 = [45.8 31.7];
degree1 = [45 60 90 120 150 180 210 240 270 300];
range1 = [2.6 3.7;1.8 3.3;1.6 3.2;1.6 3.2;1.6 3.5;1.6 3.3;1.6 3.1;1.6 3.2;1.6 3.35;2.4 3.8];
num_points = 10;
rand_inp1 = zeros(1,num_points*2);
para_output1 = zeros(1,num_points);

j=1;
rand_length1 = (rand() * (range1(j,2) - range1(j,1)) + range1(j,1));
para_output1(j) = rand_length1;

for i=1:num_points*2
        
    if mod(i,2) == 1 % X axis
        rand_inp1(i) = center1(1) + rand_length1 * cos(degree1(j)*pi/180);
    else  % Y axis
        rand_inp1(i) = center1(2) + rand_length1 * sin(degree1(j)*pi/180);
    end
    
    if mod(i,2)==0
        j = j+1;
        if j~=11 % in case j exceed 10
            rand_length1 = (rand() * (range1(j,2) - range1(j,1)) + range1(j,1));
            para_output1(j) = rand_length1;
        end
    end
end

a = 'cantilever_exp.exe'; % macro name
b = num2str(rand_inp1./1000); % parameters for incisor
filename = [num2str(round), '_', num2str(number)];
final = [a ' ' b ' ' filename];

% plot the point
for i=1:10
    scatter(rand_inp1(2*i-1),rand_inp1(2*i));
    hold on
end
scatter(fix1(:,1),fix1(:,2));
scatter(center1(1),center1(2),'filled');

fid = fopen( 'data.txt', 'a' );
for i=1:num_points
    fprintf( fid, '%d ', para_output1(i));
end
fprintf( fid, '\r\n');
fclose( fid );
disp(filename);
disp(final);
% call solidworks and give parameters
dos(final,'-echo');
end
