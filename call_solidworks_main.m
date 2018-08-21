function call_solidworks_main(round, number, para_inp)

center1 = [45.8 31.7];
degree1 = [45 60 90 120 150 180 210 240 270 300];
num_points = 10;
rand_opt1 = zeros(1,num_points*2);
j = 1;
for i=1:num_points*2
        
    if mod(i,2) == 1 % X axis
        rand_opt1(i) = center1(1) + para_inp(j) * cos(degree1(j)*pi/180);
    else  % Y axis
        rand_opt1(i) = center1(2) + para_inp(j) * sin(degree1(j)*pi/180);
    end
    if mod(i,2)==0
        j = j + 1;
    end
end

a = 'cantilever_exp.exe'; % macro name
b = num2str(rand_opt1./1000); % parameters for incisor
filename = [num2str(round), '_', num2str(number)];
final = [a ' ' b ' ' filename];

txt_name = [pwd, '\txt\', num2str(round), '_', num2str(number), 'data.txt'];
fid = fopen( txt_name, 'a' );
for i=1:num_points
    fprintf( fid, '%d ', para_inp(i));
end
fprintf( fid, '\r\n');
fclose( fid );

% call solidworks and give parameters
dos(final,'-echo');

end