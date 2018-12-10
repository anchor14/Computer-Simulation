%velocity function
global dmin dmax vmax
dmin = 1;
dmax = 5;
vmax = 20;

%auxiliary constants
prchoice=0.1;
R=0.01;
dt=0.01;
clockmax=1000;

%cars
nc=0;
cmax=1000;
p=zeros(1,cmax);
x=zeros(1,cmax);
y=zeros(1,cmax);
onroad=zeros(1,cmax);
nextcar=zeros(1,cmax);
nextb=zeros(1,cmax);
tenter=zeros(1,cmax);
texit=zeros(1,cmax);
benter=zeros(1,cmax);
penter=zeros(1,cmax);
bd=zeros(1,cmax);
pd=zeros(1,cmax);

%blocks and intersections
i=[1 2 3 4];
ni=length(i);
b=[1 2 3 4 5 6];
nb=length(b);
firstcar=zeros(1,nb);
lastcar=zeros(1,nb);
i1=[2 1 2 4 3 2];
i2=[3 4 1 2 1 2];
nbin=zeros(1,ni);
nbout=zeros(1,ni);
for i=1:ni
    nbin(i)=sum(i2==i);
    nbout(i)=sum(i1==i);
end
nbinmax=max(nbin);
nboutmax=max(nbout);
bin=zeros(ni,nbinmax);
bout=zeros(ni,nboutmax);
for i=1:ni
    bin(i,1:nbin(i))=find(i2==i);
    bout(i,1:nbout(i))=find(i1==i);
end

%geometry of roads
xi=[25 -25 -25 25];
yi=[-25 25 -25 25];
ux=xi(i2)-xi(i1);
uy=yi(i2)-yi(i1);
L=sqrt(ux.^2+uy.^2);
ux=ux./L;
uy=uy./L;
Lmax=max(L);

%lights
jgreen=ones(1,ni);
tlcstep=10*dt;
tlc=tlcstep;

%plot initial graph
for b=1:nb
    line([xi(i1(b)) yi(i1(b))],[xi(i2(b)) yi(i2(b))])
    hold on
end
hcars = scatter(x(find(onroad)),y(find(onroad)),'filled');
axis(1.2*[min(xi) max(xi) min(yi) max(yi)])
axis manual