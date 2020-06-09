%% LOAD LTSPICE DATA
clear all;
x = LTspice2Matlab('Memristor_modelling.RAW');
% memristor at position 1,1
x1 = LTspice2Matlab('Memristor_one_device_1_1_ver_1.RAW'); % 0.05
x2 = LTspice2Matlab('Memristor_one_device_1_1_ver_2.RAW'); % 0.1
x3 = LTspice2Matlab('Memristor_one_device_1_1_ver_3.RAW'); % 0.5
x4 = LTspice2Matlab('Memristor_one_device_1_1_ver_4.RAW'); % 10
x5 = LTspice2Matlab('Memristor_one_device_1_1_ver_5.RAW'); % 100
x6 = LTspice2Matlab('Memristor_one_device_1_1_ver_6.RAW'); % 500
x7 = LTspice2Matlab('Memristor_one_device_1_1_ver_7.RAW'); % 1000
x8 = LTspice2Matlab('Memristor_one_device_1_1_ver_8.RAW'); % 5000

% %% INITIALISE VARIABLES
% Voltage_1_empty = zeros(3,3); Voltage_2_empty = zeros(3,3);
% Voltage_3_empty = zeros(3,3); Voltage_4_empty = zeros(3,3);
% Voltage_5_empty = zeros(3,3); Voltage_6_empty = zeros(3,3);
% Current_1_empty = zeros(6,1); Current_2_empty = zeros(6,1);
% Current_3_empty = zeros(6,1); Current_4_empty = zeros(6,1);
% Current_5_empty = zeros(6,1); Current_6_empty = zeros(6,1);
% 
% Voltage_1_device_005 = zeros(3,3); Voltage_2_device_005 = zeros(3,3);
% Voltage_3_device_005 = zeros(3,3); Voltage_4_device_005 = zeros(3,3);
% Voltage_5_device_005 = zeros(3,3); Voltage_6_device_005 = zeros(3,3);
% Current_1_device_005 = zeros(6,1); Current_2_device_005 = zeros(6,1);
% Current_3_device_005 = zeros(6,1); Current_4_device_005 = zeros(6,1);
% Current_5_device_005 = zeros(6,1); Current_6_device_005 = zeros(6,1);


%% FILL DATA INTO ARRAYS (Empty)

% setting up Vin1 =\0 array
Voltage_1_empty(1,1:3) = x.variable_mat(4:6,4);
Voltage_1_empty(2,1:3) = x.variable_mat(7:9,4);
Voltage_1_empty(3,1:3) = x.variable_mat(10:12,4);
Current_empty(1:6,1) = x.variable_mat(39:-1:34,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_empty);
title('Voltage Array for Vin1 (Empty)')

% setting up Vin2 =\0 array
Voltage_2_empty(1,1:3) = x.variable_mat(4:6,11);
Voltage_2_empty(2,1:3) = x.variable_mat(7:9,11);
Voltage_2_empty(3,1:3) = x.variable_mat(10:12,11);
Current_empty(1:6,2) = x.variable_mat(39:-1:34,11); 
subplot(2,3,2)
heatmap(Voltage_2_empty);
title('Voltage Array for Vin2 (Empty)')

% setting up Vin3 =\0 array
Voltage_3_empty(1,1:3) = x.variable_mat(4:6,18);
Voltage_3_empty(2,1:3) = x.variable_mat(7:9,18);
Voltage_3_empty(3,1:3) = x.variable_mat(10:12,18);
Current_empty(1:6,3) = x.variable_mat(39:-1:34,18); 
subplot(2,3,3)
heatmap(Voltage_3_empty);
title('Voltage Array for Vin3 (Empty)')

% setting up Vin4 =\0 array
Voltage_4_empty(1,1:3) = x.variable_mat(4:6,25);
Voltage_4_empty(2,1:3) = x.variable_mat(7:9,25);
Voltage_4_empty(3,1:3) = x.variable_mat(10:12,25);
Current_empty(1:6,4) = x.variable_mat(39:-1:34,25); 
subplot(2,3,4)
heatmap(Voltage_4_empty);
title('Voltage Array for Vin4 (Empty)')

% setting up Vin5 =\0 array
Voltage_5_empty(1,1:3) = x.variable_mat(4:6,32);
Voltage_5_empty(2,1:3) = x.variable_mat(7:9,32);
Voltage_5_empty(3,1:3) = x.variable_mat(10:12,32);
Current_empty(1:6,5) = x.variable_mat(39:-1:34,32); 
subplot(2,3,5)
heatmap(Voltage_5_empty);
title('Voltage Array for Vin5 (Empty)')

% setting up Vin6 =\0 array
Voltage_6_empty(1,1:3) = x.variable_mat(4:6,39);
Voltage_6_empty(2,1:3) = x.variable_mat(7:9,39);
Voltage_6_empty(3,1:3) = x.variable_mat(10:12,39);
Current_empty(1:6,6) = x.variable_mat(39:-1:34,39); 
subplot(2,3,6)
heatmap(Voltage_6_empty);
title('Voltage Array for Vin6 (Empty)')

%% FILL DATA INTO ARRAY (One Device @ 0.05)

% setting up Vin1 =\0 array
Voltage_1_device_005 (1,1:3) = x1.variable_mat(7:9,4);
Voltage_1_device_005 (2,1:3) = x1.variable_mat(10:12,4);
Voltage_1_device_005 (3,1:3) = x1.variable_mat(13:15,4);
Current_device_005 (1:6,1) = x1.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_005);
title('Voltage Array for Vin1 (One Device @ 0.05\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_005 (1,1:3) = x1.variable_mat(7:9,11);
Voltage_2_device_005 (2,1:3) = x1.variable_mat(10:12,11);
Voltage_2_device_005 (3,1:3) = x1.variable_mat(13:15,11);
Current_device_005 (1:6,2) = x1.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_005 );
title('Voltage Array for Vin2 (One Device @ 0.05\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_005 (1,1:3) = x1.variable_mat(7:9,18);
Voltage_3_device_005 (2,1:3) = x1.variable_mat(10:12,18);
Voltage_3_device_005 (3,1:3) = x1.variable_mat(13:15,18);
Current_device_005 (1:6,3) = x1.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_005 );
title('Voltage Array for Vin3 (One Device @ 0.05\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_005 (1,1:3) = x1.variable_mat(7:9,25);
Voltage_4_device_005 (2,1:3) = x1.variable_mat(10:12,25);
Voltage_4_device_005 (3,1:3) = x1.variable_mat(13:15,25);
Current_device_005 (1:6,4) = x1.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_005);
title('Voltage Array for Vin4 (One Device @ 0.05\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_005 (1,1:3) = x1.variable_mat(7:9,32);
Voltage_5_device_005 (2,1:3) = x1.variable_mat(10:12,32);
Voltage_5_device_005 (3,1:3) = x1.variable_mat(13:15,32);
Current_device_005 (1:6,5) = x1.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_005);
title('Voltage Array for Vin5 (One Device @ 0.05\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_005 (1,1:3) = x1.variable_mat(7:9,39);
Voltage_6_device_005 (2,1:3) = x1.variable_mat(10:12,39);
Voltage_6_device_005 (3,1:3) = x1.variable_mat(13:15,39);
Current_device_005 (1:6,6) = x1.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_005);
title('Voltage Array for Vin6 (One Device @ 0.05\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 01)

% setting up Vin1 =\0 array
Voltage_1_device_01 (1,1:3) = x2.variable_mat(7:9,4);
Voltage_1_device_01 (2,1:3) = x2.variable_mat(10:12,4);
Voltage_1_device_01 (3,1:3) = x2.variable_mat(13:15,4);
Current_device_01 (1:6,1) = x2.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_01 );
title('Voltage Array for Vin1 (One Device @ 0.1\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_01 (1,1:3) = x2.variable_mat(7:9,11);
Voltage_2_device_01 (2,1:3) = x2.variable_mat(10:12,11);
Voltage_2_device_01 (3,1:3) = x2.variable_mat(13:15,11);
Current_device_01 (1:6,2) = x2.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_01 );
title('Voltage Array for Vin2 (One Device @ 0.1\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_01 (1,1:3) = x2.variable_mat(7:9,18);
Voltage_3_device_01 (2,1:3) = x2.variable_mat(10:12,18);
Voltage_3_device_01 (3,1:3) = x2.variable_mat(13:15,18);
Current_device_01 (1:6,3) = x2.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_01 );
title('Voltage Array for Vin3 (One Device @ 0.1\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_01 (1,1:3) = x2.variable_mat(7:9,25);
Voltage_4_device_01 (2,1:3) = x2.variable_mat(10:12,25);
Voltage_4_device_01 (3,1:3) = x2.variable_mat(13:15,25);
Current_device_01 (1:6,4) = x2.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_01);
title('Voltage Array for Vin4 (One Device @ 0.1\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_01 (1,1:3) = x2.variable_mat(7:9,32);
Voltage_5_device_01 (2,1:3) = x2.variable_mat(10:12,32);
Voltage_5_device_01 (3,1:3) = x2.variable_mat(13:15,32);
Current_device_01 (1:6,5) = x2.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_01);
title('Voltage Array for Vin5 (One Device @ 0.1\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_01 (1,1:3) = x2.variable_mat(7:9,39);
Voltage_6_device_01 (2,1:3) = x2.variable_mat(10:12,39);
Voltage_6_device_01 (3,1:3) = x2.variable_mat(13:15,39);
Current_device_01 (1:6,6) = x2.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_01);
title('Voltage Array for Vin6 (One Device @ 0.1\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 0.5)

% setting up Vin1 =\0 array
Voltage_1_device_05 (1,1:3) = x3.variable_mat(7:9,4);
Voltage_1_device_05 (2,1:3) = x3.variable_mat(10:12,4);
Voltage_1_device_05 (3,1:3) = x3.variable_mat(13:15,4);
Current_device_05 (1:6,1) = x3.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_05);
title('Voltage Array for Vin1 (One Device @ 0.5\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_05 (1,1:3) = x3.variable_mat(7:9,11);
Voltage_2_device_05 (2,1:3) = x3.variable_mat(10:12,11);
Voltage_2_device_05 (3,1:3) = x3.variable_mat(13:15,11);
Current_device_05 (1:6,2) = x3.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_05 );
title('Voltage Array for Vin2 (One Device @ 0.5\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_05 (1,1:3) = x3.variable_mat(7:9,18);
Voltage_3_device_05 (2,1:3) = x3.variable_mat(10:12,18);
Voltage_3_device_05 (3,1:3) = x3.variable_mat(13:15,18);
Current_device_05 (1:6,3) = x3.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_05 );
title('Voltage Array for Vin3 (One Device @ 0.5\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_05 (1,1:3) = x3.variable_mat(7:9,25);
Voltage_4_device_05 (2,1:3) = x3.variable_mat(10:12,25);
Voltage_4_device_05 (3,1:3) = x3.variable_mat(13:15,25);
Current_device_05 (1:6,4) = x3.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_05);
title('Voltage Array for Vin4 (One Device @ 0.5\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_05 (1,1:3) = x3.variable_mat(7:9,32);
Voltage_5_device_05 (2,1:3) = x3.variable_mat(10:12,32);
Voltage_5_device_05 (3,1:3) = x3.variable_mat(13:15,32);
Current_device_05 (1:6,5) = x3.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_05);
title('Voltage Array for Vin5 (One Device @ 0.5\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_05 (1,1:3) = x3.variable_mat(7:9,39);
Voltage_6_device_05 (2,1:3) = x3.variable_mat(10:12,39);
Voltage_6_device_05 (3,1:3) = x3.variable_mat(13:15,39);
Current_device_05 (1:6,6) = x3.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_05);
title('Voltage Array for Vin6 (One Device @ 0.5\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 10)

% setting up Vin1 =\0 array
Voltage_1_device_10 (1,1:3) = x4.variable_mat(7:9,4);
Voltage_1_device_10 (2,1:3) = x4.variable_mat(10:12,4);
Voltage_1_device_10 (3,1:3) = x4.variable_mat(13:15,4);
Current_device_10 (1:6,1) = x4.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_10 );
title('Voltage Array for Vin1 (One Device @ 10\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_10 (1,1:3) = x4.variable_mat(7:9,11);
Voltage_2_device_10 (2,1:3) = x4.variable_mat(10:12,11);
Voltage_2_device_10 (3,1:3) = x4.variable_mat(13:15,11);
Current_device_10 (1:6,2) = x4.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_10 );
title('Voltage Array for Vin2 (One Device @ 10\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_10 (1,1:3) = x4.variable_mat(7:9,18);
Voltage_3_device_10 (2,1:3) = x4.variable_mat(10:12,18);
Voltage_3_device_10 (3,1:3) = x4.variable_mat(13:15,18);
Current_device_10 (1:6,3) = x4.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_10 );
title('Voltage Array for Vin3 (One Device @ 10\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_10 (1,1:3) = x4.variable_mat(7:9,25);
Voltage_4_device_10 (2,1:3) = x4.variable_mat(10:12,25);
Voltage_4_device_10 (3,1:3) = x4.variable_mat(13:15,25);
Current_device_10 (1:6,4) = x4.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_10);
title('Voltage Array for Vin4 (One Device @ 10\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_10 (1,1:3) = x4.variable_mat(7:9,32);
Voltage_5_device_10 (2,1:3) = x4.variable_mat(10:12,32);
Voltage_5_device_10 (3,1:3) = x4.variable_mat(13:15,32);
Current_device_10 (1:6,5) = x4.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_10);
title('Voltage Array for Vin5 (One Device @ 10\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_10 (1,1:3) = x4.variable_mat(7:9,39);
Voltage_6_device_10 (2,1:3) = x4.variable_mat(10:12,39);
Voltage_6_device_10 (3,1:3) = x4.variable_mat(13:15,39);
Current_device_10 (1:6,6) = x4.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_10);
title('Voltage Array for Vin6 (One Device @ 10\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 100)

% setting up Vin1 =\0 array
Voltage_1_device_100 (1,1:3) = x5.variable_mat(7:9,4);
Voltage_1_device_100 (2,1:3) = x5.variable_mat(10:12,4);
Voltage_1_device_100 (3,1:3) = x5.variable_mat(13:15,4);
Current_device_100 (1:6,1) = x5.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_100);
title('Voltage Array for Vin1 (One Device @ 100\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_100 (1,1:3) = x5.variable_mat(7:9,11);
Voltage_2_device_100 (2,1:3) = x5.variable_mat(10:12,11);
Voltage_2_device_100 (3,1:3) = x5.variable_mat(13:15,11);
Current_device_100 (1:6,2) = x5.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_100 );
title('Voltage Array for Vin2 (One Device @ 100\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_100 (1,1:3) = x5.variable_mat(7:9,18);
Voltage_3_device_100 (2,1:3) = x5.variable_mat(10:12,18);
Voltage_3_device_100 (3,1:3) = x5.variable_mat(13:15,18);
Current_device_100 (1:6,3) = x5.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_100 );
title('Voltage Array for Vin3 (One Device @ 100\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_100 (1,1:3) = x5.variable_mat(7:9,25);
Voltage_4_device_100 (2,1:3) = x5.variable_mat(10:12,25);
Voltage_4_device_100 (3,1:3) = x5.variable_mat(13:15,25);
Current_device_100 (1:6,4) = x5.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_100);
title('Voltage Array for Vin4 (One Device @ 100\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_100 (1,1:3) = x5.variable_mat(7:9,32);
Voltage_5_device_100 (2,1:3) = x5.variable_mat(10:12,32);
Voltage_5_device_100 (3,1:3) = x5.variable_mat(13:15,32);
Current_device_100 (1:6,5) = x5.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_100);
title('Voltage Array for Vin5 (One Device @ 100\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_100 (1,1:3) = x5.variable_mat(7:9,39);
Voltage_6_device_100 (2,1:3) = x5.variable_mat(10:12,39);
Voltage_6_device_100 (3,1:3) = x5.variable_mat(13:15,39);
Current_device_100 (1:6,6) = x5.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_100);
title('Voltage Array for Vin6 (One Device @ 100\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 500)

% setting up Vin1 =\0 array
Voltage_1_device_500 (1,1:3) = x6.variable_mat(7:9,4);
Voltage_1_device_500 (2,1:3) = x6.variable_mat(10:12,4);
Voltage_1_device_500 (3,1:3) = x6.variable_mat(13:15,4);
Current_device_500 (1:6,1) = x6.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_500 );
title('Voltage Array for Vin1 (One Device @ 500\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_500 (1,1:3) = x6.variable_mat(7:9,11);
Voltage_2_device_500 (2,1:3) = x6.variable_mat(10:12,11);
Voltage_2_device_500 (3,1:3) = x6.variable_mat(13:15,11);
Current_device_500 (1:6,2) = x6.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_500 );
title('Voltage Array for Vin2 (One Device @ 500\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_500 (1,1:3) = x6.variable_mat(7:9,18);
Voltage_3_device_500 (2,1:3) = x6.variable_mat(10:12,18);
Voltage_3_device_500 (3,1:3) = x6.variable_mat(13:15,18);
Current_device_500 (1:6,3) = x6.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_500 );
title('Voltage Array for Vin3 (One Device @ 500\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_500 (1,1:3) = x6.variable_mat(7:9,25);
Voltage_4_device_500 (2,1:3) = x6.variable_mat(10:12,25);
Voltage_4_device_500 (3,1:3) = x6.variable_mat(13:15,25);
Current_device_500 (1:6,4) = x6.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_500);
title('Voltage Array for Vin4 (One Device @ 500\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_500 (1,1:3) = x6.variable_mat(7:9,32);
Voltage_5_device_500 (2,1:3) = x6.variable_mat(10:12,32);
Voltage_5_device_500 (3,1:3) = x6.variable_mat(13:15,32);
Current_device_500 (1:6,5) = x6.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_500);
title('Voltage Array for Vin5 (One Device @ 500\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_500 (1,1:3) = x6.variable_mat(7:9,39);
Voltage_6_device_500 (2,1:3) = x6.variable_mat(10:12,39);
Voltage_6_device_500 (3,1:3) = x6.variable_mat(13:15,39);
Current_device_500 (1:6,6) = x6.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_500);
title('Voltage Array for Vin6 (One Device @ 500\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 1k)

% setting up Vin1 =\0 array
Voltage_1_device_1000 (1,1:3) = x7.variable_mat(7:9,4);
Voltage_1_device_1000 (2,1:3) = x7.variable_mat(10:12,4);
Voltage_1_device_1000 (3,1:3) = x7.variable_mat(13:15,4);
Current_device_1000 (1:6,1) = x7.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_1000);
title('Voltage Array for Vin1 (One Device @ 1k\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_1000 (1,1:3) = x7.variable_mat(7:9,11);
Voltage_2_device_1000 (2,1:3) = x7.variable_mat(10:12,11);
Voltage_2_device_1000 (3,1:3) = x7.variable_mat(13:15,11);
Current_device_1000 (1:6,2) = x7.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_1000 );
title('Voltage Array for Vin2 (One Device @ 1k\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_1000 (1,1:3) = x7.variable_mat(7:9,18);
Voltage_3_device_1000 (2,1:3) = x7.variable_mat(10:12,18);
Voltage_3_device_1000 (3,1:3) = x7.variable_mat(13:15,18);
Current_device_1000 (1:6,3) = x7.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_1000 );
title('Voltage Array for Vin3 (One Device @ 1k\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_1000 (1,1:3) = x7.variable_mat(7:9,25);
Voltage_4_device_1000 (2,1:3) = x7.variable_mat(10:12,25);
Voltage_4_device_1000 (3,1:3) = x7.variable_mat(13:15,25);
Current_device_1000 (1:6,4) = x7.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_1000);
title('Voltage Array for Vin4 (One Device @ 1k\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_1000 (1,1:3) = x7.variable_mat(7:9,32);
Voltage_5_device_1000 (2,1:3) = x7.variable_mat(10:12,32);
Voltage_5_device_1000 (3,1:3) = x7.variable_mat(13:15,32);
Current_device_1000 (1:6,5) = x7.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_1000);
title('Voltage Array for Vin5 (One Device @ 1k\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_1000 (1,1:3) = x7.variable_mat(7:9,39);
Voltage_6_device_1000 (2,1:3) = x7.variable_mat(10:12,39);
Voltage_6_device_1000 (3,1:3) = x7.variable_mat(13:15,39);
Current_device_1000 (1:6,6) = x7.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_1000);
title('Voltage Array for Vin6 (One Device @ 1k\Omega)')

%% FILL DATA INTO ARRAY (One Device @ 5k)

% setting up Vin1 =\0 array
Voltage_1_device_5000 (1,1:3) = x8.variable_mat(7:9,4);
Voltage_1_device_5000 (2,1:3) = x8.variable_mat(10:12,4);
Voltage_1_device_5000 (3,1:3) = x8.variable_mat(13:15,4);
Current_device_5000 (1:6,1) = x8.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_device_5000 );
title('Voltage Array for Vin1 (One Device @ 5k\Omega)')

% setting up Vin2 =\0 array
Voltage_2_device_5000 (1,1:3) = x8.variable_mat(7:9,11);
Voltage_2_device_5000 (2,1:3) = x8.variable_mat(10:12,11);
Voltage_2_device_5000 (3,1:3) = x8.variable_mat(13:15,11);
Current_device_5000 (1:6,2) = x8.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_device_5000 );
title('Voltage Array for Vin2 (One Device @ 5k\Omega)')

% setting up Vin3 =\0 array
Voltage_3_device_5000 (1,1:3) = x8.variable_mat(7:9,18);
Voltage_3_device_5000 (2,1:3) = x8.variable_mat(10:12,18);
Voltage_3_device_5000 (3,1:3) = x8.variable_mat(13:15,18);
Current_device_5000 (1:6,3) = x8.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_device_5000 );
title('Voltage Array for Vin3 (One Device @ 5k\Omega)')

% setting up Vin4 =\0 array
Voltage_4_device_5000 (1,1:3) = x8.variable_mat(7:9,25);
Voltage_4_device_5000 (2,1:3) = x8.variable_mat(10:12,25);
Voltage_4_device_5000 (3,1:3) = x8.variable_mat(13:15,25);
Current_device_5000 (1:6,4) = x8.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_device_5000);
title('Voltage Array for Vin4 (One Device @ 5k\Omega)')

% setting up Vin5 =\0 array
Voltage_5_device_5000 (1,1:3) = x8.variable_mat(7:9,32);
Voltage_5_device_5000 (2,1:3) = x8.variable_mat(10:12,32);
Voltage_5_device_5000 (3,1:3) = x8.variable_mat(13:15,32);
Current_device_5000 (1:6,5) = x8.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_device_5000);
title('Voltage Array for Vin5 (One Device @ 5k\Omega)')

% setting up Vin6 =\0 array
Voltage_6_device_5000 (1,1:3) = x8.variable_mat(7:9,39);
Voltage_6_device_5000 (2,1:3) = x8.variable_mat(10:12,39);
Voltage_6_device_5000 (3,1:3) = x8.variable_mat(13:15,39);
Current_device_5000 (1:6,6) = x8.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_device_5000);
title('Voltage Array for Vin6 (One Device @ 5k\Omega)')

Voltage_check_1 = Voltage_1_device_5000 - Voltage_1_empty;
Voltage_check_2 = Voltage_1_device_1000 - Voltage_1_empty;
Voltage_check_3 = Voltage_1_device_500 - Voltage_1_empty;
Voltage_check_4 = Voltage_1_device_100 - Voltage_1_empty;
Voltage_check_5 = Voltage_1_device_10 - Voltage_1_empty;
Voltage_check_6 = Voltage_1_device_05 - Voltage_1_empty;
Voltage_check_7 = Voltage_1_device_01 - Voltage_1_empty;
Voltage_check_8 = Voltage_1_device_005 - Voltage_1_empty;