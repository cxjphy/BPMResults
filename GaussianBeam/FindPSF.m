%
NAall=[0.01,0.03,0.05,0.1];


for ii=1:length(NAall)
    
    NA=NAall(ii);
load(['NA_',num2str(NA),'.mat'])

% NA=0.01;

I=abs(i0(end/2,:)).^2;
lambda = 0.5; % um

dx_speckle = lambda/2; 
rho_speckle = lambda/8; % seed density

dx_pixel=rho_speckle; %um
N_obj = [3000,3000];

dx_obj=dx_pixel;
% [x,y] = meshgrid([-N_obj(2)/2:N_obj(2)/2-1]*dx_obj,[-N_obj(1)/2:N_obj(1)/2-1]*dx_obj);


x=[-N_obj(2)/2:N_obj(2)/2-1]*dx_obj;
y=[-N_obj(1)/2:N_obj(1)/2-1]*dx_obj;

fwhm0(ii) = numel(find(I>(max(I)*0.5)))*dx_pixel;

fwhm_calculate(ii)=lambda/2/NA;

end

plot(fwhm0,fwhm_calculate,'o')
