%TVvsVPDnorm50 (Only for saline. Treated group by RT or GNP+RT are uncomparable)
% (1) Calculate tumor growth rate between day 0 and week 1 from US
% (2) Get VPDnorm50 at day 0
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
j = 1;
for k = 1:9
    if (k == 3 || k == 5 || k == 8) %Saline
        Day0 = TP2DayWeek(k,1);
        Week1 = TP2DayWeek(k,2);
        TgRate = TVolume(k+1,Week1+1)/TVolume(k+1,Day0+1);
        TgSub = TVolume(k+1,Week1+1) - TVolume(k+1,Day0+1);

        VPD_50 = VPDnorm50(k,1:9);
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
        
    elseif (k == 1 || k == 4 || k == 9) %RT
        Day0 = TP2DayWeek(k,1);
        Week1 = TP2DayWeek(k,2);
%         TgRate = TVolume(k+1,Week1+1)/TVolume(k+1,Day0+1);
%         TgSub = TVolume(k+1,Week1+1) - TVolume(k+1,Day0+1);
        TgRate = TVolume(k+1,8+1)/TVolume(k+1,Day0+1);
        TgSub = TVolume(k+1,8+1) - TVolume(k+1,Day0+1);
        VPD_50 = VPDnorm50(k,1:9);
        VPD_50(VPD_50 == 0) = [];
        VPD_50 = VPD_50(1);

        figure(13); hold on;
        color = colors(j,:);
        j1(j) = plot(VPD_50,TgRate,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        figure(14); hold on;
        j2(j) = plot(VPD_50,TgSub,'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',15);
        hold off;
        j = j+1;
    end
end

%% Plot
map = colors;
colormap(map);
figure(11);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized VPD_{50} at day 0 vs 1 week growth rate, Saline');
xlim([0 60]);
ylim([0 3.5]);
xlabel('Normalized VPD_{50} (%)');
ylabel('One month tumor grwoth rate');
hold on;
legend(i1,'Animal24','Animal34','Animal52','Location','NE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgRatevsVPDnorm50_Saline.eps');
print(gcf, fname, '-depsc2');

figure(12);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized VPD_{50} at day 0 vs 1 week growth, Saline');
xlim([0 60]);
ylim([0 2000]);
xlabel('Normalized VPD_{50} (%)');
ylabel('One month tumor grwoth (mm^3)');
hold on;
legend(i2,'Animal24','Animal34','Animal52','Location','NE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgSubvsVPDnorm50_Saline.eps');
print(gcf, fname, '-depsc2');

figure(13);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized VPD_{50} at day 0 vs 1 month growth rate, RT');
xlim([0 60]);
ylim([0 5.5]);
xlabel('Normalized VPD_{50} (%)');
ylabel('One month tumor grwoth rate');
hold on;
legend(j1,'Animal12','Animal33','Animal55','Location','NE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgRatevsVPDnorm50_RT.eps');
print(gcf, fname, '-depsc2');

figure(14);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized VPD_{50} at day 0 vs 1 month growth, RT');
xlim([0 60]);
ylim([-500 3000]);
xlabel('Normalized VPD_{50} (%)');
ylabel('One month tumor grwoth (mm^3)');
hold on;
legend(j2,'Animal12','Animal33','Animal55','Location','NE');
legend boxon;
set(gcf, 'PaperPositionMode', 'Auto');
fname = sprintf('TgSubvsVPDnorm50_RT.eps');
print(gcf, fname, '-depsc2');