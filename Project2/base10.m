% bw = [
%     1 0 0 0 0 0 0 1 0 0
%     0 0 0 0 0 0 0 1 0 1
%     0 0 0 0 0 0 0 0 1 0
%     1 0 0 1 0 0 0 1 0 0
%     0 0 0 0 0 0 0 1 0 1
%     0.5 0.5 0.5 0.5 0.5 1 0 1 0 1
%     0 0 0 0 1 1 1 1 0 0.5
%     0 0.5 0 0 0.5 0 0 0 1 1
%     0 1 0.5 0 1 0 1 1 1 0
%     1 0 0 1 0 0 0 1 0 0];
bw = [
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0.5 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0
    0 0 0 0 0 0 0 0 0 0];



N = 49;
S = 30;
I = 9;
D = 10;


inft = 0.05;
rect = 0.02;
brt = 0.04;
drt = 0.03;
    
 % function fraction(a)
 %    count = 0;
 %    for idx = 1:numel(a) 
 %        ele = a(idx);
 %        if ele == 1
 %            count = count + 1;
 %        end


 %    return count/numel(a)


% imshow(bw, 'InitialMagnification', 'fit')

% B = 19;
% D = 30;
% 
% dt = 1;
% tmax = 1000;
% % clockmax = ceil(tmax/dt);
% 
% B = 19;
% D = 30;

dt = 1;
tmax = 1000;
clockmax = ceil(tmax/dt);
% a = 1/20;
% b = 1/20;




% p2 = mat2gray(bw);

for clock=1:clockmax
    t = clock*dt;
    neighbor = ftn(bw);
    
    for idx = 1:numel(bw)
        element = bw(idx);

        if element == 1
            if (rand < drt*dt)
                bw(idx) = 0;
            elseif (rand < inft*4*neighbor(idx)*dt)
                bw(idx) = 0.5;
                
            end
                

        elseif element == 0.5
            if (rand < brt*4*neighbor(idx)*dt)
                bw(idx) = 1;
            elseif (rand < rect*4*neighbor(idx)*dt)
                bw(idx) = 1;
            end

        else
            if (rand < brt*4*neighbor(idx)*dt)
                bw(idx) =1;
            end
        end
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
    pause(0.2);
    
%     bw
end