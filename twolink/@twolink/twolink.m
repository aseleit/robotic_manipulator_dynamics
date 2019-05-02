classdef twolink < SerialLink
 
	properties
	end
 
	methods
		function ro = twolink()
			objdir = which('twolink');
			idx = find(objdir == filesep,2,'last');
			objdir = objdir(1:idx(1));
			 
			tmp = load(fullfile(objdir,'@twolink','mattwolink.mat'));
			 
			ro = ro@SerialLink(tmp.sr);
			 
			 
		end
	end
	 
end
