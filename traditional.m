%%% make traditonal design
% design variables
VarMin = [2.6, 1.8, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 1.6, 2.4]; 
VarMax = [3.7, 3.3, 3.2, 3.2, 3.5, 3.3, 3.1, 3.2, 3.35, 3.8];
diff = VarMax-VarMin;
para_inp = VarMin + diff*0.9;

 call_solidworks_main(100, 100, para_inp);
% call_hypermesh(100,100);
% call_abaqus(100, 100);

% cmd1 = 'abaqus cae noGUI=';
% cmd2 = pwd; % current directory path
% cmd3 = '\ReadOdb_traditional.py';
% cmd = [cmd1 cmd2 cmd3];
% disp(cmd);
% system(cmd);
