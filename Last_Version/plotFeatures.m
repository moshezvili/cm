figure
for  z = 1:10
tempvec = [];
i=1;
for k = 1:length(A)
    if strcmp(A{k,2},'Magnitude')
        tempvec(i,1) = A{k,1};
        tempvec(i,2) = A{k,4}{z};
        i=i+1;
    end
end
subplot(2,5,z)
scatter(tempvec(:,1),tempvec(:,2))
end

        