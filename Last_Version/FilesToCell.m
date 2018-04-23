function [Cells] = FilesToCell
    myDir = uigetdir; %gets directory
    myFiles = dir(fullfile(myDir,'*.csv')); %gets all wav files in struct
    Cells =  cell(length(myFiles),3);
    for k = 1:length(myFiles)
      baseFileName = myFiles(k).name;
      NameArguments = strsplit(baseFileName, '_');
      Cells{k,1} = NameArguments{2};
      filetype =NameArguments{end-1};
      Cells{k,2} = filetype;
      fullFileName = fullfile(myFiles(k).folder, baseFileName);
      Cells{k,3} = xlsread(fullFileName);        
    end  
end
    