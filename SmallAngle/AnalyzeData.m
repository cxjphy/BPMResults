%%

clc
clear
load('C:\Projects\WavefrontShaping\FiguresForPaper\SmallAngle_Width\Width_xy.mat')
g=[0.99];

% ls_all=[20:20:100,150:50:500]/5;
z=100;


zrel=z./ls_all(1:end);





for ii=1
   plot(z./ls_all(1:end),(widthxyall(ii,1:end)),'b.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('z/l_s')
   ylabel('w (\mum)')
  % title('NA=0.1')
   
   
   hold on
   zrel=z./ls_all(1:end)
   plot(zrel,zrel.^0.5*3.9,'k--');
   %plot(zrel,zrel.^1.5*0.3,'r--')
   
   legend('g=0.99','RTE theory');
   
   set(gca,'fontsize', 18)
   %axis([0 25 0 20])
   
%%
lambda = 0.5; % um


dx_speckle = lambda/2; 
rho_speckle = lambda/4; % seed density

dx_pixel=rho_speckle; %um
N_obj = [3000,3000];

N_diffuser=70;

N_residue=20;% number of layers used to measure axial resolution


d=2;% layer distance
dz=[ones(1,N_diffuser)]*d;



Prop_mode = 1;

% % Define Fourier operators
F = @(x) fftshift(fft2(ifftshift(x)));
Ft = @(x) fftshift(ifft2(ifftshift(x)));

NA = 0.02;

dx_obj=dx_pixel;
[x,y] = meshgrid([-N_obj(2)/2:N_obj(2)/2-1]*dx_obj,[-N_obj(1)/2:N_obj(1)/2-1]*dx_obj);


 
% NA is too large
%N = 500;
% maximum spatial frequency set by NA
um_m = NA/lambda;

waist0 = lambda/NA/pi;% um
g=0.95;

wdiff=2*pi*(1-g)*z*sqrt(1+z./ls_all);
wL=sqrt(waist0^2+wdiff.^2);


hold on
plot(z./ls_all(1:end),wL)
%%
g=[0.95];
factor_x_all=[6.5];

ls_all=[5,10:10:100,150:50:500]/5;

lambda = 0.5; % um

dx_speckle = lambda/2; 
rho_speckle = lambda/4; % seed density

dx_pixel=rho_speckle; %um
N_obj = [3000,3000];

dx_obj=dx_pixel;


N_diffuser=70;

Ixy=zeros(1,N_obj(1));
Izz=zeros(1,N_diffuser+1);

xy=[-N_obj(2)/2:N_obj(2)/2-1]*dx_obj;
d=2;

 load('C:\Projects\WavefrontShaping\FiguresForPaper\SmallAngle_Width\Ixyall.mat')
 
 I0 = 885.4009;
 Ixyall=Ixyall/I0;
 
 for ii=19
    plot(xy,Ixyall(ii,:)/20,'b--') ;hold on;
     
 end


 for ii=14
    plot(xy,Ixyall(ii,:)/20,'r--') ;hold on;
     
 end

for ii=11
    plot(xy,Ixyall(ii,:)/20,'k--') ;hold on;
     
end

% for ii=5
%     plot(xy,(Ixyall(ii,:)/Ixyall(ii,end/2)),'g.') ;hold on;
%      
%     
% end


 

set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('x (\mum)')
   ylabel('I/I_0')
set(gca,'fontsize', 18)
   axis([-10 10 0 0.5])
   
   
   legend('z/l_s=1','z/l_s=2','z/l_s=5')
   
   %%
g=[0.95];
factor_x_all=[6.5];

ls_all=[5,10:10:100,150:50:500]/5;

lambda = 0.5; % um

dx_speckle = lambda/2; 
rho_speckle = lambda/4; % seed density

dx_pixel=rho_speckle; %um
N_obj = [3000,3000];

dx_obj=dx_pixel;


N_diffuser=70;

Ixy=zeros(1,N_obj(1));
Izz=zeros(1,N_diffuser+1);

xy=[-N_obj(2)/2:N_obj(2)/2-1]*dx_obj;
d=2;

 load('C:\Projects\WavefrontShaping\FiguresForPaper\SmallAngle_Width\Ixyall.mat')
 
 I0 = 885.4009;
 Ixyall=Ixyall/I0;
   
   
   
   
 for ii=2
     Ixy=Ixyall(ii,:)/Ixyall(ii,end/2);
    h(1)=plot(xy,(Ixyall(ii,1:end)/Ixyall(ii,end/2)),'b.','Markersize',4) ;hold on;
     
    f = fit(xy.',Ixy.','gauss1')
    
%     f. a1 =      0.8715  (0.8628, 0.8801)
%        b1 =      0.6615  (0.5114, 0.8117)
%        c1 =       18.59  (18.38, 18.8)
    
    
    y =  f.a1.*exp(-((xy-f.b1)/f.c1).^2);
    hold on
    h(2)=plot(xy,y,'k')
    axis([-100 100 0 1])
      
 end

 
  for ii=6
     Ixy=Ixyall(ii,:)/Ixyall(ii,end/2);
   h(3)=plot(xy,(Ixyall(ii,1:end)/Ixyall(ii,end/2)),'r.','Markersize',4) ;hold on;
     
    f = fit(xy.',Ixy.','gauss1')
    
%     f. a1 =      0.8715  (0.8628, 0.8801)
%        b1 =      0.6615  (0.5114, 0.8117)
%        c1 =       18.59  (18.38, 18.8)
    
    
    y =  f.a1.*exp(-((xy-f.b1)/f.c1).^2);
    hold on
    h(4)=plot(xy,y,'k','Markersize',30)
    axis([-80 80 0 1])
      
  end

  set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('x (\mum)')
   ylabel('I/I_p')
set(gca,'fontsize', 18)
legend(h([1 3]),'z/l_s=50', 'z/l_s=10');
