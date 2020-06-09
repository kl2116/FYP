%% LOAD LTSPICE DATA
clear all;
x = LTspice2Matlab('Memristor_modelling_2.RAW');
% memristor at position 1,1
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
Voltage_4_1000_1_2 (1,1:3) = x4.variable_mat(7:9,26);
Voltage_4_1000_1_2 (2,1:3) = x4.variable_mat(10:12,26);
Voltage_4_1000_1_2 (3,1:3) = x4.variable_mat(13:15,26);
Current_1000_1_2 (1:6,4) = x4.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_1000_1_2);
title('Voltage Array for Vin4 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_1_2 (1,1:3) = x4.variable_mat(7:9,33);
Voltage_5_1000_1_2 (2,1:3) = x4.variable_mat(10:12,33);
Voltage_5_1000_1_2 (3,1:3) = x4.variable_mat(13:15,33);
Current_1000_1_2 (1:6,5) = x4.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_1000_1_2);
title('Voltage Array for Vin5 (1k @ 1,2)')
G_1000_1_2 = G_1000_1_2 + (Current_1000_1_2 (1:6,5)/vin5);

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
Voltage_4_10000_1_2 (1,1:3) = x5.variable_mat(7:9,26);
Voltage_4_10000_1_2 (2,1:3) = x5.variable_mat(10:12,26);
Voltage_4_10000_1_2 (3,1:3) = x5.variable_mat(13:15,26);
Current_10000_1_2 (1:6,4) = x5.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_10000_1_2);
title('Voltage Array for Vin4 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_1_2 (1,1:3) = x5.variable_mat(7:9,33);
Voltage_5_10000_1_2 (2,1:3) = x5.variable_mat(10:12,33);
Voltage_5_10000_1_2 (3,1:3) = x5.variable_mat(13:15,33);
Current_10000_1_2 (1:6,5) = x5.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_10000_1_2);
title('Voltage Array for Vin5 (10k @ 1,2)')
G_10000_1_2 = G_10000_1_2 + (Current_10000_1_2 (1:6,5)/vin5);

%% FILL DATA INTO ARRAY (100k @ 1,2)

% setting up Vin1 =\0 array
Voltage_100000_1_2 (1,1:3) = x6.variable_mat(7:9,4);
Voltage_100000_1_2 (2,1:3) = x6.variable_mat(10:12,4);
Voltage_100000_1_2 (3,1:3) = x6.variable_mat(13:15,4);
Current_100000_1_2 (1:6,1) = x6.variable_mat(41:-1:36,4); 
G_100000_1_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_100000_1_2 );
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

%% FILL DATA INTO ARRAY (1k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_1000_2_2 (1,1:3) = x7.variable_mat(7:9,4);
Voltage_1_1000_2_2 (2,1:3) = x7.variable_mat(10:12,4);
Voltage_1_1000_2_2 (3,1:3) = x7.variable_mat(13:15,4);
Current_1000_2_2 (1:6,1) = x7.variable_mat(41:-1:36,4);
G_1000_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_1_1000_1_1);
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
Voltage_4_1000_2_2 (1,1:3) = x7.variable_mat(7:9,26);
Voltage_4_1000_2_2 (2,1:3) = x7.variable_mat(10:12,26);
Voltage_4_1000_2_2 (3,1:3) = x7.variable_mat(13:15,26);
Current_1000_2_2 (1:6,4) = x7.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_1000_2_2);
title('Voltage Array for Vin4 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_1000_2_2 (1,1:3) = x7.variable_mat(7:9,33);
Voltage_5_1000_2_2 (2,1:3) = x7.variable_mat(10:12,33);
Voltage_5_1000_2_2 (3,1:3) = x7.variable_mat(13:15,33);
Current_1000_2_2 (1:6,5) = x7.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_1000_2_2);
title('Voltage Array for Vin5 (1k @ 2,2)')
G_1000_2_2 = G_1000_2_2 + (Current_1000_2_2 (1:6,5)/vin5);


%% FILL DATA INTO ARRAY (10k @ 2,2)

% setting up Vin1 =\0 array
Voltage_10000_2_2 (1,1:3) = x8.variable_mat(7:9,4);
Voltage_10000_2_2 (2,1:3) = x8.variable_mat(10:12,4);
Voltage_10000_2_2 (3,1:3) = x8.variable_mat(13:15,4);
Current_10000_2_2 (1:6,1) = x8.variable_mat(41:-1:36,4);
G_10000_2_2 = zeros(6,6);
figure
subplot(2,3,1)
heatmap(Voltage_10000_2_2 );
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
Voltage_4_10000_2_2 (1,1:3) = x8.variable_mat(7:9,26);
Voltage_4_10000_2_2 (2,1:3) = x8.variable_mat(10:12,26);
Voltage_4_10000_2_2 (3,1:3) = x8.variable_mat(13:15,26);
Current_10000_2_2 (1:6,4) = x8.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_10000_2_2);
title('Voltage Array for Vin4 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_2_2(1,1:3) = x8.variable_mat(7:9,33);
Voltage_5_10000_2_2 (2,1:3) = x8.variable_mat(10:12,33);
Voltage_5_10000_2_2 (3,1:3) = x8.variable_mat(13:15,33);
Current_10000_2_2 (1:6,5) = x8.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_10000_2_2);
title('Voltage Array for Vin5 (10k @ 2,2)')
G_10000_2_2 = G_10000_2_2 + (Current_10000_2_2 (1:6,5)/vin5);


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
Voltage_4_1000_3_3 (1,1:3) = x10.variable_mat(7:9,26);
Voltage_4_1000_3_3 (2,1:3) = x10.variable_mat(10:12,26);
Voltage_4_1000_3_3 (3,1:3) = x10.variable_mat(13:15,26);
Current_1000_3_3 (1:6,4) = x10.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_1000_3_3);
title('Voltage Array for Vin4 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,4)/vin4);


% setting up Vin5 =\0 array
Voltage_5_1000_3_3 (1,1:3) = x10.variable_mat(7:9,33);
Voltage_5_1000_3_3 (2,1:3) = x10.variable_mat(10:12,33);
Voltage_5_1000_3_3 (3,1:3) = x10.variable_mat(13:15,33);
Current_1000_3_3 (1:6,5) = x10.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_1000_3_3);
title('Voltage Array for Vin5 (1k @ 3,3)')
G_1000_3_3 = G_1000_3_3 + (Current_1000_3_3 (1:6,5)/vin5);

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
Voltage_4_10000_3_3 (1,1:3) = x11.variable_mat(7:9,26);
Voltage_4_10000_3_3 (2,1:3) = x11.variable_mat(10:12,26);
Voltage_4_10000_3_3 (3,1:3) = x11.variable_mat(13:15,26);
Current_10000_3_3 (1:6,4) = x11.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_10000_3_3);
title('Voltage Array for Vin4 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Voltage_5_10000_3_3 (1,1:3) = x11.variable_mat(7:9,33);
Voltage_5_10000_3_3 (2,1:3) = x11.variable_mat(10:12,33);
Voltage_5_10000_3_3 (3,1:3) = x11.variable_mat(13:15,33);
Current_10000_3_3 (1:6,5) = x11.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_10000_3_3);
title('Voltage Array for Vin5 (10k @ 3,3)')
G_10000_3_3 = G_10000_3_3 + (Current_10000_3_3 (1:6,5)/vin5);


%% FILL DATA INTO ARRAY (10k @ 3,3)

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
Voltage_4_100000_3_3 (1,1:3) = x12.variable_mat(7:9,26);
Voltage_4_100000_3_3 (2,1:3) = x12.variable_mat(10:12,26);
Voltage_4_100000_3_3 (3,1:3) = x12.variable_mat(13:15,26);
Current_100000_3_3 (1:6,4) = x12.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_100000_3_3);
title('Voltage Array for Vin4 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,4)/vin4);


% setting up Vin5 =\0 array
Voltage_5_100000_3_3 (1,1:3) = x12.variable_mat(7:9,33);
Voltage_5_100000_3_3 (2,1:3) = x12.variable_mat(10:12,33);
Voltage_5_100000_3_3 (3,1:3) = x12.variable_mat(13:15,33);
Current_100000_3_3 (1:6,5) = x12.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_100000_3_3);
title('Voltage Array for Vin5 (100k @ 3,3)')
G_100000_3_3 = G_100000_3_3 + (Current_100000_3_3 (1:6,5)/vin5);


%% CONDUCTANCE OPERATIONS (5x5) - Create the 5x5 version by removing a column and row (Vin6 = 0)

G_empty_5_by_5 = reshape(G_empty(eye(6)'~=1),5,6);
G_empty_5_by_5(:,6) = [];

G_1000_1_1_5_by_5 = reshape(G_1000_1_1(eye(6)'~=1),5,6);
G_1000_1_1_5_by_5(:,6) = [];
G_10000_1_1_5_by_5 = reshape(G_10000_1_1(eye(6)'~=1),5,6);
G_10000_1_1_5_by_5(:,6) = [];
G_100000_1_1_5_by_5 = reshape(G_100000_1_1(eye(6)'~=1),5,6);
G_100000_1_1_5_by_5(:,6) = [];

G_1000_1_2_5_by_5 = reshape(G_1000_1_2(eye(6)'~=1),5,6);
G_1000_1_2_5_by_5(:,6) = [];
G_10000_1_2_5_by_5 = reshape(G_10000_1_2(eye(6)'~=1),5,6);
G_10000_1_2_5_by_5(:,6) = [];
G_100000_1_2_5_by_5 = reshape(G_100000_1_2(eye(6)'~=1),5,6);
G_100000_1_2_5_by_5(:,6) = [];

G_1000_2_2_5_by_5 = reshape(G_1000_2_2(eye(6)'~=1),5,6);
G_1000_2_2_5_by_5(:,6) = [];
G_10000_2_2_5_by_5 = reshape(G_10000_2_2(eye(6)'~=1),5,6);
G_10000_2_2_5_by_5(:,6) = [];
G_100000_2_2_5_by_5 = reshape(G_100000_2_2(eye(6)'~=1),5,6);
G_100000_2_2_5_by_5(:,6) = [];


G_1000_3_3_5_by_5 = reshape(G_1000_2_2(eye(6)'~=1),5,6);
G_1000_3_3_5_by_5(:,6) = [];
G_10000_3_3_5_by_5 = reshape(G_10000_2_2(eye(6)'~=1),5,6);
G_10000_3_3_5_by_5(:,6) = [];
G_100000_3_3_5_by_5 = reshape(G_100000_2_2(eye(6)'~=1),5,6);
G_100000_3_3_5_by_5(:,6) = [];


%% Formation of Full Conductance Matrix

G_scaled_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 - G_empty_5_by_5;
G_scaled_10000_1_1_5_by_5 = G_10000_1_1_5_by_5 - G_empty_5_by_5;
G_scaled_100000_1_1_5_by_5 = G_100000_1_1_5_by_5 - G_empty_5_by_5;
G_scaled_1000_1_2_5_by_5 = G_1000_1_2_5_by_5 - G_empty_5_by_5;
G_scaled_10000_1_2_5_by_5 = G_10000_1_2_5_by_5 - G_empty_5_by_5;
G_scaled_100000_1_2_5_by_5 = G_100000_1_2_5_by_5 - G_empty_5_by_5;
G_scaled_1000_2_2_5_by_5 = G_1000_2_2_5_by_5 - G_empty_5_by_5;
G_scaled_10000_2_2_5_by_5 = G_10000_2_2_5_by_5 - G_empty_5_by_5;
G_scaled_100000_2_2_5_by_5 = G_100000_2_2_5_by_5 - G_empty_5_by_5;


G_scaled_1000_3_3_5_by_5 = G_1000_3_3_5_by_5 - G_empty_5_by_5;
G_scaled_10000_3_3_5_by_5 = G_10000_3_3_5_by_5 - G_empty_5_by_5;
G_scaled_100000_3_3_5_by_5 = G_100000_3_3_5_by_5 - G_empty_5_by_5;

                    
%% Full Conductance Matrix Surface Plot
x_plot = [1 2 3 4 5];
y_plot = [5 4 3 2 1];   % negative to allow for same array layout as conductance array numbering

figure
subplot(1,3,1)
surf(x_plot,y_plot,G_scaled_1000_1_1_5_by_5);
title('Surface Plot of 1k\Omega at 1,1')
subplot(1,3,2)
surf(x_plot,y_plot,G_scaled_10000_1_1_5_by_5);
title('Surface Plot of 10k\Omega at 1,1')
subplot(1,3,3)
surf(x_plot,y_plot,G_scaled_100000_1_1_5_by_5);
title('Surface Plot of 100k\Omega at 1,1')

figure
subplot(1,3,1)
surf(x_plot,y_plot,G_scaled_1000_1_2_5_by_5);
title('Surface Plot of 1k\Omega at 1,2')
subplot(1,3,2)
surf(x_plot,y_plot,G_scaled_10000_1_2_5_by_5);
title('Surface Plot of 10k\Omega at 1,2')
subplot(1,3,3)
surf(x_plot,y_plot,G_scaled_100000_1_2_5_by_5);
title('Surface Plot of 100k\Omega at 1,2')

figure
subplot(1,3,1)
surf(x_plot,y_plot,G_scaled_1000_2_2_5_by_5);
title('Surface Plot of 1k\Omega at 2,2')
subplot(1,3,2)
surf(x_plot,y_plot,G_scaled_10000_2_2_5_by_5);
title('Surface Plot of 10k\Omega at 2,2')
subplot(1,3,3)
surf(x_plot,y_plot,G_scaled_100000_2_2_5_by_5);
title('Surface Plot of 100k\Omega at 2,2')


%% Ratio Check

comp_10000_1000_1_1_5_by_5 = G_scaled_10000_1_1_5_by_5 ./ G_scaled_1000_1_1_5_by_5; 
comp_100000_1000_1_1_5_by_5 = G_scaled_100000_1_1_5_by_5 ./ G_scaled_1000_1_1_5_by_5; 
comp_100000_10000_1_1_5_by_5 = G_scaled_100000_1_1_5_by_5 ./ G_scaled_10000_1_1_5_by_5;

comp_10000_1000_1_2_5_by_5 = G_scaled_10000_1_2_5_by_5 ./ G_scaled_1000_1_2_5_by_5; 
comp_100000_1000_1_2_5_by_5 = G_scaled_100000_1_2_5_by_5 ./ G_scaled_1000_1_2_5_by_5; 
comp_100000_10000_1_2_5_by_5 = G_scaled_100000_1_2_5_by_5 ./ G_scaled_10000_1_2_5_by_5;

comp_10000_1000_2_2_5_by_5 = G_scaled_10000_2_2_5_by_5 ./ G_scaled_1000_2_2_5_by_5; 
comp_100000_1000_2_2_5_by_5 = G_scaled_100000_2_2_5_by_5 ./ G_scaled_1000_2_2_5_by_5; 
comp_100000_10000_2_2_5_by_5 = G_scaled_100000_2_2_5_by_5 ./ G_scaled_10000_2_2_5_by_5;

comp_10000_1000_3_3_5_by_5 = G_scaled_10000_3_3_5_by_5 ./ G_scaled_1000_3_3_5_by_5; 
comp_100000_1000_3_3_5_by_5 = G_scaled_100000_3_3_5_by_5 ./ G_scaled_1000_3_3_5_by_5; 
comp_100000_10000_3_3_5_by_5 = G_scaled_100000_3_3_5_by_5 ./ G_scaled_10000_3_3_5_by_5;


check = G_1000_1_1_5_by_5 ./ G_10000_1_1_5_by_5;
check1_1 = G_scaled_1000_1_1_5_by_5./ G_scaled_1000_1_2_5_by_5; 
check1_2 = G_scaled_100000_1_1_5_by_5./ G_scaled_100000_1_2_5_by_5; 

check2_1 = G_scaled_1000_1_1_5_by_5 ./ G_scaled_1000_3_3_5_by_5;

check3_1 = G_empty_5_by_5 ./ G_1000_1_1_5_by_5;
check3_2 = G_empty_5_by_5 ./ G_1000_1_2_5_by_5;
check3_3 = G_empty_5_by_5 ./ G_1000_2_2_5_by_5;
check3_4 = G_empty_5_by_5 ./ G_1000_3_3_5_by_5;

check4_1 = G_empty_5_by_5 ./ G_scaled_1000_1_1_5_by_5;
check4_2 = G_empty_5_by_5 ./ G_scaled_1000_1_2_5_by_5;
check4_3 = G_empty_5_by_5 ./ G_scaled_1000_2_2_5_by_5;
check4_4 = G_empty_5_by_5 ./ G_scaled_1000_3_3_5_by_5;




