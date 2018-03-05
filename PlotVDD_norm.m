% (1) Plot Normalized Vessel Dentiry Distribution
%Has to be run after "PostAnalysis.m"
AnimalID = [12 15 24 33 34 35 51 52 55];
clf('reset');
    
for k = 1:9
    %Vessel Density Distribution
    VDD1 = squeeze(VDDnorm(k,1:end,:));
    indx = all(VDD1' == 0)';
    VDD1(indx,:) = [];
    TP = 9-nnz(indx);

    %Cumulative Vessel Density
    CVD1 = squeeze(CumVDnorm(k,1:end,:));
    indxc = all(CVD1' == 0)';
    CVD1(indxc,:) = [];
    
    
    days   = TP2Day(k,:);
    days   = days(~isnan(days));
    daystr = regexp(sprintf('Day %d,', days), ',', 'split');
    
    %% Plot VDD
    figure('Position', [391 1 873 805]);
    t = 4:4:100;
    
    plot(t, VDD1','-o','LineWidth',2,'MarkerSize',8);
    set(gca, 'LineWidth', 2, 'FontSize', 20);
    fnametitle = sprintf('Normalized Vessel Density Distribution, Animal%d',AnimalID(k));
    title(fnametitle);
    xlim([0 100]);
    xlabel('Normalized Depth (%)');
    ylabel('Vessel Density (%)');
    
    hl = legend(daystr);
    set(hl, 'Box', 'Off');
    
    % Save as eps
    set(gcf, 'PaperPositionMode', 'Auto');
    fname = sprintf('VDDnorm_%d.eps', k);
    print(gcf, fname, '-depsc2');

    %% Plot CumulativeVD
    figure('Position', [391 1 873 805]);
    t = 4:4:100+4; %This t has to be 1 bin larger than VDD.
    plot(t, CVD1,'-o','LineWidth',2,'MarkerSize',8);
    
    set(gca, 'LineWidth', 2, 'FontSize', 20);
    fnametitle = sprintf('Normalized Cumulative Vessel Density, Animal%d',AnimalID(k));
    title(fnametitle);
    xlim([0 100]);
    xlabel('Normalized Depth (%)');
    ylabel('Vessel Density (%)');
    
    hl = legend(daystr);
    set(hl, 'Box', 'Off');
    
    % Save as eps
    set(gcf, 'PaperPositionMode', 'Auto');
    fname = sprintf('CumulativeVDnorm_%d.eps', k);
    print(gcf, fname, '-depsc2');
end