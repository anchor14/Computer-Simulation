function neighbor = ftn(bw)

    neighbor = [0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0
                0 0 0 0 0 0 0 0 0 0];

    for idx = 1:numel(bw)
        if mod(idx, 10) == 1
            if idx == 1
                neighbor(idx) = bw(idx+1) + bw(idx+10);

            elseif idx == 91
                neighbor(idx) = bw(idx+1) + bw(idx-10);

            else
                neighbor(idx) = bw(idx+1) + bw(idx-10) + bw(idx+10);
            end

        elseif mod(idx, 10) == 0
            if idx == 10
                neighbor(idx) = bw(idx-1) + bw(idx+10);

            elseif idx == 100
                neighbor(idx) = bw(idx-1) + bw(idx-10);

            else
                neighbor(idx) = bw(idx-1) + bw(idx+10) + bw(idx-10);
            end


            
        elseif (91 <= idx) && (idx <= 99)
            neighbor(idx) = bw(idx-1) + bw(idx+1) + bw(idx-10);
       
        elseif (2 <= idx) && (idx <= 9)
            neighbor(idx) = bw(idx-1) + bw(idx+1) + bw(idx+10);
            
            
        else
            neighbor(idx) = bw(idx-1) + bw(idx+1) + bw(idx-10) + bw(idx+10);
       
        end


    end
end