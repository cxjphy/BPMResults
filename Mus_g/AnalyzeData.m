%%

%legend('\sigma_x=0.5*\Delta_x','\sigma_x=\Delta_x','\sigma_x=2*\Delta_x','\sigma_x=4*\Delta_x','\sigma_x=8*\Delta_x','\mu_s (input)=\mu_s (fitting)')
legend('\sigma_x=\lambda/4','\sigma_x=\lambda/2','\sigma_x=\lambda','\sigma_x=2\lambda','\sigma_x=4\lambda')


%legend('\lambda/4','\lambda/2','\lambda','2\lambda','4\lambda','\mu_s (input)=\mu_s (fitting)')

set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,6,4])

   set(gca,'fontsize', 22)
   xlabel('input \mu_s (\mum ^{-1})')
   ylabel('measured \mu_s (\mum^{-1})')
   axis([0 0.04 0 0.04])
%%
load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\gall_4.mat')

plot(factor,smooth(gall),'b.-');
xlabel('\sigma_x/\Delta_x');
ylabel('g')
set(gca,'fontsize', 18)
%%
d=10;
Nl=20;

load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\pi_5.mat')
I=I(1:Nl);
plot((0:Nl-1)*d,log(I/I(1)),'b');hold on

load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\pi_10.mat')
I=I(1:Nl);
plot((0:Nl-1)*d,log(I/I(1)),'k--');hold on

load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\pi_20.mat')
I=I(1:Nl);
plot((0:Nl-1)*d,log(I/I(1)),'r.-');hold on

axis([0 180 -4 0])

xlabel('z (\mu m)')
ylabel('ln (I_{DC})')
legend('\sigma_p=\pi/5','\sigma_p=\pi/10','\sigma_p=\pi/20')
set(gca,'fontsize', 22)

%%



legend('\sigma_x=0.5\Delta_x','\sigma_x=\Delta_x','\sigma_x=2\Delta_x','\sigma_x=4\Delta_x','\sigma_x=8\Delta_x')
set(gca,'fontsize', 18)

 xlabel('input \mu_s (\mu m)')
 ylabel('measured \mu_s (\mu m)')
 
 %%
 
 load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\gall_1layer.mat');
 plot(factor_x/2,gall,'r*--'); hold on;
 
 load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\gall_5layer.mat')
plot(factor_x/2,gall,'b.--');
 load('C:\Projects\WavefrontShaping\FiguresForPaper\Mus_g\gall_10layer.mat')
plot(factor_x/2,gall,'ko--');
 xlabel('\sigma_x/\lambda');
ylabel('g')
set(gca,'fontsize', 22)
legend('z/d=1','z/d=5','z/d=10')
axis([0 5 0.79 1])
set(gcf, 'unit', 'inches')
   set(gcf, 'position',[1,1,6,4])
   xticks(0:5)
% set(gcf, 'unit', 'inches')
%    set(gcf, 'position',[1,1,4,3])
 