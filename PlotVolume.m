%Come from DDMAnalysis
% (1) plot the Tumor Volume (TV)  
% (2) plot Vessel Volume (VV)
% (3) plot Vessel Density (VD).
% (4) plot Total Core Vessel Density
% (5) plot Core Vessel Density normazlied weighting(CoreVDnor)

%Convert voxel to volume
VoxelVolume = 0.0606 * 0.5625 * 0.49; % [mm]
%TVmm = TVolume * VoxelVolume;
%Plot tumor volume
TP2Day = xlsread('TP2Days.xlsx');

%1:12, 2:15, 3:24, 4:33, 5:34, 6:35, 7:51, 8:52, 9:55

%% Plot TV, VV, and VD

N = 70; X = linspace(0,pi*3,1000); 
C = linspecer(N);
hold off;  
figure(11); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(12); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(13); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(14); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(15); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(16); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(21); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(22); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(23); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(24); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(25); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(26); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(31); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(32); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(33); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(34); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(35); clf('reset'); set(gcf,'Position',[440   378   560   420]);
figure(36); clf('reset'); set(gcf,'Position',[440   378   560   420]);

for k = 1:9
    Day = TP2Day(k,:);
    Day(isnan(Day)) = [];
    TV = TVolume(k+1,2:10);
    TV(TV == 0) = [];
    TVnorm = TV/TV(1);
    TVnorm(TVnorm == 0) = [];
    VV = VVolume(k+1,2:10);
    VV(VV == 0) = [];
    VVnorm = VV/VV(1);
    VVnorm(VVnorm == 0) = [];
    VD = VV./TV*100;
    
    CoreVDlin = TotCoreVDlin(k,1:9);
    CoreVDlin(CoreVDlin == 0) = [];
    
%     CoreVDnor = TotCoreVDnorm(k,1:9);
%     CoreVDnor(CoreVDnor == 0) = [];
    
    if (k == 3 || k == 5 || k == 8) %Saline
        n = 1;
        if k == 3
            figure(11); hold on;
            plot(Day,TV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(12); hold on;
            plot(Day,TVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(13); hold on;
            plot(Day,VV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(14); hold on;
            plot(Day,VVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(15); hold on;
            plot(Day,VD,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(16); hold on;
            plot(Day,CoreVDlin,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(17); hold on;
%             plot(Day,CoreVDnor,'-o','LineWidth',2,'MarkerSize',10);
%             hold off;
        elseif k == 5
            figure(11); hold on;
            plot(Day,TV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(12); hold on;
            plot(Day,TVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(13); hold on;
            plot(Day,VV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(14); hold on;
            plot(Day,VVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(15); hold on;
            plot(Day,VD,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(16); hold on;
            plot(Day,CoreVDlin,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(17); hold on;
%             plot(Day,CoreVDnor,'-+','LineWidth',2,'MarkerSize',10);
%             hold off;
        else
            figure(11); hold on;
            plot(Day,TV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(12); hold on;
            plot(Day,TVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(13); hold on;
            plot(Day,VV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(14); hold on;
            plot(Day,VVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(15); hold on;
            plot(Day,VD,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(16); hold on;
            plot(Day,CoreVDlin,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(17); hold on;
%             plot(Day,CoreVDnor,'-*','LineWidth',2,'MarkerSize',10);
%             hold off;
        end
        hold off;

    elseif (k == 1 || k == 4 || k == 9) %RT
        if k == 1
            figure(21); hold on;
            plot(Day,TV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(22); hold on;
            plot(Day,TVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(23); hold on;
            plot(Day,VV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(24); hold on;
            plot(Day,VVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(25); hold on;
            plot(Day,VD,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(26); hold on;
            plot(Day,CoreVDlin,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(27); hold on;
%             plot(Day,CoreVDnor,'-o','LineWidth',2,'MarkerSize',10);
%             hold off;
        elseif k == 4
            figure(21); hold on;
            plot(Day,TV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(22); hold on;
            plot(Day,TVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(23); hold on;
            plot(Day,VV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(24); hold on;
            plot(Day,VVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(25); hold on;
            plot(Day,VD,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(26); hold on;
            plot(Day,CoreVDlin,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(27); hold on;
%             plot(Day,CoreVDnor,'-+','LineWidth',2,'MarkerSize',10);
%             hold off;
        else
            figure(21); hold on;
            plot(Day,TV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(22); hold on;
            plot(Day,TVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(23); hold on;
            plot(Day,VV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(24); hold on;
            plot(Day,VVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(25); hold on;
            plot(Day,VD,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(26); hold on;
            plot(Day,CoreVDlin,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(27); hold on;
%             plot(Day,CoreVDnor,'-*','LineWidth',2,'MarkerSize',10);
%             hold off;
        end
    elseif (k == 2 || k == 6 || k == 7) %GNP+RT
        if k == 2
            figure(31); hold on;
            plot(Day,TV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(32); hold on;
            plot(Day,TVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(33); hold on;
            plot(Day,VV,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(34); hold on;
            plot(Day,VVnorm,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(35); hold on;
            plot(Day,VD,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(36); hold on;
            plot(Day,CoreVDlin,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(37); hold on;
%             plot(Day,CoreVDnor,'-o','LineWidth',2,'MarkerSize',10);
%             hold off;
        elseif k == 6
            figure(31); hold on;
            plot(Day,TV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(32); hold on;
            plot(Day,TVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(33); hold on;
            plot(Day,VV,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(34); hold on;
            plot(Day,VVnorm,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(35); hold on;
            plot(Day,VD,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(36); hold on;
            plot(Day,CoreVDlin,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(37); hold on;
%             plot(Day,CoreVDnor,'-+','LineWidth',2,'MarkerSize',10);
%             hold off;
        else
            figure(31); hold on;
            plot(Day,TV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(32); hold on;
            plot(Day,TVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(33); hold on;
            plot(Day,VV,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(34); hold on;
            plot(Day,VVnorm,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(35); hold on;
            plot(Day,VD,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(36); hold on;
            plot(Day,CoreVDlin,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
%             figure(37); hold on;
%             plot(Day,CoreVDnor,'-*','LineWidth',2,'MarkerSize',10);
%             hold off;
        end
    else
        disp('No such Animal!!');
    end
end

%% Add labels
%Saline Start%
figure(11); %Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume, Saline');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TV_Saline.eps', '-depsc2');

figure(12); %Normalized Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume, Saline');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnorm_Saline.eps', '-depsc2');

figure(13); %Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Volume, Saline');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VV_Saline.eps', '-depsc2');

figure(14); %Normalized Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Vessel Volume, Saline');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VVnorm_Saline.eps', '-depsc2');

figure(15); %Vessel Density
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density, Saline');
xlabel('Days');  ylabel('Vessel density [%]')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VD_Saline.eps', '-depsc2');

figure(16); %Total Core Vessel Density (Liner Int)
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Core Vessel Density (Linear), Saline');
xlabel('Days');  ylabel('Core Vessel density [%]')
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
xlim([0 70]);
ylim([0 100]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'CoreVDlin_Saline.eps', '-depsc2');

% figure(17); %Total Core Vessel Density (Norm Int)
% set(gca, 'LineWidth', 2, 'FontSize', 20);
% title('Core Vessel Density (Normalized), Saline');
% xlabel('Days');  ylabel('Core Vessel density [%]')
% legend('Animal24','Animal34','Animal52','Location','northeast');
% legend boxoff;
% xlim([0 70]);
% ylim([0 100]);
% set(gcf, 'PaperPositionMode', 'Auto');
% print(gcf, 'CoreVDnor_Saline.eps', '-depsc2');
%Saline End%

%RT Start%
figure(21); %Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume, RT');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TV_RT.eps', '-depsc2');

figure(22); %Normalized Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume, RT');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnorm_RT.eps', '-depsc2');

figure(23); %Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Volume, RT');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VV_RT.eps', '-depsc2');

figure(24); %Normalized Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Vessel Volume, RT');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VVnorm_RT.eps', '-depsc2');

figure(25); %Vessel Density
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density, RT');
xlabel('Days');  ylabel('Vessel density [%]')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VD_RT.eps', '-depsc2');

figure(26); %Total Core Vessel Density (Liner Int)
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Core Vessel Density (Linear), RT');
xlabel('Days');  ylabel('Core Vessel density [%]')
legend('Animal12','Animal33','Animal55','Location','northeast');
legend boxoff;
xlim([0 70]);
ylim([0 100]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'CoreVDlin_RT.eps', '-depsc2');

% figure(27); %Total Core Vessel Density (Norm Int)
% set(gca, 'LineWidth', 2, 'FontSize', 20);
% title('Core Vessel Density (Normalized), RT');
% xlabel('Days');  ylabel('Core Vessel density [%]')
% legend('Animal12','Animal33','Animal55','Location','northeast');
% legend boxoff;
% xlim([0 70]);
% ylim([0 100]);
% set(gcf, 'PaperPositionMode', 'Auto');
% print(gcf, 'CoreVDnor_RT.eps', '-depsc2');
%RT End%

%GNP+RT Start%
figure(31); %Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume, GNP+RT');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TV_GNP+RT.eps', '-depsc2');

figure(32); %Normalized Tumor Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume, GNP+RT');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnorm_GNP+RT.eps', '-depsc2');

figure(33); %Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Volume, GNP+RT');
xlabel('Days');  ylabel('Volume [mm^3]')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VV_GNP+RT.eps', '-depsc2');

figure(34); %Normalized Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Vessel Volume, GNP+RT');
xlabel('Days');  ylabel('Normalized volume')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VVnorm_GNP+RT.eps', '-depsc2');

figure(35); %Vessel Density
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density, GNP+RT');
xlabel('Days');  ylabel('Vessel density [%]')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VD_GNP+RT.eps', '-depsc2');

figure(36); %Total Core Vessel Density (Liner Int)
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Core Vessel Density (Linear), GNP+RT');
xlabel('Days');  ylabel('Core Vessel density [%]')
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
xlim([0 70]);
ylim([0 100]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'CoreVDlin_GNP+RT.eps', '-depsc2');

% figure(37); %Total Core Vessel Density (Norm Int)
% set(gca, 'LineWidth', 2, 'FontSize', 20);
% title('Core Vessel Density (Normalized), GNP+RT');
% xlabel('Days');  ylabel('Core Vessel density [%]')
% legend('Animal15','Animal35','Animal51','Location','northeast');
% legend boxoff;
% xlim([0 70]);
% ylim([0 100]);
% set(gcf, 'PaperPositionMode', 'Auto');
% print(gcf, 'CoreVDnor_GNP+RT.eps', '-depsc2');
%GNP+RT End%

