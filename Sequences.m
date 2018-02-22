%% Sequences
% These functions needs to be run after "DDManalysis_AutoFile.mlx".

PostAnalysis; 
% (1) Plot Gradient of Cumulative VD
% (2) Plot Vessel Penetration Depth for certain percentage

PlotVDD;
% (1) Plot Vessel Dentiry Distribution
% (2) Core Vessel Density Distribution

%% 
%CoreVDnorm;
% (1) Calculate Total CoreVDnorm

if TotCoreVDlin(7,8) == 0
    TotCoreVDlin(7,8) = 0.001;
end
PlotVolume;
% (1) plot the Tumor Volume (TV)
% (2) plot Vessel Volume (VV)
% (3) plot Vessel Density (VD).
% (4) plot Core Vessel Density linear weighting(CoreVDlin)
% (5) plot Core Vessel Density normazlied weighting(CoreVDnor)

TVvsVD;
% (1) Compress all the time points and plot TV v.s. VD
% (2) Plot Total VD v.s. CoreVDlin

VDvsTotCoreVD;
TVvsCoreVD;

%TVcaliperTVultrasound;