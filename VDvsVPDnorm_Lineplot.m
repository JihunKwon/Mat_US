%% Compress time points and plot TV v.s. VD

VDvsVPDnorm50_1 = zeros(2,9);
VDvsVPDnorm50_2 = zeros(2,9);
VDvsVPDnorm50_3 = zeros(2,9);
VDvsVPDnorm50_4 = zeros(2,9);
VDvsVPDnorm50_5 = zeros(2,9);
VDvsVPDnorm50_6 = zeros(2,9);
VDvsVPDnorm50_7 = zeros(2,9);
VDvsVPDnorm50_8 = zeros(2,9);
VDvsVPDnorm50_9 = zeros(2,9);

%Compress TP and add values to m1 direction
m1 = 1; m2 = 1; m3 = 1;
m4 = 1; m5 = 1; m6 = 1;
m7 = 1; m8 = 1; m9 = 1;
figure(1); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(2); clf('reset'); set(gcf,'Position',[391 1 873 805]);
figure(3); clf('reset'); set(gcf,'Position',[391 1 873 805]);
for k = 1:9
    if k == 3 %Saline
        for l = 1:9
            VDvsVPDnorm50_3(1,m3) = VDens(k+1,l+1);
            VDvsVPDnorm50_3(2,m3) = VPDnorm50(k,l);
            m3 = m3 + 1;
        end
    elseif k == 5
        for l = 1:9
            VDvsVPDnorm50_5(1,m5) = VDens(k+1,l+1);
            VDvsVPDnorm50_5(2,m5) = VPDnorm50(k,l);
            m5 = m5 + 1;
        end
    elseif k == 8 % Anima52(Saline):Excluded
    elseif k == 1 %RT
        for l = 1:9
            VDvsVPDnorm50_1(1,m1) = VDens(k+1,l+1);
            VDvsVPDnorm50_1(2,m1) = VPDnorm50(k,l);
            m1 = m1 + 1;
        end
    elseif k == 4 % Excluded
    elseif k == 9
        for l = 1:9
            VDvsVPDnorm50_9(1,m9) = VDens(k+1,l+1);
            VDvsVPDnorm50_9(2,m9) = VPDnorm50(k,l);
            m9 = m9 + 1;
        end
    elseif k == 2 %GNP+RT
        for l = 1:9
            VDvsVPDnorm50_2(1,m2) = VDens(k+1,l+1);
            VDvsVPDnorm50_2(2,m2) = VPDnorm50(k,l);
            m2 = m2 + 1;
        end
    elseif k == 6
        for l = 1:9
            VDvsVPDnorm50_6(1,m6) = VDens(k+1,l+1);
            VDvsVPDnorm50_6(2,m6) = VPDnorm50(k,l);
            m6 = m6 + 1;
        end
    elseif k == 7
        for l = 1:9
            VDvsVPDnorm50_7(1,m7) = VDens(k+1,l+1);
            VDvsVPDnorm50_7(2,m7) = VPDnorm50(k,l);
            m7 = m7 + 1;
        end
    end
end

%Omit NaN
VDvsVPDnorm50_1(isnan(VDvsVPDnorm50_1)) = 0;
VDvsVPDnorm50_2(isnan(VDvsVPDnorm50_2)) = 0;
VDvsVPDnorm50_3(isnan(VDvsVPDnorm50_3)) = 0;
VDvsVPDnorm50_4(isnan(VDvsVPDnorm50_4)) = 0;
VDvsVPDnorm50_5(isnan(VDvsVPDnorm50_5)) = 0;
VDvsVPDnorm50_6(isnan(VDvsVPDnorm50_6)) = 0;
VDvsVPDnorm50_7(isnan(VDvsVPDnorm50_7)) = 0;
VDvsVPDnorm50_8(isnan(VDvsVPDnorm50_8)) = 0;
VDvsVPDnorm50_9(isnan(VDvsVPDnorm50_9)) = 0;

%Omit zeros
X1 = VDvsVPDnorm50_1(1,:); X1 = X1(X1 ~= 0);
X2 = VDvsVPDnorm50_2(1,:); X2 = X2(X2 ~= 0); 
X3 = VDvsVPDnorm50_3(1,:); X3 = X3(X3 ~= 0);
X4 = VDvsVPDnorm50_4(1,:); X4 = X4(X4 ~= 0);
X5 = VDvsVPDnorm50_5(1,:); X5 = X5(X5 ~= 0); 
X6 = VDvsVPDnorm50_6(1,:); X6 = X6(X6 ~= 0);
X7 = VDvsVPDnorm50_7(1,:); X7 = X7(X7 ~= 0);
X8 = VDvsVPDnorm50_8(1,:); X8 = X8(X8 ~= 0); 
X9 = VDvsVPDnorm50_9(1,:); X9 = X9(X9 ~= 0);
Y1 = VDvsVPDnorm50_1(2,:); Y1 = Y1(Y1 ~= 0);
Y2 = VDvsVPDnorm50_2(2,:); Y2 = Y2(Y2 ~= 0); 
Y3 = VDvsVPDnorm50_3(2,:); Y3 = Y3(Y3 ~= 0);
Y4 = VDvsVPDnorm50_4(2,:); Y4 = Y4(Y4 ~= 0);
Y5 = VDvsVPDnorm50_5(2,:); Y5 = Y5(Y5 ~= 0); 
Y6 = VDvsVPDnorm50_6(2,:); Y6 = Y6(Y6 ~= 0);
Y7 = VDvsVPDnorm50_7(2,:); Y7 = Y7(Y7 ~= 0);
Y8 = VDvsVPDnorm50_8(2,:); Y8 = Y8(Y8 ~= 0); 
Y9 = VDvsVPDnorm50_9(2,:); Y9 = Y9(Y9 ~= 0);

%Plot points
N = 3; X = linspace(0,pi*3,1000); 
C = linspecer(N);
hold off; 

figure(1); %Saline
plot(X3,Y3,'-o','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal24
plot(X5,Y5,'-^','LineWidth',2,'MarkerSize',10); hold on; %Saline, Animal34
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density v.s. Normalized VPD_{50}, Saline');
xlim([0 90]); ylim([0 60]);
xlabel('Vessel Density (%)'); ylabel('Normalized VPD_{50} (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 24','Animal 34','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VDvsVPDnorm50_line_Saline.eps', '-depsc2');
hold off;

figure(2); %RT
plot(X1,Y1,'-o','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal12
plot(X9,Y9,'-s','LineWidth',2,'MarkerSize',10); hold on; %RT, Animal55
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density v.s. Normalized VPD_{50}, RT');
xlim([0 90]); ylim([0 60]);
xlabel('Vessel Density (%)'); ylabel('Normalized VPD_{50} (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 12','Animal 55','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VDvsVPDnorm50_line_RT.eps', '-depsc2');
hold off;

figure(3); %GNP+RT
plot(X2,Y2,'-o','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal15
plot(X6,Y6,'-^','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal35
plot(X7,Y7,'-s','LineWidth',2,'MarkerSize',10); hold on; %GNP+RT, Animal51
set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Vessel Density v.s. Normalized VPD_{50}, GNP+RT');
xlim([0 90]); ylim([0 60]);
xlabel('Vessel Density (%)'); ylabel('Normalized VPD_{50} (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Animal 15','Animal 35','Animal 51','Location','southeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'VDvsVPDnorm50_line_GNP+RT.eps', '-depsc2');
hold off;
