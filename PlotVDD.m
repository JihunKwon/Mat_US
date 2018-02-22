% (1) Plot Vessel Dentiry Distribution
% (2) Core Vessel Density Distribution
%Has to be run after "PostAnalysis.m"
AnimalID = [12 15 24 33 34 35 51 52 55];
clf('reset');
    
for k = 1:9
    %Vessel Density Distribution
    VDD1 = squeeze(VDD(k,1:end,:));
    indx = all(VDD1' == 0)';
    VDD1(indx,:) = [];
    TP = 9-nnz(indx);

    %Cumulative Vessel Density
    CVD1 = squeeze(CumVD(k,1:end,:));
    indxc = all(CVD1' == 0)';
    CVD1(indxc,:) = [];
    
    
    days   = TP2Day(k,:);
    days   = days(~isnan(days));
    daystr = regexp(sprintf('Day %d,', days), ',', 'split');
    
    %% Plot VDD
    figure('Position', [391 1 873 805]);
    t = 0.1:0.1:3.2;
    
    plot(t, VDD1','-o','LineWidth',2,'MarkerSize',8);
    set(gca, 'LineWidth', 2, 'FontSize', 20);
    fnametitle = sprintf('Vessel Density Distribution, Animal%d',AnimalID(k));
    title(fnametitle);
    xlim([0 2.5]);
    xlabel('Depth (mm)');
    ylabel('Vessel Density (%)');
    
    hl = legend(daystr);
    set(hl, 'Box', 'Off');
    
    % Save as eps
    set(gcf, 'PaperPositionMode', 'Auto');
    fname = sprintf('VDD_%d.eps', k);
    print(gcf, fname, '-depsc2');

    %% Plot CumulativeVD
    figure('Position', [391 1 873 805]);
    t = 0.1:0.1:3.2+0.1; %This t has to be 1 bin larger than VDD.
    plot(t, CVD1,'-o','LineWidth',2,'MarkerSize',8);
    
    set(gca, 'LineWidth', 2, 'FontSize', 20);
    fnametitle = sprintf('Cumulative Vessel Density, Animal%d',AnimalID(k));
    title(fnametitle);
    xlim([0 2.5]);
    xlabel('Depth (mm)');
    ylabel('Vessel Density (%)');
    
    hl = legend(daystr);
    set(hl, 'Box', 'Off');
    
    % Save as eps
    set(gcf, 'PaperPositionMode', 'Auto');
    fname = sprintf('CumulativeVD_%d.eps', k);
    print(gcf, fname, '-depsc2');
    
    %% Plot X normalized VDD (For thresholding the cases which core region is dead)
    figure('Position', [391 1 873 805]);
    t = 0.1:0.1:3.2;
    
    plot(t, VDD1','-o','LineWidth',2,'MarkerSize',8);
    set(gca, 'LineWidth', 2, 'FontSize', 20);
    fnametitle = sprintf('Vessel Density Distribution, Animal%d',AnimalID(k));
    title(fnametitle);
    xlim([0 2.5]);
    xlabel('Depth (mm)');
    ylabel('Vessel Density (%)');
    
    hl = legend(daystr);
    set(hl, 'Box', 'Off');
    
    % Save as eps
    set(gcf, 'PaperPositionMode', 'Auto');
    fname = sprintf('VDD_%d.eps', k);
    print(gcf, fname, '-depsc2');
end
    
    
% %% Core Vessel Density (Linear)
% %Calculate Core Vessel Density first
% CoreVDlin = zeros(9,9,32);
% TotCoreVDlin = zeros(9,9);
% 
% for k = 1:9
%     for l = 1:9
%         for m = 1:32
%             CoreVDlin(k,l,m) = m*0.1*VDD(k,l,m);
%         end
%         TotCoreVDlin(k,l) = sum(CoreVDlin(k,l,:));
%     end
%     
%     %Distribution
%     CoreVDlin1 = squeeze(CoreVDlin(k,1:end,:));
%     indx = all(CoreVDlin1' == 0)';
%     CoreVDlin1(indx,:) = [];
%     
%     figure('Position', [391 1 873 805]);
%     t = 0.1:0.1:3.2;
%     plot(t, CoreVDlin1','-o','LineWidth',2,'MarkerSize',8);
%     set(gca, 'LineWidth', 2, 'FontSize', 20);
%     fnametitle = sprintf('Core Vessel Density Distribution, Animal%d',AnimalID(k));
%     title(fnametitle);
%     xlim([0 2.5]);
%     xlabel('Depth (mm)');
%     ylabel('Core Vessel Density (%)');
%     
%     hl = legend(daystr);
%     set(hl, 'Box', 'Off');
%     
%     % Save as eps
%     set(gcf, 'PaperPositionMode', 'Auto');
%     fname = sprintf('CoreVDlin_%d.eps', k);
%     print(gcf, fname, '-depsc2');
end

