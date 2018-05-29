function [bool] = autoRef(t,x,y,z,mag)
    x_y = intersect(x,y);
    x_z = intersect(x,z);
    y_z = intersect(y,z);
        
    if isempty(x_y+x_z+y_z)
        bool = 1;
    else
        bool = 0;
    end
end