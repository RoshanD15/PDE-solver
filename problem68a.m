n = 51;
U = -Inf*ones( n, n );
    for j = 1:n
        for k = 1:n
            x = (j - 1)/(n - 1);
            y = (k - 1)/(n - 1);
            r = sqrt( (x - 0.5)^2 + (y - 0.5)^2 );
            if r < 0.1
                U(j, k) = 200;
            elseif r >= (n - 1)/(2*n)
                if y <= 0.5
                    U(j, k) = 0;
                else
                    U(j, k) = NaN;
                end
            end
        end
    end
U_steady = laplace2d( U );
U_steady( round( (n + 1)/2 ), (end - 2):end );
t_int = [0.1,1];
nt = 10;
h = 0.1;
kappa = 100;

[t6a, U6a] = diffusion2d( kappa, h, U_steady, @u6a_bndry, t_int, nt );

frames6a = animate( U6a );
movie( frames6a );
frames2gif( frames6a, 'plot6b.i.gif' );
mesh( U_steady ); 
min(U6a(:,2,:));
U6a
while max(U6a(:,2,2:end)) <= 120
    kappa = kappa - 0.1
    [t6a, U6a] = diffusion2d( kappa, h, U_steady, @u6a_bndry, t_int, nt );
    kappa
    max(U6a(:,50,50:1))
end

