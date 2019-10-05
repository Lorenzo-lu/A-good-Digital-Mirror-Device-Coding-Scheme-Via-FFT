function [M] = FT_mask(pixel_edge,cycles)

% index_x = randperm(pixel_edge)
% index_y = randperm(pixel_edge)

index_x = [1:pixel_edge];
index_y = [1:pixel_edge];

iy = 1;
ix = 1;


i = 1;
diag_i = 1;
while i <= cycles
    index = freq_select_2d(diag_i);
    j = 1;
    while j <= (2 * diag_i - 1)
        row = index(j,1);
        col = index(j,2);
        j = j + 1;
        
        a = zeros([pixel_edge,pixel_edge]);
        a(row,col) = 1;
        V = idct2(a);
        V(find(V<0)) = 0;
        V(find(V>0)) = 1;
        V = reshape(V,[1,pixel_edge^2]);    
        M(i,:) = V; 
        
        i = i + 1;
        if i > cycles
            break;
        end
    end
    diag_i = diag_i + 1;
    
end


end