%% Compress time points and plot TV v.s. VD

TVvsVD1 = zeros(2,9);
TVvsVD2 = zeros(2,9);
TVvsVD3 = zeros(2,9);
TVvsVD4 = zeros(2,9);
TVvsVD5 = zeros(2,9);
TVvsVD6 = zeros(2,9);
TVvsVD7 = zeros(2,9);
TVvsVD8 = zeros(2,9);
TVvsVD9 = zeros(2,9);

TVvsVDrt = zeros(2,30);
TVvsVDgnprt = zeros(2,30);

%Compress TP and add values to m1 direction
m1 = 1; m2 = 1; m3 = 1; m4 = 1; m5 = 1;
m6 = 1; m7 = 1; m8 = 1; m9 = 1;
figure(56); clf('reset'); 
for k = 1:9
    for l = 1:9
        if k == 1
            TVvsVD1(1,m1) = TVolume(k+1,l+1);
            TVvsVD1(2,m1) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m1 = m1 + 1;
        elseif k == 2
            TVvsVD2(1,m2) = TVolume(k+1,l+1);
            TVvsVD2(2,m2) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m2 = m2 + 1;
        elseif k == 3
            TVvsVD3(1,m3) = TVolume(k+1,l+1);
            TVvsVD3(2,m3) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m3 = m3 + 1;
        elseif k == 4
            TVvsVD4(1,m4) = TVolume(k+1,l+1);
            TVvsVD4(2,m4) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m4 = m4 + 1;
        elseif k == 5
            TVvsVD5(1,m5) = TVolume(k+1,l+1);
            TVvsVD5(2,m5) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m5 = m5 + 1;
        elseif k == 6
            TVvsVD6(1,m6) = TVolume(k+1,l+1);
            TVvsVD6(2,m6) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m6 = m6 + 1;
        elseif k == 7
            TVvsVD7(1,m7) = TVolume(k+1,l+1);
            TVvsVD7(2,m7) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m7 = m7 + 1;
        elseif k == 8
            TVvsVD8(1,m8) = TVolume(k+1,l+1);
            TVvsVD8(2,m8) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m8 = m8 + 1;
        else
            TVvsVD9(1,m9) = TVolume(k+1,l+1);
            TVvsVD9(2,m9) = VVolume(k+1,l+1)./TVolume(k+1,l+1)*100;
            m9 = m9 + 1;
        end
    end
end


%Omit NaN
TVvsVD1(isnan(TVvsVD1)) = 0;
TVvsVD2(isnan(TVvsVD2)) = 0;
TVvsVD3(isnan(TVvsVD3)) = 0;
TVvsVD4(isnan(TVvsVD4)) = 0;
TVvsVD5(isnan(TVvsVD5)) = 0;
TVvsVD6(isnan(TVvsVD6)) = 0;
TVvsVD7(isnan(TVvsVD7)) = 0;
TVvsVD8(isnan(TVvsVD8)) = 0;
TVvsVD9(isnan(TVvsVD9)) = 0;

%Omit zeros
X1 = TVvsVD1(1,:); X1 = X1(X1 ~= 0);
X2 = TVvsVD2(1,:); X2 = X2(X2 ~= 0); 
X3 = TVvsVD3(1,:); X3 = X3(X3 ~= 0);
X4 = TVvsVD4(1,:); X4 = X4(X4 ~= 0);
X5 = TVvsVD5(1,:); X5 = X5(X5 ~= 0);
X6 = TVvsVD6(1,:); X6 = X6(X6 ~= 0); 
X7 = TVvsVD7(1,:); X7 = X7(X7 ~= 0);
X8 = TVvsVD8(1,:); X8 = X8(X8 ~= 0);
X9 = TVvsVD9(1,:); X9 = X9(X9 ~= 0);
Y1 = TVvsVD1(2,:); Y1 = Y1(Y1 ~= 0);
Y2 = TVvsVD2(2,:); Y2 = Y2(Y2 ~= 0);
Y3 = TVvsVD3(2,:); Y3 = Y3(Y3 ~= 0);
Y4 = TVvsVD4(2,:); Y4 = Y4(Y4 ~= 0);
Y5 = TVvsVD5(2,:); Y5 = Y5(Y5 ~= 0);
Y6 = TVvsVD6(2,:); Y6 = Y6(Y6 ~= 0);
Y7 = TVvsVD7(2,:); Y7 = Y7(Y7 ~= 0);
Y8 = TVvsVD8(2,:); Y8 = Y8(Y8 ~= 0); 
Y9 = TVvsVD9(2,:); Y9 = Y9(Y9 ~= 0); 

%Plot points
N = 3; X = linspace(0,pi*3,1000); 
C = linspecer(N);
hold off; 

figure(56);
plot(X3,Y3,'-o','MarkerEdgeColor','k','MarkerFaceColor',C(1,:),'MarkerSize',10); hold on; %Saline, Animal24
plot(X5,Y5,'-^','MarkerEdgeColor','k','MarkerFaceColor',C(1,:),'MarkerSize',10); hold on; %Saline, Animal34
plot(X8,Y8,'-s','MarkerEdgeColor','k','MarkerFaceColor',C(1,:),'MarkerSize',10); hold on; %Saline, Animal52
plot(X1,Y1,'o','MarkerEdgeColor','k','MarkerFaceColor',C(2,:),'MarkerSize',10); hold on; %RT, Animal12
plot(X4,Y4,'^','MarkerEdgeColor','k','MarkerFaceColor',C(2,:),'MarkerSize',10); hold on; %RT, Animal33
plot(X9,Y9,'s','MarkerEdgeColor','k','MarkerFaceColor',C(2,:),'MarkerSize',10); hold on; %RT, Animal55
plot(X2,Y2,'o','MarkerEdgeColor','k','MarkerFaceColor',C(3,:),'MarkerSize',10); hold on; %GNP+RT, Animal15
plot(X6,Y6,'^','MarkerEdgeColor','k','MarkerFaceColor',C(3,:),'MarkerSize',10); hold on; %GNP+RT, Animal35
plot(X7,Y7,'s','MarkerEdgeColor','k','MarkerFaceColor',C(3,:),'MarkerSize',10); hold on; %GNP+RT, Animal51

set(gca, 'LineWidth', 2, 'FontSize', 20);
title('Tumor Volume v.s. Vessel Density');
xlim([0 4500]); ylim([0 100]);
xlabel('Tumor Volume (mm^3)'); ylabel('Vessel Density (%)');
set(gca, 'LineWidth', 2, 'FontSize', 18);
legend('Saline,24','Saline,34','Saline,52','RT,12','RT,33','RT,55','GNP+RT,15','GNP+RT,35','GNP+RT,51','Location','northeast');
legend boxon;
% Save as eps
set(gcf, 'PaperPositionMode', 'Auto');
print(gcf, 'TVvsVD_Animal.eps', '-depsc2');