function [ LS ] = LS_from_CSV( filename )

%read a csv in format:
%x1,y1
%x2,y2
%.
%.
%.
%xn,yn
% output an array in format:
%x1 + iy1
%x2 + iy2
%.
%.
%.
%xn + iyn
LS = csvread(filename);
LS(:,2) = LS(:,2) * 1i;
LS(:,1) = LS(:,1) + LS(:,2);
LS(:,2) = [];

end

