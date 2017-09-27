function [vertex,face] = read_face_info(filepath)
% READ_FACE_INFO read info of 3D face


[data, zmin, nrows, ncols, imfiles] = read_bntfile(filepath);

% Remove background points
data1 = find(data(:,3)>zmin);
data1 = data(data1,:);

vertex = data1(:,1:3);

face = delaunay(vertex(:,1),vertex(:,2));

end
