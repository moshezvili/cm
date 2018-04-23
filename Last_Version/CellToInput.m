function [acc, acc_fs, baro, baro_fs, temp1, temp1_fs, temp2, temp2_fs] = CellToInput()
CellArray = FilesToCell();
for k = 1:length(CellArray)
    a=CellArray{k,2};
    switch a
        case 'acc'
            acc = CellArray{k,3};
            acc_fs = length(acc)/(acc(end,1)-acc(1,1));
        case 'brm'
            baro = CellArray{k,3};
            baro_fs = length(baro)/(baro(end,1)-baro(1,1));
        case 'tmp1'
            temp1 = CellArray{k,3};
            temp1_fs = length(temp1)/(temp1(end,1)-temp1(1,1));
        case 'tmp2'
            temp2 = CellArray{k,3};
            temp2_fs = length(temp2)/(temp2(end,1)-temp2(1,1));
    end
end
         
end
