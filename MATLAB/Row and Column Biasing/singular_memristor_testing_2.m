%% LOAD LTSPICE DATA
clear all;
x = LTspice2Matlab('Memristor_modelling_2.RAW');        % empty
x1 = LTspice2Matlab('Memristor_new_1_1_1000.RAW');      % 1k @ 1,1
x2 = LTspice2Matlab('Memristor_new_1_1_10000.RAW');     % 10k @ 1,1
x3 = LTspice2Matlab('Memristor_new_1_1_100000.RAW');    % 100k @ 1,1
x4 = LTspice2Matlab('Memristor_new_1_2_1000.RAW');      % 1k @ 1,2
x5 = LTspice2Matlab('Memristor_new_1_2_10000.RAW');     % 10k @ 1,2
x6 = LTspice2Matlab('Memristor_new_1_2_100000.RAW');    % 100k @ 1,2
x7 = LTspice2Matlab('Memristor_new_2_2_1000.RAW');      % 1k @ 2,2
x8 = LTspice2Matlab('Memristor_new_2_2_10000.RAW');     % 10k @ 2,2
x9 = LTspice2Matlab('Memristor_new_2_2_100000.RAW');    % 100k @ 2,2

x10 = LTspice2Matlab('Memristor_new_3_3_1000.RAW');     % 1k @ 3,3
x11 = LTspice2Matlab('Memristor_new_3_3_10000.RAW');    % 10k @ 3,3
x12 = LTspice2Matlab('Memristor_new_3_3_100000.RAW');   % 100k @ 3,3

x13 = LTspice2Matlab('Memristor_new_1_1_open.RAW');     % open @ 1,1
x14 = LTspice2Matlab('Memristor_new_1_2_open.RAW');     % open @ 1,2 
x15 = LTspice2Matlab('Memristor_new_2_2_open.RAW');     % open @ 2,2
x16 = LTspice2Matlab('Memristor_new_3_3_open.RAW');     % open @ 3,3


%% VARIABLE SETUP

vin1 = [2 ;0 ;0 ;0 ;0 ;0];
vin2 = [0 ;2 ;0 ;0 ;0 ;0];
vin3 = [0 ;0 ;2 ;0 ;0 ;0];
vin4 = [0 ;0 ;0 ;2 ;0 ;0];
vin5 = [0 ;0 ;0 ;0 ;2 ;0];
vin6 = [0 ;0 ;0 ;0 ;0 ;2];

%% FILL DATA INTO ARRAYS (Empty)

% setting up Vin1 =\0 array
Voltage_1_empty(1,1:3) = x.variable_mat(7:9,4);
Voltage_1_empty(2,1:3) = x.variable_mat(10:12,4);
Voltage_1_empty(3,1:3) = x.variable_mat(13:15,4);
Current_empty(1:6,1) = x.variable_mat(39:-1:34,4);
G_empty = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_empty);
title('Voltage Array for Vin1 (Empty)')
%G_1_empty = Current_empty(1:6,1)/vin1;
G_empty = G_empty + (Current_empty(1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_empty(1,1:3) = x.variable_mat(7:9,11);
Voltage_2_empty(2,1:3) = x.variable_mat(10:12,11);
Voltage_2_empty(3,1:3) = x.variable_mat(13:15,11);
Current_empty(1:6,2) = x.variable_mat(39:-1:34,11); 
subplot(2,3,2)
heatmap(Voltage_2_empty);
title('Voltage Array for Vin2 (Empty)')
G_empty = G_empty + (Current_empty(1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_empty(1,1:3) = x.variable_mat(7:9,18);
Voltage_3_empty(2,1:3) = x.variable_mat(10:12,18);
Voltage_3_empty(3,1:3) = x.variable_mat(13:15,18);
Current_empty(1:6,3) = x.variable_mat(39:-1:34,18); 
subplot(2,3,3)
heatmap(Voltage_3_empty);
title('Voltage Array for Vin3 (Empty)')
G_empty = G_empty + (Current_empty(1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_empty(1,1:3) = x.variable_mat(7:9,26);
Voltage_4_empty(2,1:3) = x.variable_mat(10:12,26);
Voltage_4_empty(3,1:3) = x.variable_mat(13:15,26);
Current_empty(1:6,4) = x.variable_mat(39:-1:34,26); 
subplot(2,3,4)
heatmap(Voltage_4_empty);
title('Voltage Array for Vin4 (Empty)')
G_empty = G_empty + (Current_empty(1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_empty(1,1:3) = x.variable_mat(7:9,33);
Voltage_5_empty(2,1:3) = x.variable_mat(10:12,33);
Voltage_5_empty(3,1:3) = x.variable_mat(13:15,33);
Current_empty(1:6,5) = x.variable_mat(39:-1:34,33); 
subplot(2,3,5)
heatmap(Voltage_5_empty);
title('Voltage Array for Vin5 (Empty)')
G_empty = G_empty + (Current_empty(1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_empty(1,1:3) = x.variable_mat(7:9,41);
Voltage_6_empty(2,1:3) = x.variable_mat(10:12,41);
Voltage_6_empty(3,1:3) = x.variable_mat(13:15,41);
Current_empty(1:6,6) = x.variable_mat(39:-1:34,41); 
subplot(2,3,6)
heatmap(Voltage_6_empty);
title('Voltage Array for Vin6 (Empty)')
G_empty = G_empty + (Current_empty(1:6,6)/vin6);


%% FILL DATA INTO ARRAY (1k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_1000_1_1 (1,1:3) = x1.variable_mat(7:9,4);
Voltage_1_1000_1_1 (2,1:3) = x1.variable_mat(10:12,4);
Voltage_1_1000_1_1 (3,1:3) = x1.variable_mat(13:15,4);
Current_1000_1_1 (1:6,1) = x1.variable_mat(41:-1:36,4); 
G_1000_1_1 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_1000_1_1 );
title('Voltage Array for Vin1 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_1_1 (1,1:3) = x1.variable_mat(7:9,11);
Voltage_2_1000_1_1 (2,1:3) = x1.variable_mat(10:12,11);
Voltage_2_1000_1_1 (3,1:3) = x1.variable_mat(13:15,11);
Current_1000_1_1 (1:6,2) = x1.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_1000_1_1 );
title('Voltage Array for Vin2 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_1_1 (1,1:3) = x1.variable_mat(7:9,18);
Voltage_3_1000_1_1 (2,1:3) = x1.variable_mat(10:12,18);
Voltage_3_1000_1_1 (3,1:3) = x1.variable_mat(13:15,18);
Current_1000_1_1 (1:6,3) = x1.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_1_1 );
title('Voltage Array for Vin3 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,3)/vin3);


% setting up Vin4 =\0 array
Voltage_4_1000_1_1 (1,1:3) = x1.variable_mat(7:9,25);
Voltage_4_1000_1_1 (2,1:3) = x1.variable_mat(10:12,25);
Voltage_4_1000_1_1 (3,1:3) = x1.variable_mat(13:15,25);
Current_1000_1_1 (1:6,4) = x1.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_1000_1_1);
title('Voltage Array for Vin4 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_1_1 (1,1:3) = x1.variable_mat(7:9,32);
Voltage_5_1000_1_1 (2,1:3) = x1.variable_mat(10:12,32);
Voltage_5_1000_1_1 (3,1:3) = x1.variable_mat(13:15,32);
Current_1000_1_1 (1:6,5) = x1.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_1000_1_1);
title('Voltage Array for Vin5 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_1000_1_1 (1,1:3) = x1.variable_mat(7:9,39);
Voltage_6_1000_1_1 (2,1:3) = x1.variable_mat(10:12,39);
Voltage_6_1000_1_1 (3,1:3) = x1.variable_mat(13:15,39);
Current_1000_1_1 (1:6,6) = x1.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_1000_1_1);
title('Voltage Array for Vin6 (1k @ 1,1)')
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,6)/vin6);

%% FILL DATA INTO ARRAY (10k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_10000_1_1 (1,1:3) = x2.variable_mat(7:9,4);
Voltage_1_10000_1_1 (2,1:3) = x2.variable_mat(10:12,4);
Voltage_1_10000_1_1 (3,1:3) = x2.variable_mat(13:15,4);
Current_10000_1_1 (1:6,1) = x2.variable_mat(41:-1:36,4);
G_10000_1_1 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_10000_1_1 );
title('Voltage Array for Vin1 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_1_1 (1,1:3) = x2.variable_mat(7:9,11);
Voltage_2_10000_1_1 (2,1:3) = x2.variable_mat(10:12,11);
Voltage_2_10000_1_1 (3,1:3) = x2.variable_mat(13:15,11);
Current_10000_1_1 (1:6,2) = x2.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_10000_1_1 );
title('Voltage Array for Vin2 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_1_1 (1,1:3) = x2.variable_mat(7:9,18);
Voltage_3_10000_1_1 (2,1:3) = x2.variable_mat(10:12,18);
Voltage_3_10000_1_1 (3,1:3) = x2.variable_mat(13:15,18);
Current_10000_1_1 (1:6,3) = x2.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_10000_1_1 );
title('Voltage Array for Vin3 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_10000_1_1 (1,1:3) = x2.variable_mat(7:9,26);
Voltage_4_10000_1_1 (2,1:3) = x2.variable_mat(10:12,26);
Voltage_4_10000_1_1 (3,1:3) = x2.variable_mat(13:15,26);
Current_10000_1_1 (1:6,4) = x2.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_10000_1_1);
title('Voltage Array for Vin4 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_1_1 (1,1:3) = x2.variable_mat(7:9,33);
Voltage_5_10000_1_1 (2,1:3) = x2.variable_mat(10:12,33);
Voltage_5_10000_1_1 (3,1:3) = x2.variable_mat(13:15,33);
Current_10000_1_1 (1:6,5) = x2.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_10000_1_1);
title('Voltage Array for Vin5 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_10000_1_1 (1,1:3) = x2.variable_mat(7:9,41);
Voltage_6_10000_1_1 (2,1:3) = x2.variable_mat(10:12,41);
Voltage_6_10000_1_1 (3,1:3) = x2.variable_mat(13:15,41);
Current_10000_1_1 (1:6,6) = x2.variable_mat(41:-1:36,41); 
subplot(2,3,6)
heatmap(Voltage_6_10000_1_1);
title('Voltage Array for Vin6 (10k @ 1,1)')
G_10000_1_1 = G_10000_1_1 + (Current_10000_1_1 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (100k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_100000_1_1 (1,1:3) = x3.variable_mat(7:9,4);
Voltage_1_100000_1_1 (2,1:3) = x3.variable_mat(10:12,4);
Voltage_1_100000_1_1 (3,1:3) = x3.variable_mat(13:15,4);
Current_100000_1_1 (1:6,1) = x3.variable_mat(41:-1:36,4); 
G_100000_1_1 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_100000_1_1);
title('Voltage Array for Vin1 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_1_1 (1,1:3) = x3.variable_mat(7:9,11);
Voltage_2_100000_1_1 (2,1:3) = x3.variable_mat(10:12,11);
Voltage_2_100000_1_1 (3,1:3) = x3.variable_mat(13:15,11);
Current_100000_1_1 (1:6,2) = x3.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_100000_1_1 );
title('Voltage Array for Vin2 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_1_1 (1,1:3) = x3.variable_mat(7:9,18);
Voltage_3_100000_1_1 (2,1:3) = x3.variable_mat(10:12,18);
Voltage_3_100000_1_1 (3,1:3) = x3.variable_mat(13:15,18);
Current_100000_1_1 (1:6,3) = x3.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_100000_1_1 );
title('Voltage Array for Vin3 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_100000_1_1 (1,1:3) = x3.variable_mat(7:9,26);
Voltage_4_100000_1_1 (2,1:3) = x3.variable_mat(10:12,26);
Voltage_4_100000_1_1 (3,1:3) = x3.variable_mat(13:15,26);
Current_100000_1_1 (1:6,4) = x3.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_100000_1_1);
title('Voltage Array for Vin4 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_100000_1_1 (1,1:3) = x3.variable_mat(7:9,33);
Voltage_5_100000_1_1 (2,1:3) = x3.variable_mat(10:12,33);
Voltage_5_100000_1_1 (3,1:3) = x3.variable_mat(13:15,33);
Current_100000_1_1 (1:6,5) = x3.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_100000_1_1);
title('Voltage Array for Vin5 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_100000_1_1 (1,1:3) = x3.variable_mat(7:9,41);
Voltage_6_100000_1_1 (2,1:3) = x3.variable_mat(10:12,41);
Voltage_6_100000_1_1 (3,1:3) = x3.variable_mat(13:15,41);
Current_100000_1_1 (1:6,6) = x3.variable_mat(41:-1:36,41); 
subplot(2,3,6)
heatmap(Voltage_6_100000_1_1);
title('Voltage Array for Vin6 (100k @ 1,1)')
G_100000_1_1 = G_100000_1_1 + (Current_100000_1_1 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (1k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_1000_1_2 (1,1:3) = x4.variable_mat(7:9,4);
Voltage_1_1000_1_2 (2,1:3) = x4.variable_mat(10:12,4);
Voltage_1_1000_1_2 (3,1:3) = x4.variable_mat(13:15,4);
Current_1000_1_2 (1:6,1) = x4.variable_mat(41:-1:36,4);
G_1000_1_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_1000_1_2 );
title('Voltage Array for Vin1 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_1_2 (1,1:3) = x4.variable_mat(7:9,11);
Voltage_2_1000_1_2 (2,1:3) = x4.variable_mat(10:12,11);
Voltage_2_1000_1_2 (3,1:3) = x4.variable_mat(13:15,11);
Current_1000_1_2 (1:6,2) = x4.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_1000_1_2 );
title('Voltage Array for Vin2 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,2)/vin2);


% setting up Vin3 =\0 array
Voltage_3_1000_1_2 (1,1:3) = x4.variable_mat(7:9,18);
Voltage_3_1000_1_2 (2,1:3) = x4.variable_mat(10:12,18);
Voltage_3_1000_1_2 (3,1:3) = x4.variable_mat(13:15,18);
Current_1000_1_2 (1:6,3) = x4.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_1_2 );
title('Voltage Array for Vin3 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,3)/vin3);


% setting up Vin4 =\0 array
Voltage_4_1000_1_2 (1,1:3) = x4.variable_mat(7:9,25);
Voltage_4_1000_1_2 (2,1:3) = x4.variable_mat(10:12,25);
Voltage_4_1000_1_2 (3,1:3) = x4.variable_mat(13:15,25);
Current_1000_1_2 (1:6,4) = x4.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_1000_1_2);
title('Voltage Array for Vin4 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_1_2 (1,1:3) = x4.variable_mat(7:9,32);
Voltage_5_1000_1_2 (2,1:3) = x4.variable_mat(10:12,32);
Voltage_5_1000_1_2 (3,1:3) = x4.variable_mat(13:15,32);
Current_1000_1_2 (1:6,5) = x4.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_1000_1_2);
title('Voltage Array for Vin5 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_1000_1_2 (1,1:3) = x4.variable_mat(7:9,39);
Voltage_6_1000_1_2 (2,1:3) = x4.variable_mat(10:12,39);
Voltage_6_1000_1_2 (3,1:3) = x4.variable_mat(13:15,39);
Current_1000_1_2 (1:6,6) = x4.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_1000_1_2);
title('Voltage Array for Vin6 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (10k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_10000_1_2 (1,1:3) = x5.variable_mat(7:9,4);
Voltage_1_10000_1_2 (2,1:3) = x5.variable_mat(10:12,4);
Voltage_1_10000_1_2 (3,1:3) = x5.variable_mat(13:15,4);
Current_10000_1_2 (1:6,1) = x5.variable_mat(41:-1:36,4); 
G_10000_1_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_10000_1_2);
title('Voltage Array for Vin1 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_1_2 (1,1:3) = x5.variable_mat(7:9,11);
Voltage_2_10000_1_2 (2,1:3) = x5.variable_mat(10:12,11);
Voltage_2_10000_1_2 (3,1:3) = x5.variable_mat(13:15,11);
Current_10000_1_2 (1:6,2) = x5.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_10000_1_2 );
title('Voltage Array for Vin2 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_1_2 (1,1:3) = x5.variable_mat(7:9,18);
Voltage_3_10000_1_2 (2,1:3) = x5.variable_mat(10:12,18);
Voltage_3_10000_1_2 (3,1:3) = x5.variable_mat(13:15,18);
Current_10000_1_2 (1:6,3) = x5.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_10000_1_2 );
title('Voltage Array for Vin3 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_10000_1_2 (1,1:3) = x5.variable_mat(7:9,25);
Voltage_4_10000_1_2 (2,1:3) = x5.variable_mat(10:12,25);
Voltage_4_10000_1_2 (3,1:3) = x5.variable_mat(13:15,25);
Current_10000_1_2 (1:6,4) = x5.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_10000_1_2);
title('Voltage Array for Vin4 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_1_2 (1,1:3) = x5.variable_mat(7:9,32);
Voltage_5_10000_1_2 (2,1:3) = x5.variable_mat(10:12,32);
Voltage_5_10000_1_2 (3,1:3) = x5.variable_mat(13:15,32);
Current_10000_1_2 (1:6,5) = x5.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_10000_1_2);
title('Voltage Array for Vin5 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_10000_1_2 (1,1:3) = x5.variable_mat(7:9,39);
Voltage_6_10000_1_2 (2,1:3) = x5.variable_mat(10:12,39);
Voltage_6_10000_1_2 (3,1:3) = x5.variable_mat(13:15,39);
Current_10000_1_2 (1:6,6) = x5.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_10000_1_2);
title('Voltage Array for Vin6 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (100k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_100000_1_2 (1,1:3) = x6.variable_mat(7:9,4);
Voltage_1_100000_1_2 (2,1:3) = x6.variable_mat(10:12,4);
Voltage_1_100000_1_2 (3,1:3) = x6.variable_mat(13:15,4);
Current_100000_1_2 (1:6,1) = x6.variable_mat(41:-1:36,4); 
G_100000_1_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_100000_1_2 );
title('Voltage Array for Vin1 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_1_2 (1,1:3) = x6.variable_mat(7:9,11);
Voltage_2_100000_1_2 (2,1:3) = x6.variable_mat(10:12,11);
Voltage_2_100000_1_2 (3,1:3) = x6.variable_mat(13:15,11);
Current_100000_1_2 (1:6,2) = x6.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_100000_1_2 );
title('Voltage Array for Vin2 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_1_2 (1,1:3) = x6.variable_mat(7:9,18);
Voltage_3_100000_1_2 (2,1:3) = x6.variable_mat(10:12,18);
Voltage_3_100000_1_2 (3,1:3) = x6.variable_mat(13:15,18);
Current_100000_1_2 (1:6,3) = x6.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_100000_1_2 );
title('Voltage Array for Vin3 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_100000_1_2 (1,1:3) = x6.variable_mat(7:9,26);
Voltage_4_100000_1_2 (2,1:3) = x6.variable_mat(10:12,26);
Voltage_4_100000_1_2 (3,1:3) = x6.variable_mat(13:15,26);
Current_100000_1_2 (1:6,4) = x6.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_100000_1_2);
title('Voltage Array for Vin4 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_100000_1_2 (1,1:3) = x6.variable_mat(7:9,33);
Voltage_5_100000_1_2 (2,1:3) = x6.variable_mat(10:12,33);
Voltage_5_100000_1_2 (3,1:3) = x6.variable_mat(13:15,33);
Current_100000_1_2 (1:6,5) = x6.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_100000_1_2);
title('Voltage Array for Vin5 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_100000_1_2 (1,1:3) = x6.variable_mat(7:9,41);
Voltage_6_100000_1_2 (2,1:3) = x6.variable_mat(10:12,41);
Voltage_6_100000_1_2 (3,1:3) = x6.variable_mat(13:15,41);
Current_100000_1_2 (1:6,6) = x6.variable_mat(41:-1:36,41); 
subplot(2,3,6)
heatmap(Voltage_6_100000_1_2);
title('Voltage Array for Vin6 (100k @ 1,2)')
G_100000_1_2 = G_100000_1_2 + (Current_100000_1_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (1k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_1000_2_2 (1,1:3) = x7.variable_mat(7:9,4);
Voltage_1_1000_2_2 (2,1:3) = x7.variable_mat(10:12,4);
Voltage_1_1000_2_2 (3,1:3) = x7.variable_mat(13:15,4);
Current_1000_2_2 (1:6,1) = x7.variable_mat(41:-1:36,4);
G_1000_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_1000_2_2);
title('Voltage Array for Vin1 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_2_2 (1,1:3) = x7.variable_mat(7:9,11);
Voltage_2_1000_2_2 (2,1:3) = x7.variable_mat(10:12,11);
Voltage_2_1000_2_2 (3,1:3) = x7.variable_mat(13:15,11);
Current_1000_2_2 (1:6,2) = x7.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_1000_2_2 );
title('Voltage Array for Vin2 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_2_2 (1,1:3) = x7.variable_mat(7:9,18);
Voltage_3_1000_2_2 (2,1:3) = x7.variable_mat(10:12,18);
Voltage_3_1000_2_2 (3,1:3) = x7.variable_mat(13:15,18);
Current_1000_2_2 (1:6,3) = x7.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_2_2 );
title('Voltage Array for Vin3 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_1000_2_2 (1,1:3) = x7.variable_mat(7:9,25);
Voltage_4_1000_2_2 (2,1:3) = x7.variable_mat(10:12,25);
Voltage_4_1000_2_2 (3,1:3) = x7.variable_mat(13:15,25);
Current_1000_2_2 (1:6,4) = x7.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_1000_2_2);
title('Voltage Array for Vin4 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_2_2 (1,1:3) = x7.variable_mat(7:9,32);
Voltage_5_1000_2_2 (2,1:3) = x7.variable_mat(10:12,32);
Voltage_5_1000_2_2 (3,1:3) = x7.variable_mat(13:15,32);
Current_1000_2_2 (1:6,5) = x7.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_1000_2_2);
title('Voltage Array for Vin5 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_1000_2_2 (1,1:3) = x7.variable_mat(7:9,39);
Voltage_6_1000_2_2 (2,1:3) = x7.variable_mat(10:12,39);
Voltage_6_1000_2_2 (3,1:3) = x7.variable_mat(13:15,39);
Current_1000_2_2 (1:6,6) = x7.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_1000_2_2);
title('Voltage Array for Vin6 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (10k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_10000_2_2 (1,1:3) = x8.variable_mat(7:9,4);
Voltage_1_10000_2_2 (2,1:3) = x8.variable_mat(10:12,4);
Voltage_1_10000_2_2 (3,1:3) = x8.variable_mat(13:15,4);
Current_10000_2_2 (1:6,1) = x8.variable_mat(41:-1:36,4);
G_10000_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_10000_2_2 );
title('Voltage Array for Vin1 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_2_2 (1,1:3) = x8.variable_mat(7:9,11);
Voltage_2_10000_2_2 (2,1:3) = x8.variable_mat(10:12,11);
Voltage_2_10000_2_2 (3,1:3) = x8.variable_mat(13:15,11);
Current_10000_2_2 (1:6,2) = x8.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_10000_2_2 );
title('Voltage Array for Vin2 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_2_2 (1,1:3) = x8.variable_mat(7:9,18);
Voltage_3_10000_2_2 (2,1:3) = x8.variable_mat(10:12,18);
Voltage_3_10000_2_2 (3,1:3) = x8.variable_mat(13:15,18);
Current_10000_2_2 (1:6,3) = x8.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_10000_2_2 );
title('Voltage Array for Vin3 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_10000_2_2 (1,1:3) = x8.variable_mat(7:9,25);
Voltage_4_10000_2_2 (2,1:3) = x8.variable_mat(10:12,25);
Voltage_4_10000_2_2 (3,1:3) = x8.variable_mat(13:15,25);
Current_10000_2_2 (1:6,4) = x8.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_10000_2_2);
title('Voltage Array for Vin4 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_2_2(1,1:3) = x8.variable_mat(7:9,32);
Voltage_5_10000_2_2 (2,1:3) = x8.variable_mat(10:12,32);
Voltage_5_10000_2_2 (3,1:3) = x8.variable_mat(13:15,32);
Current_10000_2_2 (1:6,5) = x8.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_10000_2_2);
title('Voltage Array for Vin5 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_10000_2_2(1,1:3) = x8.variable_mat(7:9,39);
Voltage_6_10000_2_2 (2,1:3) = x8.variable_mat(10:12,39);
Voltage_6_10000_2_2 (3,1:3) = x8.variable_mat(13:15,39);
Current_10000_2_2 (1:6,6) = x8.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_10000_2_2);
title('Voltage Array for Vin6 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (100k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_100000_2_2 (1,1:3) = x9.variable_mat(7:9,4);
Voltage_1_100000_2_2 (2,1:3) = x9.variable_mat(10:12,4);
Voltage_1_100000_2_2 (3,1:3) = x9.variable_mat(13:15,4);
Current_100000_2_2 (1:6,1) = x9.variable_mat(41:-1:36,4); 
G_100000_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_100000_2_2 );
title('Voltage Array for Vin1 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_2_2 (1,1:3) = x9.variable_mat(7:9,11);
Voltage_2_100000_2_2 (2,1:3) = x9.variable_mat(10:12,11);
Voltage_2_100000_2_2 (3,1:3) = x9.variable_mat(13:15,11);
Current_100000_2_2 (1:6,2) = x9.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_100000_2_2 );
title('Voltage Array for Vin2 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_2_2 (1,1:3) = x9.variable_mat(7:9,18);
Voltage_3_100000_2_2 (2,1:3) = x9.variable_mat(10:12,18);
Voltage_3_100000_2_2 (3,1:3) = x9.variable_mat(13:15,18);
Current_100000_2_2 (1:6,3) = x9.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_100000_2_2 );
title('Voltage Array for Vin3 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_100000_2_2 (1,1:3) = x9.variable_mat(7:9,26);
Voltage_4_100000_2_2 (2,1:3) = x9.variable_mat(10:12,26);
Voltage_4_100000_2_2 (3,1:3) = x9.variable_mat(13:15,26);
Current_100000_2_2 (1:6,4) = x9.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_100000_2_2);
title('Voltage Array for Vin4 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_100000_2_2 (1,1:3) = x9.variable_mat(7:9,33);
Voltage_5_100000_2_2 (2,1:3) = x9.variable_mat(10:12,33);
Voltage_5_100000_2_2 (3,1:3) = x9.variable_mat(13:15,33);
Current_100000_2_2 (1:6,5) = x9.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_100000_2_2);
title('Voltage Array for Vin5 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_100000_2_2 (1,1:3) = x9.variable_mat(7:9,41);
Voltage_6_100000_2_2 (2,1:3) = x9.variable_mat(10:12,41);
Voltage_6_100000_2_2 (3,1:3) = x9.variable_mat(13:15,41);
Current_100000_2_2 (1:6,6) = x9.variable_mat(41:-1:36,41); 
subplot(2,3,6)
heatmap(Voltage_6_100000_2_2);
title('Voltage Array for Vin6 (100k @ 2,2)')
G_100000_2_2 = G_100000_2_2 + (Current_100000_2_2 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (1k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_1000_3_3 (1,1:3) = x10.variable_mat(7:9,4);
Voltage_1_1000_3_3 (2,1:3) = x10.variable_mat(10:12,4);
Voltage_1_1000_3_3 (3,1:3) = x10.variable_mat(13:15,4);
Current_1000_3_3 (1:6,1) = x10.variable_mat(41:-1:36,4); 
G_1000_3_3 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_1000_3_3 );
title('Voltage Array for Vin1 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_3_3 (1,1:3) = x10.variable_mat(7:9,11);
Voltage_2_1000_3_3 (2,1:3) = x10.variable_mat(10:12,11);
Voltage_2_1000_3_3 (3,1:3) = x10.variable_mat(13:15,11);
Current_1000_3_3 (1:6,2) = x10.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_1000_3_3 );
title('Voltage Array for Vin2 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_3_3 (1,1:3) = x10.variable_mat(7:9,18);
Voltage_3_1000_3_3 (2,1:3) = x10.variable_mat(10:12,18);
Voltage_3_1000_3_3 (3,1:3) = x10.variable_mat(13:15,18);
Current_1000_3_3 (1:6,3) = x10.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_3_3 );
title('Voltage Array for Vin3 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_1000_3_3 (1,1:3) = x10.variable_mat(7:9,25);
Voltage_4_1000_3_3 (2,1:3) = x10.variable_mat(10:12,25);
Voltage_4_1000_3_3 (3,1:3) = x10.variable_mat(13:15,25);
Current_1000_3_3 (1:6,4) = x10.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_1000_3_3);
title('Voltage Array for Vin4 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_3_3 (1,1:3) = x10.variable_mat(7:9,32);
Voltage_5_1000_3_3 (2,1:3) = x10.variable_mat(10:12,32);
Voltage_5_1000_3_3 (3,1:3) = x10.variable_mat(13:15,32);
Current_1000_3_3 (1:6,5) = x10.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_1000_3_3);
title('Voltage Array for Vin5 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_1000_3_3 (1,1:3) = x10.variable_mat(7:9,39);
Voltage_6_1000_3_3 (2,1:3) = x10.variable_mat(10:12,39);
Voltage_6_1000_3_3 (3,1:3) = x10.variable_mat(13:15,39);
Current_1000_3_3 (1:6,6) = x10.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_1000_3_3);
title('Voltage Array for Vin6 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,6)/vin6);

%% FILL DATA INTO ARRAY (10k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_10000_3_3 (1,1:3) = x11.variable_mat(7:9,4);
Voltage_1_10000_3_3 (2,1:3) = x11.variable_mat(10:12,4);
Voltage_1_10000_3_3 (3,1:3) = x11.variable_mat(13:15,4);
Current_10000_3_3 (1:6,1) = x11.variable_mat(41:-1:36,4); 
G_10000_3_3 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_10000_3_3 );
title('Voltage Array for Vin1 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_3_3 (1,1:3) = x11.variable_mat(7:9,11);
Voltage_2_10000_3_3 (2,1:3) = x11.variable_mat(10:12,11);
Voltage_2_10000_3_3 (3,1:3) = x11.variable_mat(13:15,11);
Current_10000_3_3 (1:6,2) = x11.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_10000_3_3 );
title('Voltage Array for Vin2 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_3_3 (1,1:3) = x11.variable_mat(7:9,18);
Voltage_3_10000_3_3 (2,1:3) = x11.variable_mat(10:12,18);
Voltage_3_10000_3_3 (3,1:3) = x11.variable_mat(13:15,18);
Current_10000_3_3 (1:6,3) = x11.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_10000_3_3 );
title('Voltage Array for Vin3 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_10000_3_3 (1,1:3) = x11.variable_mat(7:9,25);
Voltage_4_10000_3_3 (2,1:3) = x11.variable_mat(10:12,25);
Voltage_4_10000_3_3 (3,1:3) = x11.variable_mat(13:15,25);
Current_10000_3_3 (1:6,4) = x11.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_10000_3_3);
title('Voltage Array for Vin4 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_3_3 (1,1:3) = x11.variable_mat(7:9,32);
Voltage_5_10000_3_3 (2,1:3) = x11.variable_mat(10:12,32);
Voltage_5_10000_3_3 (3,1:3) = x11.variable_mat(13:15,32);
Current_10000_3_3 (1:6,5) = x11.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_10000_3_3);
title('Voltage Array for Vin5 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_10000_3_3 (1,1:3) = x11.variable_mat(7:9,39);
Voltage_6_10000_3_3 (2,1:3) = x11.variable_mat(10:12,39);
Voltage_6_10000_3_3 (3,1:3) = x11.variable_mat(13:15,39);
Current_10000_3_3 (1:6,6) = x11.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_10000_3_3);
title('Voltage Array for Vin6 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (100k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_100000_3_3 (1,1:3) = x12.variable_mat(7:9,4);
Voltage_1_100000_3_3 (2,1:3) = x12.variable_mat(10:12,4);
Voltage_1_100000_3_3 (3,1:3) = x12.variable_mat(13:15,4);
Current_100000_3_3 (1:6,1) = x12.variable_mat(41:-1:36,4); 
G_100000_3_3 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_100000_3_3 );
title('Voltage Array for Vin1 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_3_3 (1,1:3) = x12.variable_mat(7:9,11);
Voltage_2_100000_3_3 (2,1:3) = x12.variable_mat(10:12,11);
Voltage_2_100000_3_3 (3,1:3) = x12.variable_mat(13:15,11);
Current_100000_3_3 (1:6,2) = x12.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_100000_3_3 );
title('Voltage Array for Vin2 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_3_3 (1,1:3) = x12.variable_mat(7:9,18);
Voltage_3_100000_3_3 (2,1:3) = x12.variable_mat(10:12,18);
Voltage_3_100000_3_3 (3,1:3) = x12.variable_mat(13:15,18);
Current_100000_3_3 (1:6,3) = x12.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_100000_3_3 );
title('Voltage Array for Vin3 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_100000_3_3 (1,1:3) = x12.variable_mat(7:9,25);
Voltage_4_100000_3_3 (2,1:3) = x12.variable_mat(10:12,25);
Voltage_4_100000_3_3 (3,1:3) = x12.variable_mat(13:15,25);
Current_100000_3_3 (1:6,4) = x12.variable_mat(41:-1:36,25); 
subplot(2,3,4)
heatmap(Voltage_4_100000_3_3);
title('Voltage Array for Vin4 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,4)/vin4);


% setting up Vin5 =\0 array
Voltage_5_100000_3_3 (1,1:3) = x12.variable_mat(7:9,32);
Voltage_5_100000_3_3 (2,1:3) = x12.variable_mat(10:12,32);
Voltage_5_100000_3_3 (3,1:3) = x12.variable_mat(13:15,32);
Current_100000_3_3 (1:6,5) = x12.variable_mat(41:-1:36,32); 
subplot(2,3,5)
heatmap(Voltage_5_100000_3_3);
title('Voltage Array for Vin5 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_100000_3_3 (1,1:3) = x12.variable_mat(7:9,39);
Voltage_6_100000_3_3 (2,1:3) = x12.variable_mat(10:12,39);
Voltage_6_100000_3_3 (3,1:3) = x12.variable_mat(13:15,39);
Current_100000_3_3 (1:6,6) = x12.variable_mat(41:-1:36,39); 
subplot(2,3,6)
heatmap(Voltage_6_100000_3_3);
title('Voltage Array for Vin6 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,6)/vin6);

%% FILL DATA INTO ARRAY (OPEN @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_open_1_1 (1,1:3) = x13.variable_mat(7:9,4);
Voltage_1_open_1_1 (2,1:3) = x13.variable_mat(10:12,4);
Voltage_1_open_1_1 (3,1:3) = x13.variable_mat(13:15,4);
Current_open_1_1 (1:6,1) = x13.variable_mat(40:-1:35,4); 
G_open_1_1 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_open_1_1 );
title('Voltage Array for Vin1 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_1_1 (1,1:3) = x13.variable_mat(7:9,11);
Voltage_2_open_1_1 (2,1:3) = x13.variable_mat(10:12,11);
Voltage_2_open_1_1 (3,1:3) = x13.variable_mat(13:15,11);
Current_open_1_1 (1:6,2) = x13.variable_mat(40:-1:35,11); 
subplot(2,3,2)
heatmap(Voltage_2_open_1_1 );
title('Voltage Array for Vin2 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_open_1_1 (1,1:3) = x13.variable_mat(7:9,18);
Voltage_3_open_1_1 (2,1:3) = x13.variable_mat(10:12,18);
Voltage_3_open_1_1 (3,1:3) = x13.variable_mat(13:15,18);
Current_open_1_1 (1:6,3) = x13.variable_mat(40:-1:35,18); 
subplot(2,3,3)
heatmap(Voltage_3_open_1_1 );
title('Voltage Array for Vin3 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,3)/vin3);


% setting up Vin4 =\0 array
Voltage_4_open_1_1 (1,1:3) = x13.variable_mat(7:9,25);
Voltage_4_open_1_1 (2,1:3) = x13.variable_mat(10:12,25);
Voltage_4_open_1_1 (3,1:3) = x13.variable_mat(13:15,25);
Current_open_1_1 (1:6,4) = x13.variable_mat(40:-1:35,25); 
subplot(2,3,4)
heatmap(Voltage_4_open_1_1);
title('Voltage Array for Vin4 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_open_1_1 (1,1:3) = x13.variable_mat(7:9,32);
Voltage_5_open_1_1 (2,1:3) = x13.variable_mat(10:12,32);
Voltage_5_open_1_1 (3,1:3) = x13.variable_mat(13:15,32);
Current_open_1_1 (1:6,5) = x13.variable_mat(40:-1:35,32); 
subplot(2,3,5)
heatmap(Voltage_5_open_1_1);
title('Voltage Array for Vin5 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_open_1_1 (1,1:3) = x13.variable_mat(7:9,39);
Voltage_6_open_1_1 (2,1:3) = x13.variable_mat(10:12,39);
Voltage_6_open_1_1 (3,1:3) = x13.variable_mat(13:15,39);
Current_open_1_1 (1:6,6) = x13.variable_mat(40:-1:35,39); 
subplot(2,3,6)
heatmap(Voltage_6_open_1_1);
title('Voltage Array for Vin6 (OPEN @ 1,1)')
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (OPEN @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_open_1_2 (1,1:3) = x14.variable_mat(7:9,4);
Voltage_1_open_1_2 (2,1:3) = x14.variable_mat(10:12,4);
Voltage_1_open_1_2 (3,1:3) = x14.variable_mat(13:15,4);
Current_open_1_2 (1:6,1) = x14.variable_mat(40:-1:35,4);
G_open_1_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_open_1_2 );
title('Voltage Array for Vin1 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_1_2 (1,1:3) = x14.variable_mat(7:9,11);
Voltage_2_open_1_2 (2,1:3) = x14.variable_mat(10:12,11);
Voltage_2_open_1_2 (3,1:3) = x14.variable_mat(13:15,11);
Current_open_1_2 (1:6,2) = x14.variable_mat(40:-1:35,11); 
subplot(2,3,2)
heatmap(Voltage_2_open_1_2 );
title('Voltage Array for Vin2 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,2)/vin2);


% setting up Vin3 =\0 array
Voltage_3_open_1_2 (1,1:3) = x14.variable_mat(7:9,18);
Voltage_3_open_1_2 (2,1:3) = x14.variable_mat(10:12,18);
Voltage_3_open_1_2 (3,1:3) = x14.variable_mat(13:15,18);
Current_open_1_2 (1:6,3) = x14.variable_mat(40:-1:35,18); 
subplot(2,3,3)
heatmap(Voltage_3_open_1_2 );
title('Voltage Array for Vin3 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,3)/vin3);


% setting up Vin4 =\0 array
Voltage_4_open_1_2 (1,1:3) = x14.variable_mat(7:9,25);
Voltage_4_open_1_2 (2,1:3) = x14.variable_mat(10:12,25);
Voltage_4_open_1_2 (3,1:3) = x14.variable_mat(13:15,25);
Current_open_1_2 (1:6,4) = x14.variable_mat(40:-1:35,25); 
subplot(2,3,4)
heatmap(Voltage_4_open_1_2);
title('Voltage Array for Vin4 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_open_1_2 (1,1:3) = x14.variable_mat(7:9,32);
Voltage_5_open_1_2 (2,1:3) = x14.variable_mat(10:12,32);
Voltage_5_open_1_2 (3,1:3) = x14.variable_mat(13:15,32);
Current_open_1_2 (1:6,5) = x14.variable_mat(40:-1:35,32); 
subplot(2,3,5)
heatmap(Voltage_5_open_1_2);
title('Voltage Array for Vin5 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_open_1_2 (1,1:3) = x14.variable_mat(7:9,39);
Voltage_6_open_1_2 (2,1:3) = x14.variable_mat(10:12,39);
Voltage_6_open_1_2 (3,1:3) = x14.variable_mat(13:15,39);
Current_open_1_2 (1:6,6) = x14.variable_mat(40:-1:35,39); 
subplot(2,3,6)
heatmap(Voltage_6_open_1_2);
title('Voltage Array for Vin6 (OPEN @ 1,2)')
G_open_1_2 = G_open_1_2 + (Current_open_1_2 (1:6,6)/vin6);

%% FILL DATA INTO ARRAY (OPEN @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_open_2_2 (1,1:3) = x15.variable_mat(7:9,4);
Voltage_1_open_2_2 (2,1:3) = x15.variable_mat(10:12,4);
Voltage_1_open_2_2 (3,1:3) = x15.variable_mat(13:15,4);
Current_open_2_2 (1:6,1) = x15.variable_mat(40:-1:35,4);
G_open_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_open_2_2);
title('Voltage Array for Vin1 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_2_2 (1,1:3) = x15.variable_mat(7:9,11);
Voltage_2_open_2_2 (2,1:3) = x15.variable_mat(10:12,11);
Voltage_2_open_2_2 (3,1:3) = x15.variable_mat(13:15,11);
Current_open_2_2 (1:6,2) = x15.variable_mat(40:-1:35,11); 
subplot(2,3,2)
heatmap(Voltage_2_open_2_2 );
title('Voltage Array for Vin2 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_open_2_2 (1,1:3) = x15.variable_mat(7:9,18);
Voltage_3_open_2_2 (2,1:3) = x15.variable_mat(10:12,18);
Voltage_3_open_2_2 (3,1:3) = x15.variable_mat(13:15,18);
Current_open_2_2 (1:6,3) = x15.variable_mat(40:-1:35,18); 
subplot(2,3,3)
heatmap(Voltage_3_open_2_2 );
title('Voltage Array for Vin3 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_open_2_2 (1,1:3) = x15.variable_mat(7:9,25);
Voltage_4_open_2_2 (2,1:3) = x15.variable_mat(10:12,25);
Voltage_4_open_2_2 (3,1:3) = x15.variable_mat(13:15,25);
Current_open_2_2 (1:6,4) = x15.variable_mat(40:-1:35,25); 
subplot(2,3,4)
heatmap(Voltage_4_open_2_2);
title('Voltage Array for Vin4 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_open_2_2 (1,1:3) = x15.variable_mat(7:9,32);
Voltage_5_open_2_2 (2,1:3) = x15.variable_mat(10:12,32);
Voltage_5_open_2_2 (3,1:3) = x15.variable_mat(13:15,32);
Current_open_2_2 (1:6,5) = x15.variable_mat(40:-1:35,32); 
subplot(2,3,5)
heatmap(Voltage_5_open_2_2);
title('Voltage Array for Vin5 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_open_2_2 (1,1:3) = x15.variable_mat(7:9,39);
Voltage_6_open_2_2 (2,1:3) = x15.variable_mat(10:12,39);
Voltage_6_open_2_2 (3,1:3) = x15.variable_mat(13:15,39);
Current_open_2_2 (1:6,6) = x15.variable_mat(40:-1:35,39); 
subplot(2,3,6)
heatmap(Voltage_6_open_2_2);
title('Voltage Array for Vin6 (OPEN @ 2,2)')
G_open_2_2 = G_open_2_2 + (Current_open_2_2 (1:6,6)/vin6);

%% FILL DATA INTO ARRAY (OPEN @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_open_3_3 (1,1:3) = x16.variable_mat(7:9,4);
Voltage_1_open_3_3 (2,1:3) = x16.variable_mat(10:12,4);
Voltage_1_open_3_3 (3,1:3) = x16.variable_mat(13:15,4);
Current_open_3_3 (1:6,1) = x16.variable_mat(40:-1:35,4); 
G_open_3_3 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_open_3_3 );
title('Voltage Array for Vin1 (OPEN @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_3_3 (1,1:3) = x16.variable_mat(7:9,11);
Voltage_2_open_3_3 (2,1:3) = x16.variable_mat(10:12,11);
Voltage_2_open_3_3 (3,1:3) = x16.variable_mat(13:15,11);
Current_open_3_3 (1:6,2) = x16.variable_mat(40:-1:35,11); 
subplot(2,3,2)
heatmap(Voltage_2_open_3_3 );
title('Voltage Array for Vin2 (OPEN @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_3_3 (1,1:3) = x16.variable_mat(7:9,18);
Voltage_3_1000_3_3 (2,1:3) = x16.variable_mat(10:12,18);
Voltage_3_1000_3_3 (3,1:3) = x16.variable_mat(13:15,18);
Current_open_3_3 (1:6,3) = x16.variable_mat(40:-1:35,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_3_3 );
title('Voltage Array for Vin3 (1k @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Voltage_4_open_3_3 (1,1:3) = x16.variable_mat(7:9,25);
Voltage_4_open_3_3 (2,1:3) = x16.variable_mat(10:12,25);
Voltage_4_open_3_3 (3,1:3) = x16.variable_mat(13:15,25);
Current_open_3_3 (1:6,4) = x16.variable_mat(40:-1:35,25); 
subplot(2,3,4)
heatmap(Voltage_4_open_3_3);
title('Voltage Array for Vin4 (OPEN @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_open_3_3 (1,1:3) = x16.variable_mat(7:9,32);
Voltage_5_open_3_3 (2,1:3) = x16.variable_mat(10:12,32);
Voltage_5_open_3_3 (3,1:3) = x16.variable_mat(13:15,32);
Current_open_3_3 (1:6,5) = x16.variable_mat(40:-1:35,32); 
subplot(2,3,5)
heatmap(Voltage_5_open_3_3);
title('Voltage Array for Vin5 (OPEN @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Voltage_6_open_3_3 (1,1:3) = x16.variable_mat(7:9,39);
Voltage_6_open_3_3 (2,1:3) = x16.variable_mat(10:12,39);
Voltage_6_open_3_3 (3,1:3) = x16.variable_mat(13:15,39);
Current_open_3_3 (1:6,6) = x16.variable_mat(40:-1:35,39); 
subplot(2,3,6)
heatmap(Voltage_6_open_3_3);
title('Voltage Array for Vin6 (OPEN @ 3,3)')
G_open_3_3 = G_open_3_3 + (Current_open_3_3 (1:6,6)/vin6);


%% REVERSE SIGN OF ADMITTANCE ARRAY TO REFLECT CORRECT CURRENT FLOW DIRECTION

G_empty = - G_empty;
G_1000_1_1 = - G_1000_1_1;
G_10000_1_1 = - G_10000_1_1;
G_100000_1_1 = - G_100000_1_1;
G_1000_1_2 = - G_1000_1_2;
G_10000_1_2 = - G_10000_1_2;
G_100000_1_2 = - G_100000_1_2;
G_1000_2_2 = - G_1000_2_2;
G_10000_2_2 = - G_10000_2_2;
G_100000_2_2 = - G_100000_2_2;
G_1000_3_3 = - G_1000_3_3;
G_10000_3_3 = - G_10000_3_3;
G_100000_3_3 = - G_100000_3_3;

G_open_1_1 = - G_open_1_1;
G_open_1_2 = - G_open_1_2;
G_open_2_2 = - G_open_2_2;
G_open_3_3 = - G_open_3_3;

                   
%% LINE RESISTANCE REMOVAL TECHNIQUES

TestAB_1000_1_1 = (G_empty)^-1 - (G_1000_1_1)^-1;
TestAB_10000_1_1 = (G_empty)^-1 - (G_10000_1_1)^-1;
TestAB_100000_1_1 = (G_empty)^-1 - (G_100000_1_1)^-1;
TestAB_1000_1_2 = (G_empty)^-1 - (G_1000_1_2)^-1;
TestAB_10000_1_2 = (G_empty)^-1 - (G_10000_1_2)^-1;
TestAB_100000_1_2 = (G_empty)^-1 - (G_100000_1_2)^-1;
TestAB_1000_2_2 = (G_empty)^-1 - (G_1000_2_2)^-1;
TestAB_10000_2_2 = (G_empty)^-1 - (G_10000_2_2)^-1;
TestAB_100000_2_2 = (G_empty)^-1 - (G_100000_2_2)^-1;
TestAB_1000_3_3 = (G_empty)^-1 - (G_1000_3_3)^-1;
TestAB_10000_3_3 = (G_empty)^-1 - (G_10000_3_3)^-1;
TestAB_100000_3_3 = (G_empty)^-1 - (G_100000_3_3)^-1;

TestCB_1000_1_1 = G_open_1_1 - G_1000_1_1;
TestCB_10000_1_1 = G_open_1_1 - G_10000_1_1;
TestCB_100000_1_1 = G_open_1_1 - G_100000_1_1;
TestCB_1000_1_2= G_open_1_2 - G_1000_1_2;
TestCB_10000_1_2= G_open_1_2 - G_10000_1_2;
TestCB_100000_1_2= G_open_1_2 - G_100000_1_2;
TestCB_1000_2_2 = G_open_2_2 - G_1000_2_2;
TestCB_10000_2_2 = G_open_2_2 - G_10000_2_2;
TestCB_100000_2_2 = G_open_2_2 - G_100000_2_2;
TestCB_1000_3_3 = G_open_3_3 - G_1000_3_3;
TestCB_10000_3_3 = G_open_3_3 - G_10000_3_3;
TestCB_100000_3_3 = G_open_3_3 - G_100000_3_3;

%% SURFACE PLOT OF BOTH LINE RESISTANCE REMOVAL TECHNIQUES

x_plot = [1 2 3 4 5 6];
y_plot = [6 5 4 3 2 1];

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestAB_1000_1_1);
title({'Surface Plot of 1k\Omega at [1,1]', 'using the empty matrix'})
zlim([6*10^9 7*10^9])
subplot(1,3,2)
surf(x_plot,y_plot,TestAB_10000_1_1);
title({'Surface Plot of 10k\Omega at [1,1]', 'using the empty matrix'})
zlim([5*10^9 6*10^9])
subplot(1,3,3)
surf(x_plot,y_plot,TestAB_100000_1_1);
title({'Surface Plot of 100k\Omega at [1,1]', 'using the empty matrix'})
zlim([6*10^9 7*10^9])

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestAB_1000_1_2);
title({'Surface Plot of 1k\Omega at [1,2]', 'using the empty matrix'})
zlim([1*10^9 2*10^9])
subplot(1,3,2)
surf(x_plot,y_plot,TestAB_10000_1_2);
title({'Surface Plot of 10k\Omega at [1,2]', 'using the empty matrix'})
zlim([5*10^9 6*10^9])
subplot(1,3,3)
surf(x_plot,y_plot,TestAB_100000_1_2);
title({'Surface Plot of 100k\Omega at [1,2]', 'using the empty matrix'})
zlim([-5*10^9 -4*10^9])

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestAB_1000_2_2);
title({'Surface Plot of 1k\Omega at [2,2]', 'using the empty matrix'})
zlim([1*10^9 2*10^9])
subplot(1,3,2)
surf(x_plot,y_plot,TestAB_10000_2_2);
title({'Surface Plot of 10k\Omega at [2,2]', 'using the empty matrix'})
zlim([1*10^17 2*10^17])
subplot(1,3,3)
surf(x_plot,y_plot,TestAB_100000_2_2);
title({'Surface Plot of 100k\Omega at [2,2]', 'using the empty matrix'})
zlim([6*10^9 7*10^9])


figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_1);
title({'Surface Plot of 1k\Omega at [1,1]', 'using the open matrix'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_1);
title({'Surface Plot of 10k\Omega at [1,1]', 'using the open matrix'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_1);
title({'Surface Plot of 100k\Omega at [1,1]', 'using the open matrix'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_2);
title({'Surface Plot of 1k\Omega at [1,2]', 'using the open matrix'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_2);
title({'Surface Plot of 10k\Omega at [1,2]', 'using the open matrix'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_2);
title({'Surface Plot of 100k\Omega at [1,2]', 'using the open matrix'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_2_2);
title({'Surface Plot of 1k\Omega at [2,2]', 'using the open matrix'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_2_2);
title({'Surface Plot of 10k\Omega at [2,2]', 'using the open matrix'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_2_2);
title({'Surface Plot of 100k\Omega at [2,2]', 'using the open matrix'})


%% INVERSIONS

% Estimation of Position [1,1]
quarter_1000_1_1_1 = (TestCB_1000_1_1(1:3,1:3)).^-1;
quarter_1000_1_1_2 = (TestCB_1000_1_1(1:3,4:6)).^-1;
quarter_1000_1_1_3 = (TestCB_1000_1_1(4:6,1:3)).^-1;
quarter_1000_1_1_4 = (TestCB_1000_1_1(4:6,4:6)).^-1;
G_1000_1_1_est = (-quarter_1000_1_1_1 + quarter_1000_1_1_2 + quarter_1000_1_1_3 + -quarter_1000_1_1_4)./((1/8.5)*10^6);

quarter_10000_1_1_1 = (TestCB_10000_1_1(1:3,1:3)).^-1;
quarter_10000_1_1_2 = (TestCB_10000_1_1(1:3,4:6)).^-1;
quarter_10000_1_1_3 = (TestCB_10000_1_1(4:6,1:3)).^-1;
quarter_10000_1_1_4 = (TestCB_10000_1_1(4:6,4:6)).^-1;
G_10000_1_1_est = (-quarter_10000_1_1_1 + quarter_10000_1_1_2 + quarter_10000_1_1_3 + -quarter_10000_1_1_4)./((1/8.5)*10^6);

quarter_100000_1_1_1 = (TestCB_100000_1_1(1:3,1:3)).^-1;
quarter_100000_1_1_2 = (TestCB_100000_1_1(1:3,4:6)).^-1;
quarter_100000_1_1_3 = (TestCB_100000_1_1(4:6,1:3)).^-1;
quarter_100000_1_1_4 = (TestCB_100000_1_1(4:6,4:6)).^-1;
G_100000_1_1_est = (-quarter_100000_1_1_1 + quarter_100000_1_1_2 + quarter_100000_1_1_3 + -quarter_100000_1_1_4)./((1/8.5)*10^6);

% Estimation of Position [2,2]
quarter_1000_2_2_1 = (TestCB_1000_2_2(1:3,1:3)).^-1;
quarter_1000_2_2_2 = (TestCB_1000_2_2(1:3,4:6)).^-1;
quarter_1000_2_2_3 = (TestCB_1000_2_2(4:6,1:3)).^-1;
quarter_1000_2_2_4 = (TestCB_1000_2_2(4:6,4:6)).^-1;
G_1000_2_2_est = (-quarter_1000_2_2_1 + quarter_1000_2_2_2 + quarter_1000_2_2_3 + -quarter_1000_2_2_4)./((1/8.5)*10^6);

quarter_10000_2_2_1 = (TestCB_10000_2_2(1:3,1:3)).^-1;
quarter_10000_2_2_2 = (TestCB_10000_2_2(1:3,4:6)).^-1;
quarter_10000_2_2_3 = (TestCB_10000_2_2(4:6,1:3)).^-1;
quarter_10000_2_2_4 = (TestCB_10000_2_2(4:6,4:6)).^-1;
G_10000_2_2_est = (-quarter_10000_2_2_1 + quarter_10000_2_2_2 + quarter_10000_2_2_3 + -quarter_10000_2_2_4)./((1/8.5)*10^6);

quarter_100000_2_2_1 = (TestCB_100000_2_2(1:3,1:3)).^-1;
quarter_100000_2_2_2 = (TestCB_100000_2_2(1:3,4:6)).^-1;
quarter_100000_2_2_3 = (TestCB_100000_2_2(4:6,1:3)).^-1;
quarter_100000_2_2_4 = (TestCB_100000_2_2(4:6,4:6)).^-1;
G_100000_2_2_est = (-quarter_100000_2_2_1 + quarter_100000_2_2_2 + quarter_100000_2_2_3 + -quarter_100000_2_2_4)./((1/8.5)*10^6);

% Estimation of Position [1,2]
quarter_1000_1_2_1 = (TestCB_1000_1_2(1:3,1:3)).^-1;
quarter_1000_1_2_2 = (TestCB_1000_1_2(1:3,4:6)).^-1;
quarter_1000_1_2_3 = (TestCB_1000_1_2(4:6,1:3)).^-1;
quarter_1000_1_2_4 = (TestCB_1000_1_2(4:6,4:6)).^-1;
G_1000_1_2_est = (-quarter_1000_1_2_1 + quarter_1000_1_2_2 + quarter_1000_1_2_3 + -quarter_1000_1_2_4)./((1/8.5)*10^6);

quarter_10000_1_2_1 = (TestCB_10000_1_2(1:3,1:3)).^-1;
quarter_10000_1_2_2 = (TestCB_10000_1_2(1:3,4:6)).^-1;
quarter_10000_1_2_3 = (TestCB_10000_1_2(4:6,1:3)).^-1;
quarter_10000_1_2_4 = (TestCB_10000_1_2(4:6,4:6)).^-1;
G_10000_1_2_est = (-quarter_10000_1_2_1 + quarter_10000_1_2_2 + quarter_10000_1_2_3 + -quarter_10000_1_2_4)./((1/8.5)*10^6);

quarter_100000_1_2_1 = (TestCB_100000_1_2(1:3,1:3)).^-1;
quarter_100000_1_2_2 = (TestCB_100000_1_2(1:3,4:6)).^-1;
quarter_100000_1_2_3 = (TestCB_100000_1_2(4:6,1:3)).^-1;
quarter_100000_1_2_4 = (TestCB_100000_1_2(4:6,4:6)).^-1;
G_100000_1_2_est = (-quarter_100000_1_2_1 + quarter_100000_1_2_2 + quarter_100000_1_2_3 + -quarter_100000_1_2_4)./((1/8.5)*10^6);


% Set any NaN to zero
G_1000_1_1_est(isnan(G_1000_1_1_est)) = 0;
G_10000_1_1_est(isnan(G_10000_1_1_est)) = 0;
G_100000_1_1_est(isnan(G_100000_1_1_est)) = 0;
G_1000_2_2_est(isnan(G_1000_2_2_est)) = 0;
G_10000_2_2_est(isnan(G_10000_2_2_est)) = 0;
G_100000_2_2_est(isnan(G_100000_2_2_est)) = 0;
G_1000_1_2_est(isnan(G_1000_1_2_est)) = 0;
G_10000_1_2_est(isnan(G_10000_1_2_est)) = 0;
G_100000_1_2_est(isnan(G_100000_1_2_est)) = 0;

figure
subplot(1,3,1)
heatmap(G_1000_1_1_est);
title({'Estimation of Memristor Array', '1k @ [1,1]'})
subplot(1,3,2)
heatmap(G_10000_1_1_est);
title({'Estimation of Memristor Array', '10k @ [1,1]'})
subplot(1,3,3)
heatmap(G_100000_1_1_est);
title({'Estimation of Memristor Array', '100k @ [1,1]'})

figure
subplot(2,3,4)
heatmap(G_1000_2_2_est);
title({'Estimation of Memristor Array', '1k @ [2,2]'})
subplot(2,3,5)
heatmap(G_10000_2_2_est);
title({'Estimation of Memristor Array', '10k @ [2,2]'})
subplot(2,3,6)
heatmap(G_100000_2_2_est);
title({'Estimation of Memristor Array', '100k @ [2,2]'})

subplot(2,3,1)
heatmap(G_1000_1_2_est);
title({'Estimation of Memristor Array', '1k @ [1,2]'})
subplot(2,3,2)
heatmap(G_10000_1_2_est);
title({'Estimation of Memristor Array', '10k @ [1,2]'})
subplot(2,3,3)
heatmap(G_100000_1_2_est);
title({'Estimation of Memristor Array', '100k @ [1,2]'})


% Ratio check between conductance matrices
ratio_check1 = (TestCB_1000_1_1) ./ (TestCB_10000_1_1);
ratio_check2 = TestCB_1000_1_1 ./ TestCB_100000_1_1;
ratio_check3 = TestCB_10000_1_1 ./ TestCB_100000_1_1;

ratio_check4 = TestCB_1000_1_2 ./ TestCB_10000_1_2;
ratio_check5 = TestCB_1000_1_2 ./ TestCB_100000_1_2;
ratio_check6 = TestCB_10000_1_2 ./ TestCB_100000_1_2;

ratio_check7 = TestCB_1000_2_2 ./ TestCB_10000_2_2;
ratio_check8 = TestCB_1000_2_2 ./ TestCB_100000_2_2;
ratio_check9 = TestCB_10000_2_2 ./ TestCB_100000_2_2;

%% SURFACE PLOT ANALYSIS OF QUARTERS

figure
subplot(2,2,1)
surf([1 2 3],[3 2 1],TestCB_1000_1_1(1:3,1:3));
title({'Surface Plot of First Quarter', '1k\Omega at [1,1] using the open matrix'})
subplot(2,2,2)
surf([1 2 3],[3 2 1],TestCB_1000_1_1(1:3,4:6));
title({'Surface Plot of Second Quarter', '1k\Omega at [1,1] using the open matrix'})
subplot(2,2,3)
surf([1 2 3],[3 2 1],TestCB_1000_1_1(4:6,1:3));
title({'Surface Plot of Third Quarter', '1k\Omega at [1,1] using the open matrix'})
subplot(2,2,4)
surf([1 2 3],[3 2 1],TestCB_1000_1_1(4:6,4:6));
title({'Surface Plot of Fourth Quarter', '1k\Omega at [1,1] using the open matrix'})


%% ORTHOGONALITY TEST

G_1000_1_1_mod = 0;
G_1000_1_2_mod = 0;
for i = 1:6
    for j = 1:6
        G_1000_1_1_mod = G_1000_1_1_mod + G_1000_1_1(i,j)^2;
    end
end
for i = 1:6
    for j = 1:6
        G_1000_1_2_mod = G_1000_1_2_mod + G_1000_1_2(i,j)^2;
    end
end
G_1000_1_1_mod = sqrt(G_1000_1_1_mod);
G_1000_1_2_mod = sqrt(G_1000_1_2_mod);
orthogonal_test_1 = (G_1000_1_1 * G_1000_1_2)/(G_1000_1_1_mod * G_1000_1_2_mod);


TestCB_1000_1_1_mod = 0;
TestCB_1000_1_2_mod = 0;
for i = 1:6
    for j = 1:6
        TestCB_1000_1_1_mod = TestCB_1000_1_1_mod + TestCB_1000_1_1(i,j)^2;
    end
end
for i = 1:6
    for j = 1:6
        TestCB_1000_1_2_mod = TestCB_1000_1_2_mod + TestCB_1000_1_2(i,j)^2;
    end
end
TestCB_1000_1_1_mod = sqrt(TestCB_1000_1_1_mod);
TestCB_1000_1_2_mod = sqrt(TestCB_1000_1_2_mod);
orthogonal_test_2 = (TestCB_1000_1_1 * TestCB_1000_1_2)/(TestCB_1000_1_1_mod * TestCB_1000_1_2_mod);

G_1000_1_1_mod = 0;
G_1000_2_2_mod = 0;
for i = 1:6
    for j = 1:6
        G_1000_1_1_mod = G_1000_1_1_mod + G_1000_1_1(i,j)^2;
    end
end
for i = 1:6
    for j = 1:6
        G_1000_2_2_mod = G_1000_2_2_mod + G_1000_2_2(i,j)^2;
    end
end
G_1000_1_1_mod = sqrt(G_1000_1_1_mod);
G_1000_2_2_mod = sqrt(G_1000_2_2_mod);
orthogonal_test_3 = (G_1000_1_1 * G_1000_2_2)/(G_1000_1_1_mod * G_1000_2_2_mod);


TestCB_1000_1_1_mod = 0;
TestCB_1000_2_2_mod = 0;
for i = 1:6
    for j = 1:6
        TestCB_1000_1_1_mod = TestCB_1000_1_1_mod + TestCB_1000_1_1(i,j)^2;
    end
end
for i = 1:6
    for j = 1:6
        TestCB_1000_2_2_mod = TestCB_1000_2_2_mod + TestCB_1000_2_2(i,j)^2;
    end
end
TestCB_1000_1_1_mod = sqrt(TestCB_1000_1_1_mod);
TestCB_1000_2_2_mod = sqrt(TestCB_1000_2_2_mod);
orthogonal_test_4 = (TestCB_1000_1_1 * TestCB_1000_2_2)/(TestCB_1000_1_1_mod * TestCB_1000_2_2_mod);

G_10000_1_1_mod = 0;
G_10000_1_2_mod = 0;
for i = 1:6
    for j = 1:6
        G_10000_1_1_mod = G_10000_1_1_mod + G_10000_1_1(i,j)^2;
    end
end
for i = 1:6
    for j = 1:6
        G_10000_1_2_mod = G_10000_1_2_mod + G_10000_1_2(i,j)^2;
    end
end
G_10000_1_1_mod = sqrt(G_10000_1_1_mod);
G_10000_1_2_mod = sqrt(G_10000_1_2_mod);
orthogonal_test_5 = (G_10000_1_1 * G_10000_1_2)/(G_10000_1_1_mod * G_10000_1_2_mod);



