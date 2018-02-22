%% Core Vessel Density (Normalized weighting)
% (1) Calculate TotalCoreVDnormalized weighting

k = 3;
l = 3;
figure;
TotCoreVDnorm = zeros(9,9);
% for k = 1:9
%     for l = 1:9
        if VDD(k,l,1) ~= 0
            Vd = squeeze(VDD(k,l,1:32))';
            d = 0.1:0.1:3.2;
            Vd0indx = Vd > 0.0;
            Vd = Vd(Vd0indx);
            d = d(Vd0indx);
            dp = d/max(d);

            Vd(2:Vd0indx+1) = Vd(1:Vd0indx); %set smallest value to zero (in order to interpolate)
            Vd(1) = 0;

            dp(2:Vd0indx+1) = dp(1:Vd0indx);
            dp(1) = 0;
            hold on;
            plot(dp, Vd,'-o');
            hold off;


            xq = 0:0.1:1;
            Vdq = interp1(dp,Vd,xq); %interpolate
            hold on;
            plot(dp,Vd,'o',xq,Vdq,':.');
            xlim([0 1]);

            sum = 0;
            for m = 1:11
                sum = sum + Vdq(m)*(m-1)*0.1; %Weighting
            end
            TotCoreVDnorm(k,l) = sum;
        else
            TotCoreVDnorm(k,l) = 0;
        end
%     end
% end



