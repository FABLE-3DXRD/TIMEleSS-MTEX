function odf = odfFromOrientations(input, varargin)
% Function to load grain orientations and fit an ODF
%
% 
% Usage
%
%    odfFromOrientations(inputfile,'cs',cs_ppv,'ss',ss)
%    odfFromOrientations(inputfile,'cs',cs_ppv,'ss',ss, 'halfwidth', 10)
%
% Input
%    input can either
%       - the full path to the file with the list of euler angles, or, (see loadOrientations.m for file format)
%       - a list of orientations if they are already known
%
%
% Returns
%     the ODF
%
% Required parameters 
%
%     cs: crystal system
%     ss: sample system
%
%
% Optional parameters
%
%     halfwidth: halfwidth for ODF calculation, in degrees, default is 15
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

	% default parameters and parser
	p = inputParser;
	addParameter(p,'cs',false);
	addParameter(p,'ss',false);
	addParameter(p,'halfwidth',15., @isfloat);
	parse(p,varargin{:});
	cs = p.Results.cs;
	ss = p.Results.ss;
	halfwidth = p.Results.halfwidth;
	
	if (islogical(cs))
		fprintf('\nError: no crystal symmetry provided\n')
		return
	end
	if (islogical(ss))
		fprintf('\nError: no crystal sample provided\n')
		return
	end
	
	% If input parameter is a char,
	% load file and create the corresponding list of orientations
	if (ischar(input))
		ori0 = loadOrientations(input, cs, ss);
		n = size(ori0);
	% Else, if input is a list of orientations, just copy them
	elseif (isa(input,'orientation'))
		ori0 = input;
		n = size(ori0);
		fprintf('\nStarting from %d orientations\n', n)
	end
		
	% Fit an ODF to the data
	odf = calcODF(ori0,'halfwidth',halfwidth*degree);
	fprintf('\nCalculated an ODF based on grain orientations\n')
	
end
