function [dataArray samples] = readFile(fileName, headlines, Delimiter, opt)
	fid = fopen(fileName);
	if(headlines > 0)
		for i = 1:headlines
			fgetl(fid);
		end
	end
	if(opt == 0)
		%read by colum, first row is samples
		sampleLine = 1;
		data = {};
		while true
			thisline = fgetl(fid);
			if ~ischar(thisline); break; end  %end of file
			if (sampleLine == 1)
				samplesLine = regexp(thisline, Delimiter, 'split');
				sampleLine = 0;	
			else
				dataCol = regexp(thisline, Delimiter, 'split');
				data = [data; dataCol];
			end
		end
	elseif (opt == 1)
		samplesLine = {};
		data = {};
		while true
			thisline = fgetl(fid);
			if ~ischar(thisline); break; end  %end of file
			dataLine = regexp(thisline, Delimiter, 'split');
			samplesLine = [samplesLine dataLine{1}];
			data = [data dataLine(2:end)'];
		end
	end
	dataArray = data;
	samples = samplesLine;
	fclose(fid);
end


