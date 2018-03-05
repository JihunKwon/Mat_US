%TVvsPerfusion
% (1) Calculate tumor growth rate between day 0 and week 1 from US
% (2) Get perfusion (Vessel Volume) at day 0
% (3) plot (1) vs (2)

TP2Day = xlsread('TP2Days.xlsx');
TP2DayWeek = xlsread('TP2DayWeek.xlsx');
N = 3;
colors = jet(N);
%1:12, 2:15, 3:24, 4:33, 5:34, 6:35, 7:51, 8:52, 9:55

%% Get TumorGrowthRate (TgRate), TumorGrowthSubtraction (TgSub)
hold off;  
figure(11); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(12); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(13); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(14); clf('reset'); set(gcf,'Position',[391 1 873 805]);
i = 1;
for k = 1:9
    if (k == 3 || k == 5 || k == 8) %Saline
        Day0 = TP2DayWeek(k,1);
        Week1 = TP2DayWeek(k,2);
        TgRate = TVolume(k+1,Week1+1)/TVolume(k+1,Day0+1);
        TgSub = TVolume(k+1,Week1+1) - TVolume(k+1,Day0+1);

        VV = VVolume(k+1,2:10);
        VV(VV == 0) = [];
        VV = VV(1);
        VD = VDens(k+1,2:10);
        VD(VD == 0) = [];
        VD = VD(1);

        %Vessel Volume%
        figure(11); hold on;
        color = colors(i,:);
        k1(i) = plot(VV,TgRate,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        figure(12); hold on;
        k2(i) = plot(VV,TgSub,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        %Veesel Density%
        figure(13); hold on;
        k3(i) = plot(VD,TgRate,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        figure(14); hold on;
        k4(i) = plot(VD,TgSub,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        i = i+1;
    end
end

%% Plot
map = colors;
colormap(map);
figure(11);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Perfusion at day 0 vs 1 week growth rate');
xlim([0 700]);
ylim([0 3.6]);
xlabel('Initial perfusion (mm^3)');
ylabel('Tumor grwoth rate');
hold on;
legend(k1,'Animal24','Animal34','Animal52','Location','SE');
legend boxon;
%plot(x,y,'Color',[0,0,0]);%Plot R-square
%text(6.2, 6, ['R^2 = ' num2str(R2)],'FontSize',20);
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgRatevsPerfusion.eps');
print(gcf, fname, '-depsc2');

figure(12);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Perfusion at day 0 vs 1 week growth');
xlim([0 700]);
ylim([0 2000]);
xlabel('Initial perfusion (mm^3)');
ylabel('Tumor grwoth (mm^3)');
hold on;
legend(k2,'Animal24','Animal34','Animal52','Location','SE');
legend boxon;
%plot(x,y,'Color',[0,0,0]);%Plot R-square
%text(6.2, 6, ['R^2 = ' num2str(R2)],'FontSize',20);
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgSubvsPerfusion.eps');
print(gcf, fname, '-depsc2');

figure(13);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('VD at day 0 vs 1 week growth rate');
xlim([0 80]);
ylim([0 3.5]);
xlabel('Vessel density (%)');
ylabel('Tumor grwoth rate');
hold on;
legend(k3,'Animal24','Animal34','Animal52','Location','SE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgRatevsVD.eps');
print(gcf, fname, '-depsc2');

figure(14);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('VD at day 0 vs 1 week growth');
xlim([0 80]);
ylim([0 3000]);
xlabel('Vessel density (%)');
ylabel('Tumor grwoth (mm^3)');
hold on;
legend(k4,'Animal24','Animal34','Animal52','Location','SE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgSubvsVD.eps');
print(gcf, fname, '-depsc2');

