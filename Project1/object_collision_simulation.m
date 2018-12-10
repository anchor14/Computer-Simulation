%Jaehurn Nam, 2017, Copyrights reserved

% The units used are the following: meter(distance), kg(mass), second(time)

prompt = {'Enter mass of bypassing object (units in 10^28 kg): '};

answer = inputdlg(prompt);

objmass = cell2mat(answer) * 10^28;
 
%The part above is to create the dialogue box for the user input for the bypassing object.

N = 10; % number of bodies
G = 6.67408 * 10^(-11);  %Grav constant in m^3 * kg^(-1) * s^(-2)

M = [1.989 * 10^30, 0.330*10^24, 4.87*10^24, 5.97*10^24, 0.642*10^24, 1898*10^24, 568*10^24, 86.8*10^24, 102*10^24, objmass]; % mass of the objects

%We assume the solar system is on the same plane, so begin with 0 for y and z positions
%The following is initialization of the positions of all the objects.
x = [0, 57.9*10^9, 108.2*10^9, 149.6*10^9, 227.9*10^9, 778.6*10^9, 1433.5*10^9, 2872.5*10^9, 4495.1*10^9, 0];  
y = [0, 0, 0, 0, 0, 0, 0, 0, 0, 4000*10^9];
z = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0];

%The following is initialization of the velocity of all the objects.
u = [0 0 0 0 0 0 0 0 0 0];
v = [0 1*sqrt(G*M(1)/x(2)) 1*sqrt(G*M(1)/x(3)) 1*sqrt(G*M(1)/x(4)) 1*sqrt(G*M(1)/x(5)) 1*sqrt(G*M(1)/x(6)) 1*sqrt(G*M(1)/x(7)) 1*sqrt(G*M(1)/x(8)) 1*sqrt(G*M(1)/x(9)) -70*sqrt(G*M(1)/x(7))]; % initial y velocity
w = [0 0 0 0 0 0 0 0 0 0];


%Size and color array for scatter(plot)
size1 = [20,4,8,8,8,8,8,8,8,8];
size2 = [50,10,20,20,20,20,20,20,20,20];

color = [1 0 0; 0 0 0; 0.85 0.33 0.1; 0.47 0.67 0.19; 0.5 0.3 0; 0.85 0.33 0.1; 0.93 0.69 0.13; 0.3 0.75 0.93; 0 0 0.9; 0.49 0.18 0.56];


%Creating the time steps
tmax = 2 * 365.25 * 24 * 60 * 60; %in seconds
dt = 24 * 60 * 60; %in seconds

xs = x(9) * 1.5; % size of axis
clockmax = ceil(tmax/dt); % number of iteration




for clock = 1:clockmax   %big for loop running from beginning to end of the time step
    for i = 1:N
        for j = 1:N
            if j ~= i  %three for loops above to compute everything
                dx = x(i)-x(j);
                dy = y(i)-y(j);
                dz = z(i)-z(j);
                %Calculating dx, dy, dz
                r = sqrt(dx^2+dy^2 +dz^2);   %Calculating the r
                u(i) = u(i)-dt*G*M(j)*dx/r^3;
                v(i) = v(i)-dt*G*M(j)*dy/r^3; 
                w(i) = w(i)-dt*G*M(j)*dy/r^3;

                %Updating the velocity elements of each object
            end
        end
    end
   
    for i = 1:N
        x(i) = x(i) + dt*u(i);
        y(i) = y(i) + dt*v(i);
        z(i) = z(i) + dt*w(i);
        %updating positions of each element

    end

    %4 different subplots: [2d, 2d zooomed, 3d, 3d zoomed];
    set(gcf,'double','on')
    subplot(2,2,1)
    scatter(x(1:N),y(1:N),size1,color,'filled');
    axis equal
    axis([-xs,xs,-xs,xs])
    axis manual
    xlabel('x-coordinate','FontSize',6,'FontWeight','bold')
    ylabel('y-coordinate','FontSize',6,'FontWeight','bold')
    
    subplot(2,2,2);
    scatter(x(1:N),y(1:N),size2,color,'filled');
    axis equal
    axis([x(1) - xs/10, x(1) + xs/10,y(1) - xs/10, y(1) + xs/10])
    axis manual
    xlabel('x-coordinate(zoomed)','FontSize',6,'FontWeight','bold')
    ylabel('y-coordinate(zoomed)','FontSize',6,'FontWeight','bold')

    subplot(2,2,3)
    scatter3(x(1:N),y(1:N),z(1:N),size1,color,'filled');
    axis equal
    axis ([-xs,xs,-xs,xs,-xs,xs])
    axis manual
    xlabel('x-coordinate','FontSize',6,'FontWeight','bold')
    ylabel('y-coordinate','FontSize',6,'FontWeight','bold')
    zlabel('z-coordinate','FontSize',6,'FontWeight','bold')

 
    subplot(2,2,4)
    scatter3(x(1:N),y(1:N),z(1:N),size2,color,'filled');
    axis equal
    axis([x(1) - xs/10, x(1) + xs/10,y(1) - xs/10, y(1) + xs/10,z(1) - xs/10, z(1) + xs/10])
    axis manual
    xlabel('x-coordinate(zoomed)','FontSize',6,'FontWeight','bold')
    ylabel('y-coordinate(zoomed)','FontSize',6,'FontWeight','bold')
    zlabel('z-coordinate(zoomed)','FontSize',6,'FontWeight','bold')    

    pause(0.00001) %pause for a short time to see the animation more clearly
    
    flag = 0;
    
    %setting collision condition distance
    rr = 89 * 10^9;
    
    %First and second for loop does not overlap so that we can go over all the elements and also make the computation efficient
    for i = 1:N
        
        for j = i+1:N

            %calculating dx, dy, dz
            dx = x(i)-x(j);
            dy = y(i)-y(j);
            dz = z(i)-z(j);
            r = sqrt(dx^2+dy^2 +dz^2);  %Calculation for r(distance between objects)
            if r < rr    %condition for collision
                u(i) = (M(i)*u(i) + M(j)*u(j))/(M(i)+M(j));
                v(i) = (M(i)*v(i) + M(j)*v(j))/(M(i)+M(j));
                w(i) = (M(i)*w(i) + M(j)*w(j))/(M(i)+M(j));
                x(i) = (M(i)*x(i) + M(j)*x(j))/(M(i)+M(j));
                y(i) = (M(i)*y(i) + M(j)*y(j))/(M(i)+M(j));
                z(i) = (M(i)*z(i) + M(j)*z(j))/(M(i)+M(j));
                M(i) = M(i) + M(j);

                %Updating the information after the collision
                
                 if j < N
                    M(j:N-1)=M(j+1:N);
                    u(j:N-1)=u(j+1:N);
                    v(j:N-1)=v(j+1:N);
                    w(j:N-1)=w(j+1:N);
                    x(j:N-1)=x(j+1:N);
                    y(j:N-1)=y(j+1:N);
                    z(j:N-1)=z(j+1:N);

                    %Moving the array index to fit in after the collision

                end
                
                N = N-1; %updating the number of bodies

                %Updating the size and color arrays to fit in the new N
                size1(j) = [];
                size2(j) = [];
                color(j,:) = [];


                flag = 1;
                break
            end
        end
        
        if flag == 1
            break
        end
    end
end


%blocks of code and explain in write up
