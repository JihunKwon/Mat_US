%% plot VPD, Gradient of CumulativeVD, CoreVD
%% All animals together

%Plot tumor volume
TP2Day = xlsread('TP2Days.xlsx');
%1:12, 2:15, 3:24, 4:33, 5:34, 6:35, 7:51, 8:52, 9:55

hold off;  
figure(11); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(12); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(13); clf('reset'); set(gcf,'Position',[391 1 873 805]);

for k = 1:9
    Day = TP2Day(k,:);
    Day(isnan(Day)) = [];
    
    MyVPD90 = VPD90(k,1:9);
    MyVPD90(MyVPD90 == 0) = [];
    
    Gr = Grad(k,1:9);
    Gr(Gr == 0) = [];
    
    CoreVDlin = TotCoreVDlin(k,1:9);
    CoreVDlin(CoreVDlin == 0) = [];
    
    if (k == 3 || k == 5 || k == 8) %Saline
        if k == 3
            figure(11); hold on;
            plot(Day,MyVPD90,'-o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerFaceColor',[0 .447 .741],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'-o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerFaceColor',[0 .447 .741],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'-o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerFaceColor',[0 .447 .741],'MarkerSize',15);
            hold off;
        elseif k == 5
            figure(11); hold on;
            plot(Day,MyVPD90,'--o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'--o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'--o','LineWidth',2,'Color',[0 .447 .741],'MarkerEdgeColor',[0 .447 .741],'MarkerSize',15);
            hold off;
        else %Ignore Animal 52 (k == 8)
        end
        hold off;

    elseif (k == 1 || k == 4 || k == 9) %RT
        if k == 1
            figure(11); hold on;
            plot(Day,MyVPD90,'-s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerFaceColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'-s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerFaceColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'-s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerFaceColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
        elseif k == 4 %Ignore Animal 33 (k == 4)
        else
            figure(11); hold on;
            plot(Day,MyVPD90,'--s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'--s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'--s','LineWidth',2,'Color',[.85 .325 .098],'MarkerEdgeColor',[.85 .325 .098],'MarkerSize',15);
            hold off;
        end
    elseif (k == 2 || k == 6 || k == 7) %GNP+RT
        if k == 2
            figure(11); hold on;
            plot(Day,MyVPD90,'-^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'-^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'-^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
        elseif k == 6
            figure(11); hold on;
            plot(Day,MyVPD90,'--^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,'--^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            figure(13); hold on;
            plot(Day,CoreVDlin,'--^','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
        else
            figure(13); hold on;
            plot(Day,CoreVDlin,':v','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            Day(4) = []; %VPD and Gradient cannot plot zero
            figure(11); hold on;
            plot(Day,MyVPD90,':v','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
            figure(12); hold on;
            plot(Day,Gr,':v','LineWidth',2,'Color',[.929 .694 .125],'MarkerEdgeColor',[.929 .694 .125],'MarkerFaceColor',[.929 .694 .125],'MarkerSize',15);
            hold off;
        end
    else
        disp('No such Animal!!');
    end
end

%% Add labels
%VPD
figure(11);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Penetration Depth');
xlim([0 70]); ylim([0.1 0.3]);
xlabel('Days'); ylabel('Depth (mm)');
legend('Animal12,RT','Animal15,GNP+RT','Animal24,Saline','Animal34,Saline','Animal35,GNP+RT','Animal51,GNP+RT','Animal55,RT','Location','northeast');
legend boxoff;
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VPD90_all_chosen.eps', '-depsc2');

%Gr of Cumulative VD
figure(12);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Cumulative VD Gradient');
xlim([0 70]); ylim([-40 -5]);
xlabel('Days');  ylabel('Gradient')
legend('Animal12,RT','Animal15,GNP+RT','Animal24,Saline','Animal34,Saline','Animal35,GNP+RT','Animal51,GNP+RT','Animal55,RT','Location','southeast');
legend boxoff;
xlim([0 70]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'Gradient_all_chosen.eps', '-depsc2');

%Core VD
figure(13); %Vessel Volume
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Core Vessel Density');
xlabel('Days');  ylabel('Core Vessel density [%]')
legend('Animal12,RT','Animal15,GNP+RT','Animal24,Saline','Animal34,Saline','Animal35,GNP+RT','Animal51,GNP+RT','Animal55,RT','Location','southeast');
legend boxoff;
xlim([0 70]); ylim([0 90]);
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'CoreVDlin_all_chosen.eps', '-depsc2');