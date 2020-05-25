% Analyze Data for 

g=[0.5,0.9,0.95];

ls_all=[20:20:100,150:50:500]/5;
z=100;

load('C:\Projects\WavefrontShaping\FiguresForPaper\PSF_Degrade\widthxyall.mat')



for ii=1:3
   semilogy(z./ls_all(1:end),(widthxyall(ii,1:end)),'.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('z/l_s')
   ylabel('\sigma_{PSF}(um)')
   yticks([10^0 10 10^2])
   title('Lateral PSF')
   legend('g=0.8','g=0.9','g=0.95')
set(gca,'fontsize', 18)
axis([0 20 0 200])
legend('boxoff')
%%
figure
for ii=1:3
   semilogy(z./ls_all(1:end),widthzzall(ii,1:end),'.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('z/l_s')
   ylabel('\sigma_{PSF} (um)')
   title('Axial PSF')
legend('g=0.5','g=0.9','g=0.95')

set(gca,'fontsize', 18)
axis([0 20 0 200])
yticks([10^0 10 10^2])
%%

figure
for ii=1:3
   semilogy(z./ls_all,widthzzall(ii,:)./widthxyall(ii,:),'.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('z/l_s')
   ylabel('FWHM (um)')
   title('Axial/Laterl PSF')
legend('g=0.5','g=0.9','g=0.95')

%% effective NA

NA=0.5;

ls_all=[20:20:100,150:50:500]/5;
z=100;
NA_eff=NA./sqrt(1+z./ls_all/4*NA^2);
load('C:\Projects\WavefrontShaping\FiguresForPaper\EffectiveNA\PSF.mat'); % 30-100 um
figure
for ii=1:3
   plot(1./NA_eff(6:end),widthxyall(ii,6:end),'.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('1/NA_{eff}')
   ylabel('\sigma_{PSF} (um)')
   title('Lateral PSF vs. NA_{eff}')
legend('g=0.5','g=0.9','g=0.95')


%%
% NA=0.5;
% 
% ls_all=[20:20:100,150:50:500]/5;
% z=100;
% NA_eff=NA./sqrt(1+z./ls_all/4*NA^2);
% load('C:\Projects\WavefrontShaping\FiguresForPaper\EffectiveNA\PSF.mat')
% figure
% for ii=1:3
%    plot(1./NA_eff(6:end).^2,widthzzall(ii,6:end),'.-');hold on; 
%     
% end
% set(gcf, 'unit', 'inches')
%    set(gcf, 'position',[1,1,4,3])
%    xlabel('1/NA_{eff}')
%    ylabel('Lateral \sigma_{PSF} (um)')
%    title('')
% legend('g=0.5','g=0.9','g=0.95')


%% PeakIntensity
load('C:\Projects\WavefrontShaping\FiguresForPaper\EffectiveNA\PeakI_center.mat');


PeakI=PeakI/I0;


g=[0.5,0.9,0.95];

ls_all=[20:20:100,150:50:500]/5;
z=100;

for ii=1:3
   plot(z./ls_all,log(PeakI(ii,:)/40),'.-');hold on; 
    
end
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,4,3])
   xlabel('z/l_s')
   ylabel('ln (I/I_0)')
   title('Peak Intensity')
   legend('g=0.8','g=0.9','g=0.95')
%legend('boxoff')

set(gca,'fontsize', 18)
axis([0 20 -7 0])


