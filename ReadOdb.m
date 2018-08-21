function ReadOdb()

cmd1 = 'abaqus cae noGUI=';
cmd2 = pwd; % current directory path
cmd3 = '\ReadOdb_initial.py';
cmd = [cmd1 cmd2 cmd3];

disp(cmd);
system(cmd);

end