function [dataArray samples] = dataset(varargin)
	P = inputParser;
	P.addParamValue('File', @isstr);
	P.addParamValue('ReadObsNames', false, @islogical);
	P.addParamValue('ReadVarNames', 'true', @islogical);
	P.addParamValue('Delimiter', @isstr);
	P.addParamValue('HeaderLines', 0, @isnumeric);
	if ~isempty(varargin)
		P.parse(varargin{:});
	else
		error('input:error', 'wrong input arguments ');		
	end		
	File = P.Results.File;
	Obs = P.Results.ReadObsNames;	
	Vars = P.Results.ReadVarNames;	
	Delimiter = P.Results.Delimiter;
	HeaderLines = P.Results.HeaderLines;
	if ( Obs == true && Vars == false)
		[dataArray samples]= readFile(File, HeaderLines, Delimiter, 1);
	elseif (Obs == false && Vars == true)
		[dataArray samples] = readFile(File, HeaderLines, Delimiter, 0);
	else
		error('ReadObs/Var:error', 'wrong ReadObs setting');
	end
	%for 


	%A = table1
end


