function [U] = U6d_bndry( t, n_x, n_y, n_z ) 

    U = -Inf*ones( n_x, n_y, n_z ); 

    U(end,:,:) = sin(t).*(t <= 2*pi); 

  

    U(:,[1,end],:) = NaN; 

    U(:,:,[1,end]) = NaN; 

     

    for i = 1:n_x 

        for j = 1:n_y 

            for k = 1:n_z 

                x = (i - 1)/(n_x - 1); 

                y = (j - 1)/(n_y - 1); 

                z = (k - 1)/(n_z - 1); 

                dist = sqrt( (x - 0.5)^2 + (y - 0.5)^2 + (z - 0.5)^2 );

                if dist >= 0.55 
                    if i<17
                        %if j<17
                            %if k<17
                        U(i, j, k) = NaN;
                    

                % Modify this to determine which points at the end 
                % of the region will be set to NaN to reflect and 
                % focus the signal.  Consider the example where  
                % the points were determined by the distance from  
                % the centre of a circle. 
                            %end
                        %end
                    end
                end
                if x == 0 

                    U(i, j, k) = NaN;
                

                        
                    

                end

            end 

        end 

    end 

end 