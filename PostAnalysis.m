%This has to be run after importing figures, "DDManalysis_AutoFile.mlx"
% This script does
% (1) Plot Gradient of Cumulative VD
% (2) Plot Vessel Penetration Depth for certain percentage

AnimalID = [12 15 24 33 34 35 51 52 55];

%% Calculate TotalVoxelCount
TotalVoxelCount = zeros(10,10);
CumVD = zeros(9,9,33);
VDD = zeros(9,9,32);
VPD90 = zeros(9,9);
VPD95 = zeros(9,9);
VPD80 = zeros(9,9);
for k = 1:9
    for l = 1:9
        TotalVoxelCount = sum(VoxelCount(k+1,l+1,:));
        for m = 1:33
            if TotalVoxelCount ~= 0
                CumVD(k,l,m) = 100*Count(k+1,l+1,m)/TotalVoxelCount;
            end
        end
        for m = 1:32
            if TotalVoxelCount ~= 0
                VDD(k,l,m) = 100*VoxelCount(k+1,l+1,m)/TotalVoxelCount;
            end
        end
    end
end

%% Fitting CumlativeVD and calcualte Gradient
Grad = zeros(9,9);
for k = 1:9
    for l = 1:9
        %Get two points below and above 90%
        for m = 1:33
            if (CumVD(k,l,m) >= 90) 
                if (90 > CumVD(k,l,m+1))
                    X90_1 = m;
                    X90_2 = m+1;
                    %disp('Here!')
                end
            end
        end
        Y90_1 = CumVD(k,l,X90_1);
        Y90_2 = CumVD(k,l,X90_2);
        
        %Get two points below and above 95%
        for m = 1:33
            if (CumVD(k,l,m) >= 95) 
                if (95 > CumVD(k,l,m+1))
                    X95_1 = m;
                    X95_2 = m+1;
                    %disp('Here!')
                end
            end
        end
        Y95_1 = CumVD(k,l,X95_1);
        Y95_2 = CumVD(k,l,X95_2);

        %Get two points below and above 10%
        for m = 1:33
            if (CumVD(k,l,m) >= 10) 
                if (10 > CumVD(k,l,m+1))
                    X10_1 = m;
                    X10_2 = m+1;
                    %disp('Here!')
                end
            end
        end
        Y10_1 = CumVD(k,l,X10_1);
        Y10_2 = CumVD(k,l,X10_2);

        %Get X value at 90%
        a90 = ((Y90_2-Y90_1)/(X90_2-X90_1)); %Gradient
        b90 = Y90_1 - a90*X90_1;             %Intercept
        X90 = (90-b90)/a90;
        
        %Get X value at 85%
        a95 = ((Y95_2-Y95_1)/(X95_2-X95_1)); %Gradient
        b95 = Y95_1 - a95*X95_1;             %Intercept
        X95 = (95-b95)/a95;
        
        %Get X value at 10%
        a10 = ((Y10_2-Y10_1)/(X10_2-X10_1)); %Gradient
        b10 = Y10_1 - a10*X10_1;             %Intercept
        X10 = (10-b10)/a10;

        LinInt = zeros(2,30);
        %Add original values
        LinInt(1,X90_2:X10_1) = X90_2:X10_1;
        LinInt(2,X90_2:X10_1) = CumVD(k,l,X90_2:X10_1);
        %Add 90% and 10% points
        %Add 90% to first column because X90_2 is always larger than 2
        LinInt(1,1) = X90;
        LinInt(2,1) = 90;
        LinInt(1,X10_1+2) = X10;
        LinInt(2,X10_1+2) = 10;

        %Delete all the zeros
        for n = length(LinInt):-1:1
            if(LinInt(1,n) == 0)
                LinInt(:,n) = [];
            end
        end

%        figure;
        x = LinInt(1,1:length(LinInt(1,:)));
        y = LinInt(2,1:length(LinInt(1,:)));
%        scatter(x,y);
        P = polyfit(x,y,1);
        yfit = P(1)*x+P(2);
%        hold on;
%        plot(x,yfit,'r-.');

        Grad(k,l) = P(1,1);
        Grad(isnan(Grad))=0;
        
        %Vessel Penetration Depth
        VPD90(k,l) = X90/10; %Warning!! X value has to be devided by bin number!
        VPD90(~isfinite(VPD90))=0;
        VPD95(k,l) = X95/10; %Warning!! X value has to be devided by bin number!
        VPD95(~isfinite(VPD95))=0;
    end
end
%% Plot Gradient and VPD

figure(41); clf('reset');
figure(42); clf('reset');
figure(43); clf('reset');
figure(51); clf('reset');
figure(52); clf('reset');
figure(53); clf('reset');

TP2Day = xlsread('TP2Days.xlsx');

%1:12, 2:15, 3:24, 4:33, 5:34, 6:35, 7:51, 8:52, 9:55

for k = 1:9
    Day = TP2Day(k,:);
    Day(isnan(Day)) = [];
    
    Gr = Grad(k,1:9);
    Gr(Gr == 0) = [];
    
    MyVPD90 = VPD90(k,1:9);
    MyVPD90(MyVPD90 == 0) = [];
    
    if (k == 3 || k == 5 || k == 8) %Saline
        if k == 3
            figure(41); hold on;
            plot(Day,Gr,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(51); hold on;
            plot(Day,MyVPD90,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
        elseif k == 5
            figure(41); hold on;
            plot(Day,Gr,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(51); hold on;
            plot(Day,MyVPD90,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
        else
            figure(41); hold on;
            plot(Day,Gr,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(51); hold on;
            plot(Day,MyVPD90,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
        end
        hold off;

    elseif (k == 1 || k == 4 || k == 9) %RT
        if k == 1
            figure(42); hold on;
            plot(Day,Gr,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(52); hold on;
            plot(Day,MyVPD90,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
        elseif k == 4
            figure(42); hold on;
            plot(Day,Gr,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(52); hold on;
            plot(Day,MyVPD90,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
        else
            figure(42); hold on;
            plot(Day,Gr,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(52); hold on;
            plot(Day,MyVPD90,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
        end
    elseif (k == 2 || k == 6 || k == 7) %GNP+RT
        if k == 2
            figure(43); hold on;
            plot(Day,Gr,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(53); hold on;
            plot(Day,MyVPD90,'-o','LineWidth',2,'MarkerSize',10);
            hold off;
        elseif k == 6
            figure(43); hold on;
            plot(Day,Gr,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(53); hold on;
            plot(Day,MyVPD90,'-+','LineWidth',2,'MarkerSize',10);
            hold off;
        else
            Day(4) = [];
            figure(43); hold on;
            plot(Day,Gr,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
            figure(53); hold on;
            plot(Day,MyVPD90,'-*','LineWidth',2,'MarkerSize',10);
            hold off;
        end
    else
        disp('No such Animal!!');
    end
end

%% Add labels
%Saline Start%
figure(41);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Cumulative VD Gradient, Saline');
xlim([0 70]);
ylim([-40 0]);
xlabel('Days');
ylabel('Gradient');
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'Gradient_Saline.eps', '-depsc2');

figure(51);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Penetration Depth, Saline');
xlim([0 70]); ylim([0 0.3]);
xlabel('Days'); ylabel('Depth (mm)');
legend('Animal24','Animal34','Animal52','Location','northeast');
legend boxoff;
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VPD90_Saline.eps', '-depsc2');
%Saline End%

%RT Start%
figure(42);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Cumulative VD Gradient, RT');
xlim([0 70]);
ylim([-40 0]);
xlabel('Days');
ylabel('Gradient');
legend('Animal12','Animal33','Animal55','Location','southeast');
legend boxoff;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'Gradient_RT.eps', '-depsc2');

figure(52);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Penetration Depth, RT');
xlim([0 70]); ylim([0 0.3]);
xlabel('Days'); ylabel('Depth (mm)');
legend('Animal12','Animal33','Animal55','Location','southeast');
legend boxoff;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VPD90_RT.eps', '-depsc2');
%RT End%

%GNP+RT Start%
figure(43);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Cumulative VD Gradient, GNP+RT');
xlim([0 70]);
ylim([-40 0]);
xlabel('Days');
ylabel('Gradient');
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'Gradient_GNP+RT.eps', '-depsc2');

figure(53);
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Penetration Depth, GNP+RT');
xlim([0 70]); ylim([0 0.3]);
xlabel('Days'); ylabel('Depth (mm)');
legend('Animal15','Animal35','Animal51','Location','northeast');
legend boxoff;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VPD90_GNP+RT.eps', '-depsc2');
%GNP+RT End%