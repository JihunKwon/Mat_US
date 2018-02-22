function TotalVoxelCount
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%Calculate TotalVoxelCount
TotalVoxelCount = zeros(10,10);
CVD = zeros(10,10,33);
for k = 1:9
    for l = 1:9
        TotalVoxelCount = sum(VoxelCount(k+1,l+1,:));
        for m = 1:33
            if TotalVoxelCount ~= 0
                CVD(k+1,l+1,m) = 100*Count(k+1,l+1,m)/TotalVoxelCount;
            end
        end
    end
end