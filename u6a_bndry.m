function [U] = u6a_bndry( t, nx, ny)
U = -Inf*ones( nx, ny );
n = nx
for j = 1:n
    for k = 1:n
        x = (j - 1)/(n - 1);
        y = (k - 1)/(n - 1);
        
        r = sqrt( (x - 0.5)^2 + (y - 0.5)^2 );
        
        if r < 0.1
            U(j, k) = 70;
        elseif r >= (n - 1)/(2*n)
            if y <= 0.5
                U(j, k) = 0;
            else
                U(j, k) = NaN;
            end
        end
        
    end
end

end
    