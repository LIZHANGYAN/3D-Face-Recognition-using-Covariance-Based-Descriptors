function info = read_file(filepath)
% READ_FACE_VERTEX denotes read faces and vertexs from Bosphorus database
% INPUTS:
%   filepath: the databases path
%   options: extended parameters
%           options.3d;
%           options.2d;
%           options.
% OUTPUTS:
%   info: is a cell struct,N*
%         

if isempty(filepath)
    error('path is empty');
end

folder = list_file(filepath);

info = [];

for i=1:length(folder)
   subject = folder{i};
   files = list_files([path_fn, filesep, subject]);
   if(isempty(files) == 1)
       continue;
   end
   
   for j=1:length(files)
      file_array = split(files{j},'.');
      if(file_array(2) ~= 'bnt')
        continue;
      end
      filename = [path_fn, filesep, subject, filesep, files{j}]; 
      [vertex, face] = read_face_info(filename);
      data.vertex = vertex;
      data.face = face;
      data.label = file_array(1);
      info = [info data];
   end
end


end