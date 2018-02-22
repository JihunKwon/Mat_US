%% TVvsCoreVD
% This function use only good data. 
% Images that core vessel was dead from the initial timepoints is excluded.

h1 = 0; h2 = 0; h3 = 0;
h4 = 0; h5 = 0; h6 = 0; h7 = 0; h8 = 0;
figure(64); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(65); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(66); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(67); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(68); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(69); clf('reset'); set(gcf,'Position',[391 1 873 805]);

%Convert day into day&week. 70 colors are too much.
TP2Day = xlsread('TP2Days.xlsx');
Day2DayWeek = zeros(9,9);
for k = 1:9
    for l = 1:9
        if (0 <= TP2Day(k,l) && TP2Day(k,l) <= 3)
            Day2DayWeek(k,l) = TP2Day(k,l);
        elseif (7 <= TP2Day(k,l) && TP2Day(k,l) <= 8)
            Day2DayWeek(k,l) = 4; % Week1
        elseif (15 <= TP2Day(k,l) && TP2Day(k,l) <= 16)
            Day2DayWeek(k,l) = 5; % Week2
        elseif (28 <= TP2Day(k,l) && TP2Day(k,l) <= 29)
            Day2DayWeek(k,l) = 6; % Week4
        elseif (35 <= TP2Day(k,l) && TP2Day(k,l) <= 36)
            Day2DayWeek(k,l) = 7; % Week5
        elseif (57 <= TP2Day(k,l) && TP2Day(k,l) <= 63)
            Day2DayWeek(k,l) = 8; % Week9
        elseif (70 <= TP2Day(k,l) && TP2Day(k,l) <= 71)
            Day2DayWeek(k,l) = 9; % Week10
        else
            %disp('No such Animal!');
        end
    end
end

%colors = parula(10);
%colors = jet(71);
N = 71;
X = linspace(0,pi*3,1000);
colors = linspecer(N);

i1 = 1;
i2 = 1;
i3 = 1;
for k = 1:9
    if k == 3 %Saline
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(64); hold on;
                h1(i1) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(67); hold on; % Has to be devided by its first value (sometimes tp2, tp3, ...)
                h4(i1) = plot(TVolume(k+1,l+1)/TVolume(k+1,3),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i1 = i1+1;
            end
        end
    elseif k == 5
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(64); hold on;
                h1(i1) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(67); hold on;
                h4(i1) = plot(TVolume(k+1,l+1)/TVolume(k+1,4),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i1 = i1+1;
            end
        end
    elseif k == 8
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(64); hold on;
                h1(i1) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(67); hold on;
                h4(i1) = plot(TVolume(k+1,l+1)/TVolume(k+1,4),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i1 = i1+1;
            end
        end
    elseif k == 1 %RT
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(65); hold on;
                h2(i2) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(68); hold on;
                h5(i2) = plot(TVolume(k+1,l+1)/TVolume(k+1,2),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i2 = i2+1;
            end
        end
    elseif k == 4
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(65); hold on;
                h2(i2) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(68); hold on;
                h5(i2) = plot(TVolume(k+1,l+1)/TVolume(k+1,3),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i2 = i2+1;
            end
        end
    elseif k == 9
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(65); hold on;
                h2(i2) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(68); hold on;
                h5(i2) = plot(TVolume(k+1,l+1)/TVolume(k+1,3),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i2 = i2+1;
            end
        end
    elseif k == 2 %GNP+RT
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(66); hold on;
                h3(i3) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(69); hold on;
                h6(i3) = plot(TVolume(k+1,l+1)/TVolume(k+1,6),TotCoreVDlin(k,l),'o','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i3 = i3+1;
            end
        end
    elseif k == 6
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(66); hold on;
                h3(i3) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(69); hold on;
                h6(i3) = plot(TVolume(k+1,l+1)/TVolume(k+1,2),TotCoreVDlin(k,l),'^','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i3 = i3+1;
            end
        end
    elseif k == 7
        for l = 1:9
            if TotCoreVDlin(k,l) == 0
            else
                %d = Day2DayWeek(k,l); %Make 0 day into 1
                d = TP2Day(k,l);
                color = colors(d+1,:);
                figure(66); hold on;
                h3(i3) = plot(TVolume(k+1,l+1),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                figure(69); hold on;
                h6(i3) = plot(TVolume(k+1,l+1)/TVolume(k+1,3),TotCoreVDlin(k,l),'s','MarkerEdgeColor','k','MarkerFaceColor',color,'MarkerSize',20);
                hold off;
                i3 = i3+1;
            end
        end
    end
end

%% Linear
figure(64); %Saline
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('TV v.s. CoreVD, Saline');
xlabel('Tumor Volume (mm^3)');  ylabel('Core Vessel Density (%)')
%legend(h1,'Animal24','Animal34','Animal52','Location','northeast');
legend(h1,'Animal 24, Day 0','Animal 24, Day 1','Animal 24, Day 2','Animal 24, Day 8','Animal 24, Day 15',...
    'Animal 34, Day 0','Animal 34, Day 1','Animal 34, Day 7',...
    'Animal 52, Day 0','Animal 52, Day 2','Animal 52, Day 8','Location','southeast');
legend boxon;
xlim([0 4500]); ylim([0 100]);
%colorbar('Ticks',0:0.11111:1,'TickLabels',{'Day 0','Day 1','Day 2','Day 3','Week 1','Week 2','Week 4','Week 5','Week 9','Week 10'});
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_Saline.eps', '-depsc2');


figure(65); %RT
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('TV v.s. CoreVD, RT');
xlabel('Tumor Volume (mm^3)');  ylabel('Core Vessel Density (%)')
%legend(h2,'Animal12','Animal33','Animal55','Location','northeast');
legend(h2,'Animal 12, Day 0','Animal 12, Day 2','Animal 12, Day 3','Animal 12, Day 7','Animal 12, Day 15','Animal 12, Day 36','Animal 12, Day 70',...
    'Animal 33, Day 0','Animal 33, Day 8','Animal 33, Day 15','Animal 33, Day 36',...
    'Animal 55, Day 0','Animal 55, Day 2','Animal 55, Day 8','Animal 55, Day 15','Animal 55, Day 36','Animal 55, Day 70','Location','southeast');
legend boxon;
xlim([0 4500]); ylim([0 100]);
%colorbar('Ticks',0:0.11111:1,'TickLabels',{'Day 0','Day 1','Day 2','Day 3','Week 1','Week 2','Week 4','Week 5','Week 9','Week 10'});
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_RT.eps', '-depsc2');

figure(66); %GNP+RT
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('TV v.s. CoreVD, GNP+RT');
xlabel('Tumor Volume (mm^3)');  ylabel('Core Vessel Density (%)')
%legend(h3,'Animal15','Animal35','Animal51','Location','northeast');
legend(h3,'Animal 15, Day 0','Animal 15, Day 8','Animal 15, Day 29','Animal 15, Day 63',...
    'Animal 35, Day 0','Animal 35, Day 2','Animal 35, Day 7','Animal 35, Day 15','Animal 35, Day 36','Animal 35, Day 70',...
    'Animal 51, Day 0','Animal 51, Day 7','Animal 51, Day 15','Animal 51, Day 36','Location','southeast');
legend boxon;
xlim([0 4500]); ylim([0 100]);
%colorbar('Ticks',0:0.11111:1,'TickLabels',{'Day 0','Day 1','Day 2','Day 3','Week 1','Week 2','Week 4','Week 5','Week 9','Week 10'});
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_GNP+RT.eps', '-depsc2');

%% Normalized Tumor volume vs VD
figure(67); %Saline
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized TV v.s. CoreVD, Saline');
xlabel('Normalized Tumor Volume');  ylabel('Core Vessel Density (%)')
legend(h4,'Animal 24, Day 0','Animal 24, Day 1','Animal 24, Day 2','Animal 24, Day 8','Animal 24, Day 15',...
    'Animal 34, Day 0','Animal 34, Day 1','Animal 34, Day 7',...
    'Animal 52, Day 0','Animal 52, Day 2','Animal 52, Day 8','Location','southeast');
legend boxon;
xlim([0 6]); ylim([0 100]);
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_Saline.eps', '-depsc2');

figure(68); %RT
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized TV v.s. CoreVD, RT');
xlabel('Normalized Tumor Volume');  ylabel('Core Vessel Density (%)')
legend(h5,'Animal 12, Day 0','Animal 12, Day 2','Animal 12, Day 3','Animal 12, Day 7','Animal 12, Day 15','Animal 12, Day 36','Animal 12, Day 70',...
    'Animal 33, Day 0','Animal 33, Day 8','Animal 33, Day 15','Animal 33, Day 36',...
    'Animal 55, Day 0','Animal 55, Day 2','Animal 55, Day 8','Animal 55, Day 15','Animal 55, Day 36','Animal 55, Day 70','Location','southeast');
legend boxon;
xlim([0 6]); ylim([0 100]);
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_RT.eps', '-depsc2');

figure(69); %GNP+RT
%colormap jet;
map = colors;
colormap(map);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized TV v.s. CoreVD, GNP+RT');
xlabel('Normalized Tumor Volume');  ylabel('Core Vessel Density (%)')
legend(h6,'Animal 15, Day 0','Animal 15, Day 8','Animal 15, Day 29','Animal 15, Day 63',...
    'Animal 35, Day 0','Animal 35, Day 2','Animal 35, Day 7','Animal 35, Day 15','Animal 35, Day 36','Animal 35, Day 70',...
    'Animal 51, Day 0','Animal 51, Day 7','Animal 51, Day 15','Animal 51, Day 36','Location','southeast');
legend boxon;
xlim([0 6]); ylim([0 100]);
colorbar('Ticks',0:0.14285:1,'TickLabels',{'Day 0','Day 10','Day 20','Day 30','Day 40','Day 50','Day 60','Day 70'});
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_GNP+RT.eps', '-depsc2');