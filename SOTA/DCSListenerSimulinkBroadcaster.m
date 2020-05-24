clear all
close all
framerate = 60;
t = cputime;

fprintf('Opening socket...\n');
port0 = 31090;
port1 = 31091;
port2 = 31092;
port3 = 31093;
port4 = 31094;
port5 = 31095;

t0 = tcpip('0.0.0.0', port0, 'NetworkRole', 'server');
t1 = tcpip('0.0.0.0', port1, 'NetworkRole', 'server');
t2 = tcpip('0.0.0.0', port2, 'NetworkRole', 'server');
t3 = tcpip('0.0.0.0', port3, 'NetworkRole', 'server'); %This will accept any TCP request on port .
%t4 = tcpip('0.0.0.0', port4, 'NetworkRole', 'server');
%t5 = tcpip('0.0.0.0', port5, 'NetworkRole', 'server');
fprintf('Port %i is open \n', port0);
fprintf('Waiting for connection...\n');
%fopen(t2);
%fopen(t3);
fopen(t0);
%fopen(t2);
%fopen(t3);
%fopen(t0);
%fopen(t1);
fprintf('Connected to DCS\n');
%fopen(t1);


%fopen(t3);
fopen(t1);
fopen(t2);
fopen(t3);
%fopen(t5);
%fopen(t4);

fprintf('Connected to Simulink\n');

rotSpeedYawPrev=0;
angAccYaw = 0;
rotSpeedRollPrev=0;
angAccRoll=0;
angAccPitch=0;
rotSpeedPitchPrev=0;

maxX=0;
maxY=0;
maxZ=0;


while(1)
      T1 = cputime;
      Ts = T1-t;
      t=T1;
      data = fscanf(t0);
      split = strsplit(data,':');
      ax = str2double(split(1));
      ay = str2double(split(2));
      az = str2double(split(3));
      rotSpeedYaw = str2double(split(4));
      velocity = str2double(split(5));
      rotSpeedRoll = str2double(split(6));
      rotSpeedPitch = str2double(split(7));
      
      angAccYaw=(rotSpeedYaw-rotSpeedYawPrev)/1;
      angAccRoll=(rotSpeedRoll-rotSpeedRollPrev)/1;
      angAccPitch=(rotSpeedPitch-rotSpeedPitchPrev)/1;

%         data = strcat(num2str(round(Xdata,3)),':',num2str(round(Ydata,3)),':',num2str(round(Zdata,3)));
        %fprintf(t1,num2str(ax,3));
        fprintf(t1,num2str(round(ax,3)));
        fprintf(t2,num2str(round(ay,3)));
        fprintf(t3,num2str(round(az,3)));
        %fprintf(t2,num2str(round(rotSpeedYaw,3)));
        %fprintf(t4,num2str(round(rotSpeedYaw,3)));
        %fprintf(t5,num2str(round(rotSpeedRoll,3)));
        
        rotSpeedYawPrev = rotSpeedYaw;
        rotSpeedRollPrev = rotSpeedRoll;
        rotSpeedPitchPrev = rotSpeedPitch;
        
        if maxX<ax
            maxX = ax;
        end
        
        if maxY<ay
            maxY = ay;
        end
        
        if maxZ<az
            maxZ = az;
        end
          
end
