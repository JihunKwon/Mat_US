%TVvsVPD50 (Only for saline. Treated group by RT or GNP+RT are uncomparable)
% (1) Calculate tumor growth rate between day 0 and week 1 from US
% (2) Get VPD50 at day 0
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
i = 1;
for k = 1:9
    if (k == 3 || k == 5 || k == 8) %Saline
        Day0 = TP2DayWeek(k,1);
        Week1 = TP2DayWeek(k,2);
        TgRate = TVolume(k+1,Week1+1)/TVolume(k+1,Day0+1);
        TgSub = TVolume(k+1,Week1+1) - TVolume(k+1,Day0+1);

        VPD_50 = VPD50(k,1:9);
        VPD_50(VPD_50 == 0) = [];
        VPD_50 = VPD_50(1);

        figure(11); hold on;
        color = colors(i,:);
        i1(i) = plot(VPD_50,TgRate,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        figure(12); hold on;
        i2(i) = plot(VPD_50,TgSub,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        i = i+1;
    end
    
end

%% Plot
map = colors;
colormap(map);
figure(11);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('VPD_{50} at day 0 vs 1 week growth rate, Saline');
xlim([0 0.6]);
ylim([0 3.5]);
xlabel('VPD_{50} (mm)');
ylabel('Tumor grwoth rate');
hold on;
legend(i1,'Animal24','Animal34','Animal52','Location','southeast');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgRatevsVPD50.eps');
print(gcf, fname, '-depsc2');

figure(12);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('VPD_{50} at day 0 vs 1 week growth, Saline');
xlim([0 0.6]);
ylim([0 2000]);
xlabel('VPD_{50} (mm)');
ylabel('Tumor grwoth (mm^3)');
hold on;
legend(i2,'Animal24','Animal34','Animal52','Location','southeast');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgSubvsVPD50.eps');
print(gcf, fname, '-depsc2');