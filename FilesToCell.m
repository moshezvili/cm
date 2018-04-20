function [Cells] = FilesToCell
    myDir = uigetdir; %gets directory
    myFiles = dir(fullfile(myDir,'*.csv')); %gets all wav files in struct
    Cells =  cell(length(myFiles),3);
    for k = 1:length(myFiles)
      baseFileName = myFiles(k).name;
      NameArguments = strsplit(baseFileName, '_');
      Cells{k,1} = NameArguments{2};
      if length(NameArguments)>5
          Cells{k,1} =strcat(NameArguments{2},'_',NameArguments{3});
      end
      filetype = strsplit(NameArguments{end}, '.');
      Cells{k,2} = filetype(1);
      fullFileName = fullfile(myFiles(k).folder, baseFileName);
      Cells{k,3} = xlsread(fullFileName);
      switch Cells{k,1}
          case 'fw_fall'
              Cells{k,1}=1;
          case 'sd_fall'
              Cells{k,1}=2;
          case 'bk_fall'
              Cells{k,1}=3;
          case 'walking'
              Cells{k,1}=4;
          case 'Sitting'
              Cells{k,1}=5;
          case 'sit_typ'
              Cells{k,1}=6;
          case 'dn_strs'
              Cells{k,1}=7;
          case 'up_strs'
              Cells{k,1}=8;
          case 'sit_car'
              Cells{k,1}=9;
          case 'wlk_off'
              Cells{k,1}=10;
      end           
    end  
end
    