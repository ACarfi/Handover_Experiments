fname = '..\Data\imu_giver.json'; 
rawData = loadJson(fname);
clData = cleanData(rawData);
[timestamp, linearAcc, angularVel] = decompress(clData);

figure
subplot(3,1,1)
scatter(linearAcc(:,1),linearAcc(:,2))
subplot(3,1,2)
scatter(linearAcc(:,1),linearAcc(:,3))
subplot(3,1,3)
scatter(linearAcc(:,1),linearAcc(:,4))

figure
subplot(3,1,1)
scatter(angularVel(:,1),angularVel(:,2))
subplot(3,1,2)
scatter(angularVel(:,1),angularVel(:,3))
subplot(3,1,3)
scatter(angularVel(:,1),angularVel(:,4))

distAcc = diff(linearAcc(:,1))./1000;
distVel = diff(angularVel(:,1))./1000;

frequencyAcc = 1./distAcc;
frequencyVel = 1./distVel;

figure
plot(frequencyAcc,'b')
figure
plot(frequencyVel,'r')

expectedAccValue = (clData(end).timestamp-clData(1).timestamp) * mean(frequencyAcc);
expectedVelValue = (clData(end).timestamp-clData(1).timestamp) * mean(frequencyVel);

RealfrequencyAcc = 1/((clData(end).timestamp-clData(1).timestamp)/length(linearAcc));
RealfrequencyVel = 1/((clData(end).timestamp-clData(1).timestamp)/length(angularVel));

