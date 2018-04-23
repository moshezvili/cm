function[NewCell] = CreatDataPlusFeatures 
C = FilesToCell();
i=1;
NewCell = {};
for k = 1:length(C)
    if strcmp('acc',C{k,2})
        accx =C{k,3}(:,2);
        accy =C{k,3}(:,3);
        accz =C{k,3}(:,4);
        Acc_Mag = sqrt(accx.^2 + accy.^2 + accz.^2);
        temp = {accx;accy;accz;Acc_Mag};
        NewCell(i:i+3,1) = C(k,1);
        NewCell{i,2}= 'accx';
        NewCell{i+1,2}= 'accy';
        NewCell{i+2,2}= 'accz';
        NewCell{i+3,2}= 'Magnitude';
        NewCell(i:i+3,3) = temp;
        i=i+4;
    end
    if strcmp('brm',C{k,2})
        NewCell{i,1} = C{k,1};
        NewCell{i,2}= 'brm';
        NewCell{i,3} = C{k,3}(:,1);
        i=i+1;
    end
    if strcmp('tmp1',C{k,2})
        NewCell{i,1} = C{k,1};
        NewCell{i,2}= 'tmp1';
        NewCell{i,3} = C{k,3}(:,1);
        i=i+1;
    end
    if strcmp('tmp2',C{k,2})
        NewCell{i,1} = C{k,1};
        NewCell{i,2}= 'tmp2';
        NewCell{i,3} = C{k,3}(:,1);
        i=i+1;
    end
end
func = @extraction_methods;
NewCell(:,4) =  cellfun(func,NewCell(:,3),'UniformOutput',0);
end