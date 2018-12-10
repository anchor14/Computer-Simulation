% bw = [
%     0 0 0 0 0 0 0 1 0 0
%     0 0 0 0 0 0 0 0 0 1
%     0 0 0 0 0 0 0 0 1 0
%     1 0 0 1 0 0 0 1 0 0
%     0 0 0 0 0 0 0 1 0 1
%     1 0 0 0 0 0 0 0 1 0
%     1 0 0 0 0 0 0 0 0 1
%     1 0 0 0 0 0 0 0 1 1
%     0 0 0 0 1 0 0 0 0 0
%     1 0 0 1 0 0 0 1 0 0];

% bw = [
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 1 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0
%     0 0 0 0 0 0 0 0 0 0];

bw = [
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1
    1 1 1 1 1 1 1 1 1 1];


N = 49;
f = 19/49;

brt = 0.04;
drt = 0.40;
    
    
 % function fraction(a)
 %    count = 0;
 %    for idx = 1:numel(a) 
 %        ele = a(idx);
 %        if ele == 1
 %            count = count + 1;
 %        end


 %    return count/numel(a)


% imshow(bw, 'InitialMagnification', 'fit')

B = 19;
D = 30;

dt = 1;
tmax = 1000;
clockmax = ceil(tmax/dt);

% a = 1/20;
% b = 1/20;


% neighbor = ftn(bw);

% p2 = mat2gray(bw);

for clock=1:clockmax
    t = clock*dt;
    neighbor = ftn(bw);

    for idx = 1:numel(bw)
        element = bw(idx);

        if element == 1
            if (rand < drt*dt)
                bw(idx) = 0;
            end

        else
            if (rand < brt*4*neighbor(idx)*dt)
                bw(idx) = 1;
            end
        end

%         if (rand < brt*4*neighbor(idx)*dt)
%             bw(idx) = 1;
%         end
        
    end
    
%      p2 = imshow(foo2);
% %      pause(5);
%      foo2 = rand(50,60);
%      set(p2, 'CData', foo2);

%      pause(0.5);
%      figure(1);
%      axis image;
%      image(bw);
%      drawnow;
%      colormap(gray);
    imagesc(bw);
    
    axis equal;
    drawnow();
    pause(0.02);
    
%     bw
end