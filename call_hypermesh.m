function call_hypermesh(round, number)

str = fileread( 'mesh.tcl' ); 
pos = strfind( str, sprintf('\n') );
in1 = '*feinputwithdata2 "#ct/step_reader" "';
in2 = pwd; % current directory path
in2 = strrep(in2,'\','/'); %replace backslah(\) with slash(/), because Hypermesh can only read slash(/)
in3 = '/step/';
in4 = [num2str(round), '_', num2str(number)];
in5 = '.STEP" 1 0 0.001 1 0 1 2 1 0';
input_step = [in1 in2 in3 in4 in5];

out1 = '*feoutputwithdata "D:/Program Files/Altair/13.0/templates/feoutput/abaqus/standard.3d" "';
out2 = in2;
out3 = '/inp/';
out4 = in4;
out5 = '.inp" 0 0 1 1 1';
out_inp = [out1 out2 out3 out4 out5];

str1 = str( 1 : pos(45) ) ;
str2 = str( pos(46)+1 : pos(232) );

% save hm file
save_hm1 = '*writefile "';
save_hm2 = in2;
save_hm3 = '/hm/';
save_hm4 = in4;
save_hm5 = '.hm" 1';
save_hm = [save_hm1 save_hm2 save_hm3 save_hm4 save_hm5];

% save as tcl file
tcl1 = in2;
tcl2 = '/tcl/';
tcl3 = in4;
tcl4 = '.tcl';
tcl = [tcl1 tcl2 tcl3 tcl4];
fid = fopen( tcl, 'w' );
fprintf( fid, '%s', str1 );
fprintf( fid, '%s\n', input_step );
fprintf( fid, '%s', str2 );
fprintf( fid, '%s\n', out_inp );
fprintf( fid, '%s\n', save_hm );
fprintf( fid,'*quit 1');
fclose( fid );

fid2 = fopen( 'call_tcl.bat', 'w');
bat1 = 'cd /d D:/Program Files/Altair/13.0/hm/bin/win64/';
bat2 = 'start hmopengl.exe -tcl '; %-hmbatch 
bat3 = in2;
bat4 = '/tcl/';
fprintf( fid2,'%s\r\n', bat1);
fprintf( fid2,'%s', bat2);
fprintf( fid2,'%s', bat3);
fprintf( fid2,'%s', bat4);
fprintf( fid2, [in4 '.tcl']);
fclose( fid2 );
dos('call_tcl.bat') 
end
