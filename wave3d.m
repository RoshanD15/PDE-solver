function [t, U_soln] = wave3d( c, h, U_init, dU_init, u_bndry, t_int, nt )
    ti = t_int(1);
    tf = t_int(2);
    dt = (tf - ti)/(nt - 1);
    t = linspace( ti, tf, nt );

    [nx, ny, nz] = size( U_init );
 
    U_soln = zeros( nx, ny, nz, nt );
    U_soln(:, :, :, 1) = U_init;
    
    r = (c*dt/h)^2;

    U_soln(:, :, :, 2) = U_soln(:, :, :, 1) + dt*dU_init;

    for it = 3:nt
        U_soln(:, :, :, it) = u_bndry( t(it), nx, ny, nz );
        
        for ix = 1:nx
            for iy = 1:ny
                for iz = 1:nz
                if U_soln(ix, iy, iz, it) == -Inf
                    Utmp = U_soln(ix, iy, iz, it - 1);
                    U_soln(ix, iy, iz, it) = 2*Utmp - U_soln(ix, iy, iz, it - 2);
                    
                      for dxyz = [-1 1 0 0 0 0 ; 0 0 0 0 -1  1 ; 0 0 -1 1 0 0]
                            dix = ix + dxyz(1);
                            diy = iy + dxyz(2);
                            diz = iz + dxyz(3);

                        if ~isnan( U_soln(dix, diy, diz, it - 1) )
                            U_soln(ix, iy, iz, it) = U_soln(ix, iy, iz, it) + ...
                                r*( U_soln(dix, diy, diz, it - 1) - Utmp );
                        end
                    end
                end
            end
        end
    end

end
