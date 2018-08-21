function call_abaqus(round, number)

jobname = [num2str(round), '_', num2str(number)];
cmd_str1 = pwd; % current directory path
cmd_str1 = strrep(cmd_str1,'\','/'); %replace backslah(\) with slash(/), because Hypermesh can only read slash(/)
cmd_str = ['abaqus job=', jobname, ' input=', cmd_str1 ,'/inp/', jobname, '.inp cpus=6 interactive'];
disp(cmd_str);
system(cmd_str);

% move odb file to folder "odb"
if exist([jobname, '.odb'], 'file') == 2 
    movefile([jobname, '.odb'], 'odb');
end
% move rest of the file to folder "rest". These file can be deleted
% afterwards, since thay are not important.
if exist([jobname, '.com'], 'file') == 2 
    movefile([jobname, '.com'], 'rest');
end
if exist([jobname, '.dat'], 'file') == 2 
    movefile([jobname, '.dat'], 'rest');
end
if exist([jobname, '.msg'], 'file') == 2 
    movefile([jobname, '.msg'], 'rest');
end
if exist([jobname, '.prt'], 'file') == 2 
    movefile([jobname, '.prt'], 'rest');
end
if exist([jobname, '.sim'], 'file') == 2 
    movefile([jobname, '.sim'], 'rest');
end
if exist([jobname, '.sta'], 'file') == 2 
    movefile([jobname, '.sta'], 'rest');
end

end