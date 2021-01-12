function ori0 = loadOrientations(input,cs,ss)
% Function to load grain orientations from a file
% 
% Input file should be a simple list of Euler angles, one orientation per line
%   first column: phi1
%   second column: Phi 
%   third colum: phi2
%
% Parameters:
% - full path to the file with the list of euler angles
% - cs: crystal system
% - ss: sample system
% 
% Returns
% - A list of orientations
%
% See also loadOrientations
%
% This is part of the TIMEleSS tools
% http://timeless.texture.rocks/
%
% Copyright (C) S. Merkel, Universite de Lille, France
%
% This program is free software; you can redistribute it and/or
% modify it under the terms of the GNU General Public License
% as published by the Free Software Foundation; either version 2
% of the License, or (at your option) any later version.

	clear ori
	clear ori0
	
	fprintf('\nLoading orientations from\n\t filename: %s\n', input)
	ori = load(input);
	n = size(ori);
	nGrains = n(1);
	
	phi1 = ori(:,1)*degree;
	Phi = ori(:,2)*degree;
	phi2 = ori(:,3)*degree;
	ori0 = orientation('Euler',phi1,Phi,phi2,cs,ss);
	
	ori0 = reshape(ori0,[],1); % Put all orientations as a vertical vector
	fprintf('\nLoaded %d orientations\n', nGrains);
end
