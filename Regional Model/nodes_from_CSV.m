function [ nodes ] = nodes_from_CSV(filename )

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
        nodes = csvread(filename);
        nodes(:,2) = nodes(:,2) * 1i;
        nodes(:,1) = nodes(:,1) + nodes(:,2);
        nodes(:,2) = [];

        end