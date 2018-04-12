function [A] = Populate_A(LS_end,LS_c)
    [h,l] = size(LS_end);
    height=h+1;
    width=h+1;
    A=nan(height,width);
    A(:,width)=1;
    
    for m=1:height
        for j=1:width-1
           
            z1=LS_end(j,1);
            z2=LS_end(j,2);
            z=LS_c(m);
            Z=Calculate_Z(z,z1,z2);
            L=Calculate_L(z1,z2);
            
            A(m,j)= real(LS(Z,L));
            
        end
    end
    
end