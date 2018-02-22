%% Compress time points and plot TV v.s. VD

TVvsCoreVD1 = zeros(2,9);
TVvsCoreVD2 = zeros(2,9);
TVvsCoreVD3 = zeros(2,9);
TVvsCoreVD4 = zeros(2,9);
TVvsCoreVD5 = zeros(2,9);
TVvsCoreVD6 = zeros(2,9);
TVvsCoreVD7 = zeros(2,9);
TVvsCoreVD8 = zeros(2,9);
TVvsCoreVD9 = zeros(2,9);

TVnormvsCoreVD1 = zeros(2,9);
TVnormvsCoreVD2 = zeros(2,9);
TVnormvsCoreVD3 = zeros(2,9);
TVnormvsCoreVD4 = zeros(2,9);
TVnormvsCoreVD5 = zeros(2,9);
TVnormvsCoreVD6 = zeros(2,9);
TVnormvsCoreVD7 = zeros(2,9);
TVnormvsCoreVD8 = zeros(2,9);
TVnormvsCoreVD9 = zeros(2,9);

%Compress TP and add values to m1 direction
m1 = 1; m2 = 1; m3 = 1;
m4 = 1; m5 = 1; m6 = 1;
m7 = 1; m8 = 1; m9 = 1;
figure(1); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(2); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(3); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(4); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(5); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(6); clf('reset'); set(gcf,'Position',[391 1 873 805]);
for k = 1:9
    if k == 3 %Saline
        for l = 1:9
            TVvsCoreVD3(1,m3) = TVolume(k+1,l+1);
            TVvsCoreVD3(2,m3) = TotCoreVDlin(k,l);
            TVnormvsCoreVD3(1,m3) = TVolume(k+1,l+1)/TVolume(k+1,3);
            TVnormvsCoreVD3(2,m3) = TotCoreVDlin(k,l);
            m3 = m3 + 1;
        end
    elseif k == 5
        for l = 1:9
            TVvsCoreVD5(1,m5) = TVolume(k+1,l+1);
            TVvsCoreVD5(2,m5) = TotCoreVDlin(k,l);
            TVnormvsCoreVD5(1,m5) = TVolume(k+1,l+1)/TVolume(k+1,4);
            TVnormvsCoreVD5(2,m5) = TotCoreVDlin(k,l);
            m5 = m5 + 1;
        end
    elseif k == 8 % Anima52(Saline):Excluded
    elseif k == 1 %RT
        for l = 1:9
            TVvsCoreVD1(1,m1) = TVolume(k+1,l+1);
            TVvsCoreVD1(2,m1) = TotCoreVDlin(k,l);
            TVnormvsCoreVD1(1,m1) = TVolume(k+1,l+1)/TVolume(k+1,2);
            TVnormvsCoreVD1(2,m1) = TotCoreVDlin(k,l);
            m1 = m1 + 1;
        end
    elseif k == 4 % Excluded
    elseif k == 9
        for l = 1:9
            TVvsCoreVD9(1,m9) = TVolume(k+1,l+1);
            TVvsCoreVD9(2,m9) = TotCoreVDlin(k,l);
            TVnormvsCoreVD9(1,m9) = TVolume(k+1,l+1)/TVolume(k+1,3);
            TVnormvsCoreVD9(2,m9) = TotCoreVDlin(k,l);
            m9 = m9 + 1;
        end
    elseif k == 2 %GNP+RT
        for l = 1:9
            TVvsCoreVD2(1,m2) = TVolume(k+1,l+1);
            TVvsCoreVD2(2,m2) = TotCoreVDlin(k,l);
            TVnormvsCoreVD2(1,m2) = TVolume(k+1,l+1)/TVolume(k+1,6);
            TVnormvsCoreVD2(2,m2) = TotCoreVDlin(k,l);
            m2 = m2 + 1;
        end
    elseif k == 6
        for l = 1:9
            TVvsCoreVD6(1,m6) = TVolume(k+1,l+1);
            TVvsCoreVD6(2,m6) = TotCoreVDlin(k,l);
            TVnormvsCoreVD6(1,m6) = TVolume(k+1,l+1)/TVolume(k+1,2);
            TVnormvsCoreVD6(2,m6) = TotCoreVDlin(k,l);
            m6 = m6 + 1;
        end
    elseif k == 7
        for l = 1:9
            TVvsCoreVD7(1,m7) = TVolume(k+1,l+1);
            TVvsCoreVD7(2,m7) = TotCoreVDlin(k,l);
            TVnormvsCoreVD7(1,m7) = TVolume(k+1,l+1)/TVolume(k+1,3);
            TVnormvsCoreVD7(2,m7) = TotCoreVDlin(k,l);
            m7 = m7 + 1;
        end
    end
end


%Omit NaN
TVvsCoreVD1(isnan(TVvsCoreVD1)) = 0;
TVvsCoreVD2(isnan(TVvsCoreVD2)) = 0;
TVvsCoreVD3(isnan(TVvsCoreVD3)) = 0;
TVvsCoreVD4(isnan(TVvsCoreVD4)) = 0;
TVvsCoreVD5(isnan(TVvsCoreVD5)) = 0;
TVvsCoreVD6(isnan(TVvsCoreVD6)) = 0;
TVvsCoreVD7(isnan(TVvsCoreVD7)) = 0;
TVvsCoreVD8(isnan(TVvsCoreVD8)) = 0;
TVvsCoreVD9(isnan(TVvsCoreVD9)) = 0;
TVnormvsCoreVD1(isnan(TVnormvsCoreVD1)) = 0;
TVnormvsCoreVD2(isnan(TVnormvsCoreVD2)) = 0;
TVnormvsCoreVD3(isnan(TVnormvsCoreVD3)) = 0;
TVnormvsCoreVD4(isnan(TVnormvsCoreVD4)) = 0;
TVnormvsCoreVD5(isnan(TVnormvsCoreVD5)) = 0;
TVnormvsCoreVD6(isnan(TVnormvsCoreVD6)) = 0;
TVnormvsCoreVD7(isnan(TVnormvsCoreVD7)) = 0;
TVnormvsCoreVD8(isnan(TVnormvsCoreVD8)) = 0;
TVnormvsCoreVD9(isnan(TVnormvsCoreVD9)) = 0;

%Omit zeros
X1 = TVvsCoreVD1(1,:); X1 = X1(X1 ~= 0);
X2 = TVvsCoreVD2(1,:); X2 = X2(X2 ~= 0); 
X3 = TVvsCoreVD3(1,:); X3 = X3(X3 ~= 0);
X4 = TVvsCoreVD4(1,:); X4 = X4(X4 ~= 0);
X5 = TVvsCoreVD5(1,:); X5 = X5(X5 ~= 0); 
X6 = TVvsCoreVD6(1,:); X6 = X6(X6 ~= 0);
X7 = TVvsCoreVD7(1,:); X7 = X7(X7 ~= 0);
X8 = TVvsCoreVD8(1,:); X8 = X8(X8 ~= 0); 
X9 = TVvsCoreVD9(1,:); X9 = X9(X9 ~= 0);
Y1 = TVvsCoreVD1(2,:); Y1 = Y1(Y1 ~= 0);
Y2 = TVvsCoreVD2(2,:); Y2 = Y2(Y2 ~= 0); 
Y3 = TVvsCoreVD3(2,:); Y3 = Y3(Y3 ~= 0);
Y4 = TVvsCoreVD4(2,:); Y4 = Y4(Y4 ~= 0);
Y5 = TVvsCoreVD5(2,:); Y5 = Y5(Y5 ~= 0); 
Y6 = TVvsCoreVD6(2,:); Y6 = Y6(Y6 ~= 0);
Y7 = TVvsCoreVD7(2,:); Y7 = Y7(Y7 ~= 0);
Y8 = TVvsCoreVD8(2,:); Y8 = Y8(Y8 ~= 0); 
Y9 = TVvsCoreVD9(2,:); Y9 = Y9(Y9 ~= 0);

X1norm = TVnormvsCoreVD1(1,:); X1norm = X1norm(X1norm ~= 0);
X2norm = TVnormvsCoreVD2(1,:); X2norm = X2norm(X2norm ~= 0); 
X3norm = TVnormvsCoreVD3(1,:); X3norm = X3norm(X3norm ~= 0);
X4norm = TVnormvsCoreVD4(1,:); X4norm = X4norm(X4norm ~= 0);
X5norm = TVnormvsCoreVD5(1,:); X5norm = X5norm(X5norm ~= 0); 
X6norm = TVnormvsCoreVD6(1,:); X6norm = X6norm(X6norm ~= 0);
X7norm = TVnormvsCoreVD7(1,:); X7norm = X7norm(X7norm ~= 0);
X8norm = TVnormvsCoreVD8(1,:); X8norm = X8norm(X8norm ~= 0); 
X9norm = TVnormvsCoreVD9(1,:); X9norm = X9norm(X9norm ~= 0);
Y1norm = TVnormvsCoreVD1(2,:); Y1norm = Y1norm(Y1norm ~= 0);
Y2norm = TVnormvsCoreVD2(2,:); Y2norm = Y2norm(Y2norm ~= 0); 
Y3norm = TVnormvsCoreVD3(2,:); Y3norm = Y3norm(Y3norm ~= 0);
Y4norm = TVnormvsCoreVD4(2,:); Y4norm = Y4norm(Y4norm ~= 0);
Y5norm = TVnormvsCoreVD5(2,:); Y5norm = Y5norm(Y5norm ~= 0); 
Y6norm = TVnormvsCoreVD6(2,:); Y6norm = Y6norm(Y6norm ~= 0);
Y7norm = TVnormvsCoreVD7(2,:); Y7norm = Y7norm(Y7norm ~= 0);
Y8norm = TVnormvsCoreVD8(2,:); Y8norm = Y8norm(Y8norm ~= 0); 
Y9norm = TVnormvsCoreVD9(2,:); Y9norm = Y9norm(Y9norm ~= 0);

%Plot points
N = 3; X = linspace(0,pi*3,1000); 
C = linspecer(N);
hold off; 

figure(1); %Saline, Un-normalized
plot(X3,Y3,'-o','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal24
plot(X5,Y5,'-^','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal34
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume v.s. Core Vessel Density, Saline');
xlim([0 4500]); ylim([0 100]);
xlabel('Tumor Volume (mm^3)'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 24','Animal 34','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_line_Saline.eps', '-depsc2');
hold off;

figure(2); %RT, Un-normalized
plot(X1,Y1,'-o','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal12
plot(X9,Y9,'-s','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal55
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume v.s. Core Vessel Density, RT');
xlim([0 4500]); ylim([0 100]);
xlabel('Tumor Volume (mm^3)'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 12','Animal 55','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_line_RT.eps', '-depsc2');
hold off;

figure(3); %GNP+RT, Un-normalized
plot(X2,Y2,'-o','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal15
plot(X6,Y6,'-^','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal35
plot(X7,Y7,'-s','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal51
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume v.s. Core Vessel Density, GNP+RT');
xlim([0 4500]); ylim([0 100]);
xlabel('Tumor Volume (mm^3)'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 15','Animal 35','Animal 51','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsCoreVD_line_GNP+RT.eps', '-depsc2');
hold off;

figure(4); %Normalized, Saline
plot(X3norm,Y3norm,'-o','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal24
plot(X5norm,Y5norm,'-^','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal34
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume v.s. Core Vessel Density, Saline');
xlim([0 6]); ylim([0 100]);
xlabel('Normalized Tumor Volume'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 24','Animal 34','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_line_Saline.eps', '-depsc2');
hold off;

figure(5); %Normalized, RT
plot(X1norm,Y1norm,'-o','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal12
plot(X9norm,Y9norm,'-^','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal55
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume v.s. Core Vessel Density, RT');
xlim([0 6]); ylim([0 100]);
xlabel('Normalized Tumor Volume'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 12','Animal 55','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_line_RT.eps', '-depsc2');
hold off;

figure(6); %Normalized, GNP+RT
plot(X2norm,Y2norm,'-o','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal15
plot(X6norm,Y6norm,'-^','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal35
plot(X7norm,Y7norm,'-s','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal51
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Normalized Tumor Volume v.s. Core Vessel Density, GNP+RT');
xlim([0 6]); ylim([0 100]);
xlabel('Normalized Tumor Volume'); ylabel('Core Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 15','Animal 35','Animal 51','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVnormvsCoreVD_line_GNP+RT.eps', '-depsc2');
hold off;