function [t, U_soln] = wave2d( c, h, U_init, dU_init, u_bndry, t_int, nt )
    ti = t_int(1);
    tf = t_int(2);
    dt = (tf - ti)/(nt - 1);
    t = linspace( ti, tf, nt );

    if h <= 0
        throw( MException( 'MATLAB:invalid_argument', ...  
        'the argument U is not a matrix' ) );  
    end

    if nt <= 0
        throw( MException( 'MATLAB:invalid_argument', ...  
        'the argument nt is too small' ) );  
    end

    if ismatrix(U_init) == 0
        throw( MException( 'MATLAB:invalid_argument', ...  
        'the argument U is not a matrix' ) );  
    end

    if numel(size(U_init)) ~= 2 
        throw( MException( 'MATLAB:invalid_argument', ...  
        'the argument U is not a 2d matix' ) );  
    end

    [nx, ny] = size( U_init );
 
    U_soln = zeros( nx, ny, nt );
    U_soln(:, :, 1) = U_init;
    
    r = (c*dt/h)^2;

    U_soln(:, :, 2) = U_soln(:, :, 1) + dt*dU_init;

    for it = 3:nt
        U_soln(:, :, it) = u_bndry( t(it), nx, ny );
        
        for ix = 1:nx
            for iy = 1:ny
                if U_soln(ix, iy, it) == -Inf
                    Utmp = U_soln(ix, iy, it - 1);
                    U_soln(ix, iy, it) = 2*Utmp - U_soln(ix, iy, it - 2);
                    
                    for dxy = [-1 1 0 0; 0 0 -1 1]
                        dxy;
                        dix = ix + dxy(1);
                        diy = iy + dxy(2);

                        if ~isnan( U_soln(dix, diy, it - 1) )
                            U_soln(ix, iy, it) = U_soln(ix, iy, it) + ...
                                r*( U_soln(dix, diy, it - 1) - Utmp );
                        end
                    end
                end
            end
        end
    end

end
