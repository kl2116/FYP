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

vin1 = [2 ;0 ;0];
vin2 = [0 ;2 ;0];
vin3 = [0 ;0 ;2];

%% FILL DATA INTO ARRAYS (Empty)

% setting up Vin1 =\0 array
Voltage_1_empty(1,1:3) = x.variable_mat(7:9,4);
Voltage_1_empty(2,1:3) = x.variable_mat(10:12,4);
Voltage_1_empty(3,1:3) = x.variable_mat(13:15,4);
Current_empty_bias_terminal(1:3,1) = x.variable_mat(39:-1:37,4);
Current_empty_gnd_terminal(1:3,1) = x.variable_mat(36:-1:34,4);
G_empty_bias_terminal = zeros(3,3);
G_empty_gnd_terminal = zeros(3,3);
G_empty_bias_terminal = G_empty_bias_terminal + (Current_empty_bias_terminal(1:3,1)/vin1);
G_empty_gnd_terminal = G_empty_gnd_terminal + (Current_empty_gnd_terminal(1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_empty(1,1:3) = x.variable_mat(7:9,11);
Voltage_2_empty(2,1:3) = x.variable_mat(10:12,11);
Voltage_2_empty(3,1:3) = x.variable_mat(13:15,11);
Current_empty_bias_terminal(1:3,2) = x.variable_mat(39:-1:37,11); 
Current_empty_gnd_terminal(1:3,2) = x.variable_mat(36:-1:34,11); 
G_empty_bias_terminal = G_empty_bias_terminal + (Current_empty_bias_terminal(1:3,2)/vin2);
G_empty_gnd_terminal = G_empty_gnd_terminal + (Current_empty_gnd_terminal(1:3,2)/vin2);


% setting up Vin3 =\0 array
Voltage_3_empty(1,1:3) = x.variable_mat(7:9,18);
Voltage_3_empty(2,1:3) = x.variable_mat(10:12,18);
Voltage_3_empty(3,1:3) = x.variable_mat(13:15,18);
Current_empty_bias_terminal(1:3,3) = x.variable_mat(39:-1:37,18); 
Current_empty_gnd_terminal(1:3,3) = x.variable_mat(36:-1:34,18); 
G_empty_bias_terminal = G_empty_bias_terminal + (Current_empty_bias_terminal(1:3,3)/vin3);
G_empty_gnd_terminal = G_empty_gnd_terminal + (Current_empty_gnd_terminal(1:3,3)/vin3);

%% FILL DATA INTO ARRAY (1k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_1000_1_1 (1,1:3) = x1.variable_mat(7:9,4);
Voltage_1_1000_1_1 (2,1:3) = x1.variable_mat(10:12,4);
Voltage_1_1000_1_1 (3,1:3) = x1.variable_mat(13:15,4);
Current_1000_1_1_bias_terminal (1:3,1) = x1.variable_mat(41:-1:39,4);
Current_1000_1_1_gnd_terminal (1:3,1) = x1.variable_mat(38:-1:36,4);
G_1000_1_1_bias_terminal = zeros(3,3);
G_1000_1_1_gnd_terminal = zeros(3,3);
G_1000_1_1_bias_terminal = G_1000_1_1_bias_terminal + (Current_1000_1_1_bias_terminal (1:3,1)/vin1);
G_1000_1_1_gnd_terminal = G_1000_1_1_gnd_terminal + (Current_1000_1_1_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_1_1 (1,1:3) = x1.variable_mat(7:9,11);
Voltage_2_1000_1_1 (2,1:3) = x1.variable_mat(10:12,11);
Voltage_2_1000_1_1 (3,1:3) = x1.variable_mat(13:15,11);
Current_1000_1_1_bias_terminal (1:3,2) = x1.variable_mat(41:-1:39,11);
Current_1000_1_1_gnd_terminal (1:3,2) = x1.variable_mat(38:-1:36,11); 
G_1000_1_1_bias_terminal= G_1000_1_1_bias_terminal + (Current_1000_1_1_bias_terminal (1:3,2)/vin2);
G_1000_1_1_gnd_terminal= G_1000_1_1_gnd_terminal + (Current_1000_1_1_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_1_1 (1,1:3) = x1.variable_mat(7:9,18);
Voltage_3_1000_1_1 (2,1:3) = x1.variable_mat(10:12,18);
Voltage_3_1000_1_1 (3,1:3) = x1.variable_mat(13:15,18);
Current_1000_1_1_bias_terminal (1:3,3) = x1.variable_mat(41:-1:39,18); 
Current_1000_1_1_gnd_terminal (1:3,3) = x1.variable_mat(38:-1:36,18); 
G_1000_1_1_bias_terminal = G_1000_1_1_bias_terminal + (Current_1000_1_1_bias_terminal (1:3,3)/vin3);
G_1000_1_1_gnd_terminal = G_1000_1_1_gnd_terminal + (Current_1000_1_1_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (10k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_10000_1_1 (1,1:3) = x2.variable_mat(7:9,4);
Voltage_1_10000_1_1 (2,1:3) = x2.variable_mat(10:12,4);
Voltage_1_10000_1_1 (3,1:3) = x2.variable_mat(13:15,4);
Current_10000_1_1_bias_terminal (1:3,1) = x2.variable_mat(41:-1:39,4);
Current_10000_1_1_gnd_terminal (1:3,1) = x2.variable_mat(38:-1:36,4);
G_10000_1_1_bias_terminal = zeros(3,3);
G_10000_1_1_gnd_terminal = zeros(3,3);
G_10000_1_1_bias_terminal = G_10000_1_1_bias_terminal + (Current_10000_1_1_bias_terminal (1:3,1)/vin1);
G_10000_1_1_gnd_terminal = G_10000_1_1_gnd_terminal + (Current_10000_1_1_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_1_1 (1,1:3) = x2.variable_mat(7:9,11);
Voltage_2_10000_1_1 (2,1:3) = x2.variable_mat(10:12,11);
Voltage_2_10000_1_1 (3,1:3) = x2.variable_mat(13:15,11);
Current_10000_1_1_bias_terminal (1:3,2) = x2.variable_mat(41:-1:39,11); 
Current_10000_1_1_gnd_terminal (1:3,2) = x2.variable_mat(38:-1:36,11); 
G_10000_1_1_bias_terminal = G_10000_1_1_bias_terminal + (Current_10000_1_1_bias_terminal (1:3,2)/vin2);
G_10000_1_1_gnd_terminal = G_10000_1_1_gnd_terminal + (Current_10000_1_1_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_1_1 (1,1:3) = x2.variable_mat(7:9,18);
Voltage_3_10000_1_1 (2,1:3) = x2.variable_mat(10:12,18);
Voltage_3_10000_1_1 (3,1:3) = x2.variable_mat(13:15,18);
Current_10000_1_1_bias_terminal (1:3,3) = x2.variable_mat(41:-1:39,18); 
Current_10000_1_1_gnd_terminal (1:3,3) = x2.variable_mat(38:-1:36,18); 
G_10000_1_1_bias_terminal = G_10000_1_1_bias_terminal + (Current_10000_1_1_bias_terminal (1:3,3)/vin3);
G_10000_1_1_gnd_terminal = G_10000_1_1_gnd_terminal + (Current_10000_1_1_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (100k @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_100000_1_1 (1,1:3) = x3.variable_mat(7:9,4);
Voltage_1_100000_1_1 (2,1:3) = x3.variable_mat(10:12,4);
Voltage_1_100000_1_1 (3,1:3) = x3.variable_mat(13:15,4);
Current_100000_1_1_bias_terminal(1:3,1) = x3.variable_mat(41:-1:39,4); 
Current_100000_1_1_gnd_terminal(1:3,1) = x3.variable_mat(38:-1:36,4); 
G_100000_1_1_bias_terminal = zeros(3,3);
G_100000_1_1_gnd_terminal = zeros(3,3);
G_100000_1_1_bias_terminal = G_100000_1_1_bias_terminal + (Current_100000_1_1_bias_terminal (1:3,1)/vin1);
G_100000_1_1_gnd_terminal = G_100000_1_1_gnd_terminal + (Current_100000_1_1_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_1_1 (1,1:3) = x3.variable_mat(7:9,11);
Voltage_2_100000_1_1 (2,1:3) = x3.variable_mat(10:12,11);
Voltage_2_100000_1_1 (3,1:3) = x3.variable_mat(13:15,11);
Current_100000_1_1_bias_terminal (1:3,2) = x3.variable_mat(41:-1:39,11); 
Current_100000_1_1_gnd_terminal (1:3,2) = x3.variable_mat(38:-1:36,11); 
G_100000_1_1_bias_terminal = G_100000_1_1_bias_terminal + (Current_100000_1_1_bias_terminal (1:3,2)/vin2);
G_100000_1_1_gnd_terminal = G_100000_1_1_gnd_terminal + (Current_100000_1_1_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_1_1 (1,1:3) = x3.variable_mat(7:9,18);
Voltage_3_100000_1_1 (2,1:3) = x3.variable_mat(10:12,18);
Voltage_3_100000_1_1 (3,1:3) = x3.variable_mat(13:15,18);
Current_100000_1_1_bias_terminal (1:3,3) = x3.variable_mat(41:-1:39,18); 
Current_100000_1_1_gnd_terminal (1:3,3) = x3.variable_mat(38:-1:36,18); 
G_100000_1_1_bias_terminal = G_100000_1_1_bias_terminal + (Current_100000_1_1_bias_terminal (1:3,3)/vin3);
G_100000_1_1_gnd_terminal = G_100000_1_1_gnd_terminal + (Current_100000_1_1_gnd_terminal (1:3,3)/vin3);

%% FILL DATA INTO ARRAY (1k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_1000_1_2 (1,1:3) = x4.variable_mat(7:9,4);
Voltage_1_1000_1_2 (2,1:3) = x4.variable_mat(10:12,4);
Voltage_1_1000_1_2 (3,1:3) = x4.variable_mat(13:15,4);
Current_1000_1_2_bias_terminal (1:3,1) = x4.variable_mat(41:-1:39,4);
Current_1000_1_2_gnd_terminal (1:3,1) = x4.variable_mat(38:-1:36,4);
G_1000_1_2_bias_terminal = zeros(3,3);
G_1000_1_2_gnd_terminal = zeros(3,3);
G_1000_1_2_bias_terminal = G_1000_1_2_bias_terminal + (Current_1000_1_2_bias_terminal (1:3,1)/vin1);
G_1000_1_2_gnd_terminal = G_1000_1_2_gnd_terminal + (Current_1000_1_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_1_2 (1,1:3) = x4.variable_mat(7:9,11);
Voltage_2_1000_1_2 (2,1:3) = x4.variable_mat(10:12,11);
Voltage_2_1000_1_2 (3,1:3) = x4.variable_mat(13:15,11);
Current_1000_1_2_bias_terminal (1:3,2) = x4.variable_mat(41:-1:39,11); 
Current_1000_1_2_gnd_terminal (1:3,2) = x4.variable_mat(38:-1:36,11); 
G_1000_1_2_bias_terminal = G_1000_1_2_bias_terminal + (Current_1000_1_2_bias_terminal (1:3,2)/vin2);
G_1000_1_2_gnd_terminal = G_1000_1_2_gnd_terminal + (Current_1000_1_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_1_2 (1,1:3) = x4.variable_mat(7:9,18);
Voltage_3_1000_1_2 (2,1:3) = x4.variable_mat(10:12,18);
Voltage_3_1000_1_2 (3,1:3) = x4.variable_mat(13:15,18);
Current_1000_1_2_bias_terminal (1:3,3) = x4.variable_mat(41:-1:39,18); 
Current_1000_1_2_gnd_terminal (1:3,3) = x4.variable_mat(38:-1:36,18); 
G_1000_1_2_bias_terminal = G_1000_1_2_bias_terminal + (Current_1000_1_2_bias_terminal (1:3,3)/vin3);
G_1000_1_2_gnd_terminal = G_1000_1_2_gnd_terminal + (Current_1000_1_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (10k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_10000_1_2 (1,1:3) = x5.variable_mat(7:9,4);
Voltage_1_10000_1_2 (2,1:3) = x5.variable_mat(10:12,4);
Voltage_1_10000_1_2 (3,1:3) = x5.variable_mat(13:15,4);
Current_10000_1_2_bias_terminal (1:3,1) = x5.variable_mat(41:-1:39,4); 
Current_10000_1_2_gnd_terminal (1:3,1) = x5.variable_mat(38:-1:36,4); 
G_10000_1_2_bias_terminal = zeros(3,3);
G_10000_1_2_gnd_terminal = zeros(3,3);
G_10000_1_2_bias_terminal = G_10000_1_2_bias_terminal + (Current_10000_1_2_bias_terminal (1:3,1)/vin1);
G_10000_1_2_gnd_terminal = G_10000_1_2_gnd_terminal + (Current_10000_1_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_1_2 (1,1:3) = x5.variable_mat(7:9,11);
Voltage_2_10000_1_2 (2,1:3) = x5.variable_mat(10:12,11);
Voltage_2_10000_1_2 (3,1:3) = x5.variable_mat(13:15,11);
Current_10000_1_2_bias_terminal (1:3,2) = x5.variable_mat(41:-1:39,11);
Current_10000_1_2_gnd_terminal (1:3,2) = x5.variable_mat(38:-1:36,11);
G_10000_1_2_bias_terminal = G_10000_1_2_bias_terminal + (Current_10000_1_2_bias_terminal (1:3,2)/vin2);
G_10000_1_2_gnd_terminal = G_10000_1_2_gnd_terminal + (Current_10000_1_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_1_2 (1,1:3) = x5.variable_mat(7:9,18);
Voltage_3_10000_1_2 (2,1:3) = x5.variable_mat(10:12,18);
Voltage_3_10000_1_2 (3,1:3) = x5.variable_mat(13:15,18);
Current_10000_1_2_bias_terminal (1:3,3) = x5.variable_mat(41:-1:39,18); 
Current_10000_1_2_gnd_terminal (1:3,3) = x5.variable_mat(38:-1:36,18); 
G_10000_1_2_bias_terminal = G_10000_1_2_bias_terminal + (Current_10000_1_2_bias_terminal (1:3,3)/vin3);
G_10000_1_2_gnd_terminal = G_10000_1_2_gnd_terminal + (Current_10000_1_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (100k @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_100000_1_2 (1,1:3) = x6.variable_mat(7:9,4);
Voltage_1_100000_1_2 (2,1:3) = x6.variable_mat(10:12,4);
Voltage_1_100000_1_2 (3,1:3) = x6.variable_mat(13:15,4);
Current_100000_1_2_bias_terminal (1:3,1) = x6.variable_mat(41:-1:39,4); 
Current_100000_1_2_gnd_terminal (1:3,1) = x6.variable_mat(38:-1:36,4); 
G_100000_1_2_bias_terminal = zeros(3,3);
G_100000_1_2_gnd_terminal = zeros(3,3);
G_100000_1_2_bias_terminal = G_100000_1_2_bias_terminal + (Current_100000_1_2_bias_terminal (1:3,1)/vin1);
G_100000_1_2_gnd_terminal = G_100000_1_2_gnd_terminal + (Current_100000_1_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_1_2 (1,1:3) = x6.variable_mat(7:9,11);
Voltage_2_100000_1_2 (2,1:3) = x6.variable_mat(10:12,11);
Voltage_2_100000_1_2 (3,1:3) = x6.variable_mat(13:15,11);
Current_100000_1_2_bias_terminal (1:3,2) = x6.variable_mat(41:-1:39,11);
Current_100000_1_2_gnd_terminal (1:3,2) = x6.variable_mat(38:-1:36,11);
G_100000_1_2_bias_terminal = G_100000_1_2_bias_terminal + (Current_100000_1_2_bias_terminal (1:3,2)/vin2);
G_100000_1_2_gnd_terminal = G_100000_1_2_gnd_terminal + (Current_100000_1_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_1_2 (1,1:3) = x6.variable_mat(7:9,18);
Voltage_3_100000_1_2 (2,1:3) = x6.variable_mat(10:12,18);
Voltage_3_100000_1_2 (3,1:3) = x6.variable_mat(13:15,18);
Current_100000_1_2_bias_terminal (1:3,3) = x6.variable_mat(41:-1:39,18); 
Current_100000_1_2_gnd_terminal (1:3,3) = x6.variable_mat(38:-1:36,18); 
G_100000_1_2_bias_terminal = G_100000_1_2_bias_terminal + (Current_100000_1_2_bias_terminal (1:3,3)/vin3);
G_100000_1_2_gnd_terminal = G_100000_1_2_gnd_terminal + (Current_100000_1_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (1k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_1000_2_2 (1,1:3) = x7.variable_mat(7:9,4);
Voltage_1_1000_2_2 (2,1:3) = x7.variable_mat(10:12,4);
Voltage_1_1000_2_2 (3,1:3) = x7.variable_mat(13:15,4);
Current_1000_2_2_bias_terminal (1:3,1) = x7.variable_mat(41:-1:39,4);
Current_1000_2_2_gnd_terminal (1:3,1) = x7.variable_mat(38:-1:36,4);
G_1000_2_2_bias_terminal = zeros(3,3);
G_1000_2_2_gnd_terminal = zeros(3,3);
G_1000_2_2_bias_terminal = G_1000_2_2_bias_terminal + (Current_1000_2_2_bias_terminal (1:3,1)/vin1);
G_1000_2_2_gnd_terminal = G_1000_2_2_gnd_terminal + (Current_1000_2_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_2_2 (1,1:3) = x7.variable_mat(7:9,11);
Voltage_2_1000_2_2 (2,1:3) = x7.variable_mat(10:12,11);
Voltage_2_1000_2_2 (3,1:3) = x7.variable_mat(13:15,11);
Current_1000_2_2_bias_terminal (1:3,2) = x7.variable_mat(41:-1:39,11); 
Current_1000_2_2_gnd_terminal (1:3,2) = x7.variable_mat(38:-1:36,11); 
G_1000_2_2_bias_terminal = G_1000_2_2_bias_terminal + (Current_1000_2_2_bias_terminal (1:3,2)/vin2);
G_1000_2_2_gnd_terminal = G_1000_2_2_gnd_terminal + (Current_1000_2_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_2_2 (1,1:3) = x7.variable_mat(7:9,18);
Voltage_3_1000_2_2 (2,1:3) = x7.variable_mat(10:12,18);
Voltage_3_1000_2_2 (3,1:3) = x7.variable_mat(13:15,18);
Current_1000_2_2_bias_terminal (1:3,3) = x7.variable_mat(41:-1:39,18); 
Current_1000_2_2_gnd_terminal (1:3,3) = x7.variable_mat(38:-1:36,18); 
G_1000_2_2_bias_terminal = G_1000_2_2_bias_terminal + (Current_1000_2_2_bias_terminal (1:3,3)/vin3);
G_1000_2_2_gnd_terminal = G_1000_2_2_gnd_terminal + (Current_1000_2_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (10k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_10000_2_2 (1,1:3) = x8.variable_mat(7:9,4);
Voltage_1_10000_2_2 (2,1:3) = x8.variable_mat(10:12,4);
Voltage_1_10000_2_2 (3,1:3) = x8.variable_mat(13:15,4);
Current_10000_2_2_bias_terminal (1:3,1) = x8.variable_mat(41:-1:39,4);
Current_10000_2_2_gnd_terminal (1:3,1) = x8.variable_mat(38:-1:36,4);
G_10000_2_2_bias_terminal = zeros(3,3);
G_10000_2_2_gnd_terminal = zeros(3,3);
G_10000_2_2_bias_terminal = G_10000_2_2_bias_terminal + (Current_10000_2_2_bias_terminal (1:3,1)/vin1);
G_10000_2_2_gnd_terminal = G_10000_2_2_gnd_terminal + (Current_10000_2_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_2_2 (1,1:3) = x8.variable_mat(7:9,11);
Voltage_2_10000_2_2 (2,1:3) = x8.variable_mat(10:12,11);
Voltage_2_10000_2_2 (3,1:3) = x8.variable_mat(13:15,11);
Current_10000_2_2_bias_terminal (1:3,2) = x8.variable_mat(41:-1:39,11); 
Current_10000_2_2_gnd_terminal (1:3,2) = x8.variable_mat(38:-1:36,11); 
G_10000_2_2_bias_terminal = G_10000_2_2_bias_terminal + (Current_10000_2_2_bias_terminal (1:3,2)/vin2);
G_10000_2_2_gnd_terminal = G_10000_2_2_gnd_terminal + (Current_10000_2_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_2_2 (1,1:3) = x8.variable_mat(7:9,18);
Voltage_3_10000_2_2 (2,1:3) = x8.variable_mat(10:12,18);
Voltage_3_10000_2_2 (3,1:3) = x8.variable_mat(13:15,18);
Current_10000_2_2_bias_terminal (1:3,3) = x8.variable_mat(41:-1:39,18); 
Current_10000_2_2_gnd_terminal (1:3,3) = x8.variable_mat(38:-1:36,18); 
G_10000_2_2_bias_terminal = G_10000_2_2_bias_terminal + (Current_10000_2_2_bias_terminal (1:3,3)/vin3);
G_10000_2_2_gnd_terminal = G_10000_2_2_gnd_terminal + (Current_10000_2_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (100k @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_100000_2_2 (1,1:3) = x9.variable_mat(7:9,4);
Voltage_1_100000_2_2 (2,1:3) = x9.variable_mat(10:12,4);
Voltage_1_100000_2_2 (3,1:3) = x9.variable_mat(13:15,4);
Current_100000_2_2_bias_terminal (1:3,1) = x9.variable_mat(41:-1:39,4);
Current_100000_2_2_gnd_terminal (1:3,1) = x9.variable_mat(38:-1:36,4);
G_100000_2_2_bias_terminal = zeros(3,3);
G_100000_2_2_gnd_terminal = zeros(3,3);
G_100000_2_2_bias_terminal = G_100000_2_2_bias_terminal + (Current_100000_2_2_bias_terminal (1:3,1)/vin1);
G_100000_2_2_gnd_terminal = G_100000_2_2_gnd_terminal + (Current_100000_2_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_2_2 (1,1:3) = x9.variable_mat(7:9,11);
Voltage_2_100000_2_2 (2,1:3) = x9.variable_mat(10:12,11);
Voltage_2_100000_2_2 (3,1:3) = x9.variable_mat(13:15,11);
Current_100000_2_2_bias_terminal (1:3,2) = x9.variable_mat(41:-1:39,11); 
Current_100000_2_2_gnd_terminal (1:3,2) = x9.variable_mat(38:-1:36,11); 
G_100000_2_2_bias_terminal = G_100000_2_2_bias_terminal + (Current_100000_2_2_bias_terminal (1:3,2)/vin2);
G_100000_2_2_gnd_terminal = G_100000_2_2_gnd_terminal + (Current_100000_2_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_2_2 (1,1:3) = x9.variable_mat(7:9,18);
Voltage_3_100000_2_2 (2,1:3) = x9.variable_mat(10:12,18);
Voltage_3_100000_2_2 (3,1:3) = x9.variable_mat(13:15,18);
Current_100000_2_2_bias_terminal (1:3,3) = x9.variable_mat(41:-1:39,18); 
Current_100000_2_2_gnd_terminal (1:3,3) = x9.variable_mat(38:-1:36,18); 
G_100000_2_2_bias_terminal = G_100000_2_2_bias_terminal + (Current_100000_2_2_bias_terminal (1:3,3)/vin3);
G_100000_2_2_gnd_terminal = G_100000_2_2_gnd_terminal + (Current_100000_2_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (1k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_1000_3_3 (1,1:3) = x10.variable_mat(7:9,4);
Voltage_1_1000_3_3 (2,1:3) = x10.variable_mat(10:12,4);
Voltage_1_1000_3_3 (3,1:3) = x10.variable_mat(13:15,4);
Current_1000_3_3_bias_terminal (1:3,1) = x10.variable_mat(41:-1:39,4);
Current_1000_3_3_gnd_terminal (1:3,1) = x10.variable_mat(38:-1:36,4);
G_1000_3_3_bias_terminal = zeros(3,3);
G_1000_3_3_gnd_terminal = zeros(3,3);
G_1000_3_3_bias_terminal = G_1000_3_3_bias_terminal + (Current_1000_3_3_bias_terminal (1:3,1)/vin1);
G_1000_3_3_gnd_terminal = G_1000_3_3_gnd_terminal + (Current_1000_3_3_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_1000_3_3 (1,1:3) = x10.variable_mat(7:9,11);
Voltage_2_1000_3_3 (2,1:3) = x10.variable_mat(10:12,11);
Voltage_2_1000_3_3 (3,1:3) = x10.variable_mat(13:15,11);
Current_1000_3_3_bias_terminal (1:3,2) = x10.variable_mat(41:-1:39,11); 
Current_1000_3_3_gnd_terminal (1:3,2) = x10.variable_mat(38:-1:36,11); 
G_1000_3_3_bias_terminal = G_1000_3_3_bias_terminal + (Current_1000_3_3_bias_terminal (1:3,2)/vin2);
G_1000_3_3_gnd_terminal = G_1000_3_3_gnd_terminal + (Current_1000_3_3_gnd_terminal (1:3,2)/vin2);


% setting up Vin3 =\0 array
Voltage_3_1000_3_3 (1,1:3) = x10.variable_mat(7:9,18);
Voltage_3_1000_3_3 (2,1:3) = x10.variable_mat(10:12,18);
Voltage_3_1000_3_3 (3,1:3) = x10.variable_mat(13:15,18);
Current_1000_3_3_bias_terminal (1:3,3) = x10.variable_mat(41:-1:39,18); 
Current_1000_3_3_gnd_terminal (1:3,3) = x10.variable_mat(38:-1:36,18); 
G_1000_3_3_bias_terminal = G_1000_3_3_bias_terminal + (Current_1000_3_3_bias_terminal (1:3,3)/vin3);
G_1000_3_3_gnd_terminal = G_1000_3_3_gnd_terminal + (Current_1000_3_3_gnd_terminal (1:3,3)/vin3);

%% FILL DATA INTO ARRAY (10k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_10000_3_3 (1,1:3) = x11.variable_mat(7:9,4);
Voltage_1_10000_3_3 (2,1:3) = x11.variable_mat(10:12,4);
Voltage_1_10000_3_3 (3,1:3) = x11.variable_mat(13:15,4);
Current_10000_3_3_bias_terminal (1:3,1) = x11.variable_mat(41:-1:39,4); 
Current_10000_3_3_gnd_terminal (1:3,1) = x11.variable_mat(38:-1:36,4); 
G_10000_3_3_bias_terminal = zeros(3,3);
G_10000_3_3_gnd_terminal = zeros(3,3);
G_10000_3_3_bias_terminal = G_10000_3_3_bias_terminal + (Current_10000_3_3_bias_terminal (1:3,1)/vin1);
G_10000_3_3_gnd_terminal = G_10000_3_3_gnd_terminal + (Current_10000_3_3_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_10000_3_3 (1,1:3) = x11.variable_mat(7:9,11);
Voltage_2_10000_3_3 (2,1:3) = x11.variable_mat(10:12,11);
Voltage_2_10000_3_3 (3,1:3) = x11.variable_mat(13:15,11);
Current_10000_3_3_bias_terminal (1:3,2) = x11.variable_mat(41:-1:39,11); 
Current_10000_3_3_gnd_terminal (1:3,2) = x11.variable_mat(38:-1:36,11); 
G_10000_3_3_bias_terminal = G_10000_3_3_bias_terminal + (Current_10000_3_3_bias_terminal (1:3,2)/vin2);
G_10000_3_3_gnd_terminal = G_10000_3_3_gnd_terminal + (Current_10000_3_3_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_10000_3_3 (1,1:3) = x11.variable_mat(7:9,18);
Voltage_3_10000_3_3 (2,1:3) = x11.variable_mat(10:12,18);
Voltage_3_10000_3_3 (3,1:3) = x11.variable_mat(13:15,18);
Current_10000_3_3_bias_terminal (1:3,3) = x11.variable_mat(41:-1:39,18); 
Current_10000_3_3_gnd_terminal (1:3,3) = x11.variable_mat(38:-1:36,18); 
G_10000_3_3_bias_terminal = G_10000_3_3_bias_terminal + (Current_10000_3_3_bias_terminal (1:3,3)/vin3);
G_10000_3_3_gnd_terminal = G_10000_3_3_gnd_terminal + (Current_10000_3_3_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (100k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_100000_3_3 (1,1:3) = x12.variable_mat(7:9,4);
Voltage_1_100000_3_3 (2,1:3) = x12.variable_mat(10:12,4);
Voltage_1_100000_3_3 (3,1:3) = x12.variable_mat(13:15,4);
Current_100000_3_3_bias_terminal (1:3,1) = x12.variable_mat(41:-1:39,4); 
Current_100000_3_3_gnd_terminal (1:3,1) = x12.variable_mat(38:-1:36,4); 
G_100000_3_3_bias_terminal = zeros(3,3);
G_100000_3_3_gnd_terminal = zeros(3,3);
G_100000_3_3_bias_terminal = G_100000_3_3_bias_terminal + (Current_100000_3_3_bias_terminal (1:3,1)/vin1);
G_100000_3_3_gnd_terminal = G_100000_3_3_gnd_terminal + (Current_100000_3_3_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_100000_3_3 (1,1:3) = x12.variable_mat(7:9,11);
Voltage_2_100000_3_3 (2,1:3) = x12.variable_mat(10:12,11);
Voltage_2_100000_3_3 (3,1:3) = x12.variable_mat(13:15,11);
Current_100000_3_3_bias_terminal (1:3,2) = x12.variable_mat(41:-1:39,11); 
Current_100000_3_3_gnd_terminal (1:3,2) = x12.variable_mat(38:-1:36,11); 
G_100000_3_3_bias_terminal = G_100000_3_3_bias_terminal + (Current_100000_3_3_bias_terminal (1:3,2)/vin2);
G_100000_3_3_gnd_terminal = G_100000_3_3_gnd_terminal + (Current_100000_3_3_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_100000_3_3 (1,1:3) = x12.variable_mat(7:9,18);
Voltage_3_100000_3_3 (2,1:3) = x12.variable_mat(10:12,18);
Voltage_3_100000_3_3 (3,1:3) = x12.variable_mat(13:15,18);
Current_100000_3_3_bias_terminal (1:3,3) = x12.variable_mat(41:-1:39,18); 
Current_100000_3_3_gnd_terminal (1:3,3) = x12.variable_mat(38:-1:36,18); 
G_100000_3_3_bias_terminal = G_100000_3_3_bias_terminal + (Current_100000_3_3_bias_terminal (1:3,3)/vin3);
G_100000_3_3_gnd_terminal = G_100000_3_3_gnd_terminal + (Current_100000_3_3_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (OPEN @ 1,1)

% setting up Vin1 =\0 array
Voltage_1_open_1_1 (1,1:3) = x13.variable_mat(7:9,4);
Voltage_1_open_1_1 (2,1:3) = x13.variable_mat(10:12,4);
Voltage_1_open_1_1 (3,1:3) = x13.variable_mat(13:15,4);
Current_open_1_1_bias_terminal (1:3,1) = x13.variable_mat(40:-1:38,4);
Current_open_1_1_gnd_terminal (1:3,1) = x13.variable_mat(37:-1:35,4);
G_open_1_1_bias_terminal = zeros(3,3);
G_open_1_1_gnd_terminal = zeros(3,3);
G_open_1_1_bias_terminal = G_open_1_1_bias_terminal + (Current_open_1_1_bias_terminal (1:3,1)/vin1);
G_open_1_1_gnd_terminal = G_open_1_1_gnd_terminal + (Current_open_1_1_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_1_1 (1,1:3) = x13.variable_mat(7:9,11);
Voltage_2_open_1_1 (2,1:3) = x13.variable_mat(10:12,11);
Voltage_2_open_1_1 (3,1:3) = x13.variable_mat(13:15,11);
Current_open_1_1_bias_terminal (1:3,2) = x13.variable_mat(40:-1:38,11);
Current_open_1_1_gnd_terminal (1:3,2) = x13.variable_mat(37:-1:35,11);
G_open_1_1_bias_terminal = G_open_1_1_bias_terminal + (Current_open_1_1_bias_terminal (1:3,2)/vin2);
G_open_1_1_gnd_terminal = G_open_1_1_gnd_terminal + (Current_open_1_1_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_open_1_1 (1,1:3) = x13.variable_mat(7:9,18);
Voltage_3_open_1_1 (2,1:3) = x13.variable_mat(10:12,18);
Voltage_3_open_1_1 (3,1:3) = x13.variable_mat(13:15,18);
Current_open_1_1_bias_terminal (1:3,3) = x13.variable_mat(40:-1:38,18); 
Current_open_1_1_gnd_terminal (1:3,3) = x13.variable_mat(37:-1:35,18); 
G_open_1_1_bias_terminal = G_open_1_1_bias_terminal + (Current_open_1_1_bias_terminal (1:3,3)/vin3);
G_open_1_1_gnd_terminal = G_open_1_1_gnd_terminal + (Current_open_1_1_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (OPEN @ 1,2)

% setting up Vin1 =\0 array
Voltage_1_open_1_2 (1,1:3) = x14.variable_mat(7:9,4);
Voltage_1_open_1_2 (2,1:3) = x14.variable_mat(10:12,4);
Voltage_1_open_1_2 (3,1:3) = x14.variable_mat(13:15,4);
Current_open_1_2_bias_terminal (1:3,1) = x14.variable_mat(40:-1:38,4);
Current_open_1_2_gnd_terminal (1:3,1) = x14.variable_mat(37:-1:35,4);
G_open_1_2_bias_terminal = zeros(3,3);
G_open_1_2_gnd_terminal = zeros(3,3);
G_open_1_2_bias_terminal = G_open_1_2_bias_terminal + (Current_open_1_2_bias_terminal (1:3,1)/vin1);
G_open_1_2_gnd_terminal = G_open_1_2_gnd_terminal + (Current_open_1_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_1_2 (1,1:3) = x14.variable_mat(7:9,11);
Voltage_2_open_1_2 (2,1:3) = x14.variable_mat(10:12,11);
Voltage_2_open_1_2 (3,1:3) = x14.variable_mat(13:15,11);
Current_open_1_2_bias_terminal (1:3,2) = x14.variable_mat(40:-1:38,11); 
Current_open_1_2_gnd_terminal (1:3,2) = x14.variable_mat(37:-1:35,11); 
G_open_1_2_bias_terminal = G_open_1_2_bias_terminal + (Current_open_1_2_bias_terminal (1:3,2)/vin2);
G_open_1_2_gnd_terminal = G_open_1_2_gnd_terminal + (Current_open_1_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_open_1_2 (1,1:3) = x14.variable_mat(7:9,18);
Voltage_3_open_1_2 (2,1:3) = x14.variable_mat(10:12,18);
Voltage_3_open_1_2 (3,1:3) = x14.variable_mat(13:15,18);
Current_open_1_2_bias_terminal (1:3,3) = x14.variable_mat(40:-1:38,18);
Current_open_1_2_gnd_terminal (1:3,3) = x14.variable_mat(37:-1:35,18);
G_open_1_2_bias_terminal = G_open_1_2_bias_terminal + (Current_open_1_2_bias_terminal (1:3,3)/vin3);
G_open_1_2_gnd_terminal = G_open_1_2_gnd_terminal + (Current_open_1_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (OPEN @ 2,2)

% setting up Vin1 =\0 array
Voltage_1_open_2_2 (1,1:3) = x15.variable_mat(7:9,4);
Voltage_1_open_2_2 (2,1:3) = x15.variable_mat(10:12,4);
Voltage_1_open_2_2 (3,1:3) = x15.variable_mat(13:15,4);
Current_open_2_2_bias_terminal (1:3,1) = x15.variable_mat(40:-1:38,4);
Current_open_2_2_gnd_terminal (1:3,1) = x15.variable_mat(37:-1:35,4);
G_open_2_2_bias_terminal = zeros(3,3);
G_open_2_2_gnd_terminal = zeros(3,3);
G_open_2_2_bias_terminal = G_open_2_2_bias_terminal + (Current_open_2_2_bias_terminal (1:3,1)/vin1);
G_open_2_2_gnd_terminal = G_open_2_2_gnd_terminal + (Current_open_2_2_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_2_2 (1,1:3) = x15.variable_mat(7:9,11);
Voltage_2_open_2_2 (2,1:3) = x15.variable_mat(10:12,11);
Voltage_2_open_2_2 (3,1:3) = x15.variable_mat(13:15,11);
Current_open_2_2_bias_terminal (1:3,2) = x15.variable_mat(40:-1:38,11); 
Current_open_2_2_gnd_terminal (1:3,2) = x15.variable_mat(37:-1:35,11); 
G_open_2_2_bias_terminal = G_open_2_2_bias_terminal + (Current_open_2_2_bias_terminal (1:3,2)/vin2);
G_open_2_2_gnd_terminal = G_open_2_2_gnd_terminal + (Current_open_2_2_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_open_2_2 (1,1:3) = x15.variable_mat(7:9,18);
Voltage_3_open_2_2 (2,1:3) = x15.variable_mat(10:12,18);
Voltage_3_open_2_2 (3,1:3) = x15.variable_mat(13:15,18);
Current_open_2_2_bias_terminal (1:3,3) = x15.variable_mat(40:-1:38,18); 
Current_open_2_2_gnd_terminal (1:3,3) = x15.variable_mat(37:-1:35,18); 
G_open_2_2_bias_terminal = G_open_2_2_bias_terminal + (Current_open_2_2_bias_terminal (1:3,3)/vin3);
G_open_2_2_gnd_terminal = G_open_2_2_gnd_terminal + (Current_open_2_2_gnd_terminal (1:3,3)/vin3);


%% FILL DATA INTO ARRAY (OPEN @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_open_3_3 (1,1:3) = x16.variable_mat(7:9,4);
Voltage_1_open_3_3 (2,1:3) = x16.variable_mat(10:12,4);
Voltage_1_open_3_3 (3,1:3) = x16.variable_mat(13:15,4);
Current_open_3_3_bias_terminal (1:3,1) = x16.variable_mat(40:-1:38,4);
Current_open_3_3_gnd_terminal (1:3,1) = x16.variable_mat(37:-1:35,4);
G_open_3_3_bias_terminal = zeros(3,3);
G_open_3_3_gnd_terminal = zeros(3,3);
G_open_3_3_bias_terminal = G_open_3_3_bias_terminal + (Current_open_3_3_bias_terminal (1:3,1)/vin1);
G_open_3_3_gnd_terminal = G_open_3_3_gnd_terminal + (Current_open_3_3_gnd_terminal (1:3,1)/vin1);

% setting up Vin2 =\0 array
Voltage_2_open_3_3 (1,1:3) = x16.variable_mat(7:9,11);
Voltage_2_open_3_3 (2,1:3) = x16.variable_mat(10:12,11);
Voltage_2_open_3_3 (3,1:3) = x16.variable_mat(13:15,11);
Current_open_3_3_bias_terminal (1:3,2) = x16.variable_mat(40:-1:38,11); 
Current_open_3_3_gnd_terminal (1:3,2) = x16.variable_mat(37:-1:35,11); 
G_open_3_3_bias_terminal = G_open_3_3_bias_terminal + (Current_open_3_3_bias_terminal (1:3,2)/vin2);
G_open_3_3_gnd_terminal = G_open_3_3_gnd_terminal + (Current_open_3_3_gnd_terminal (1:3,2)/vin2);

% setting up Vin3 =\0 array
Voltage_3_1000_3_3 (1,1:3) = x16.variable_mat(7:9,18);
Voltage_3_1000_3_3 (2,1:3) = x16.variable_mat(10:12,18);
Voltage_3_1000_3_3 (3,1:3) = x16.variable_mat(13:15,18);
Current_open_3_3_bias_terminal (1:3,3) = x16.variable_mat(40:-1:38,18); 
Current_open_3_3_gnd_terminal (1:3,3) = x16.variable_mat(37:-1:35,18); 
G_open_3_3_bias_terminal = G_open_3_3_bias_terminal + (Current_open_3_3_bias_terminal (1:3,3)/vin3);
G_open_3_3_gnd_terminal = G_open_3_3_gnd_terminal + (Current_open_3_3_gnd_terminal (1:3,3)/vin3);


%% REVERSE SIGN OF ADMITTANCE ARRAY TO REFLECT CORRECT CURRENT FLOW DIRECTION

G_empty_bias_terminal = - G_empty_bias_terminal;
G_1000_1_1_bias_terminal = - G_1000_1_1_bias_terminal;
G_10000_1_1_bias_terminal = - G_10000_1_1_bias_terminal;
G_100000_1_1_bias_terminal = - G_100000_1_1_bias_terminal;
G_1000_1_2_bias_terminal = - G_1000_1_2_bias_terminal;
G_10000_1_2_bias_terminal = - G_10000_1_2_bias_terminal;
G_100000_1_2_bias_terminal = - G_100000_1_2_bias_terminal;
G_1000_2_2_bias_terminal = - G_1000_2_2_bias_terminal;
G_10000_2_2_bias_terminal = - G_10000_2_2_bias_terminal;
G_100000_2_2_bias_terminal = - G_100000_2_2_bias_terminal;
G_1000_3_3_bias_terminal = - G_1000_3_3_bias_terminal;
G_10000_3_3_bias_terminal = - G_10000_3_3_bias_terminal;
G_100000_3_3_bias_terminal = - G_100000_3_3_bias_terminal;

G_empty_gnd_terminal = - G_empty_gnd_terminal;
G_1000_1_1_gnd_terminal = - G_1000_1_1_gnd_terminal;
G_10000_1_1_gnd_terminal = - G_10000_1_1_gnd_terminal;
G_100000_1_1_gnd_terminal = - G_100000_1_1_gnd_terminal;
G_1000_1_2_gnd_terminal = - G_1000_1_2_gnd_terminal;
G_10000_1_2_gnd_terminal = - G_10000_1_2_gnd_terminal;
G_100000_1_2_gnd_terminal = - G_100000_1_2_gnd_terminal;
G_1000_2_2_gnd_terminal = - G_1000_2_2_gnd_terminal;
G_10000_2_2_gnd_terminal = - G_10000_2_2_gnd_terminal;
G_100000_2_2_gnd_terminal = - G_100000_2_2_gnd_terminal;
G_1000_3_3_gnd_terminal = - G_1000_3_3_gnd_terminal;
G_10000_3_3_gnd_terminal = - G_10000_3_3_gnd_terminal;
G_100000_3_3_gnd_terminal = - G_100000_3_3_gnd_terminal;

G_open_1_1_bias_terminal = - G_open_1_1_bias_terminal;
G_open_1_2_bias_terminal = - G_open_1_2_bias_terminal;
G_open_2_2_bias_terminal = - G_open_2_2_bias_terminal;
G_open_3_3_bias_terminal = - G_open_3_3_bias_terminal;
G_open_1_1_gnd_terminal = - G_open_1_1_gnd_terminal;
G_open_1_2_gnd_terminal = - G_open_1_2_gnd_terminal;
G_open_2_2_gnd_terminal = - G_open_2_2_gnd_terminal;
G_open_3_3_gnd_terminal = - G_open_3_3_gnd_terminal;

                   
%% LINE RESISTANCE REMOVAL TECHNIQUES

TestCB_1000_1_1_bias_terminal = G_open_1_1_bias_terminal - G_1000_1_1_bias_terminal;
TestCB_10000_1_1_bias_terminal = G_open_1_1_bias_terminal - G_10000_1_1_bias_terminal;
TestCB_100000_1_1_bias_terminal = G_open_1_1_bias_terminal - G_100000_1_1_bias_terminal;
TestCB_1000_1_2_bias_terminal = G_open_1_2_bias_terminal - G_1000_1_2_bias_terminal;
TestCB_10000_1_2_bias_terminal = G_open_1_2_bias_terminal - G_10000_1_2_bias_terminal;
TestCB_100000_1_2_bias_terminal = G_open_1_2_bias_terminal - G_100000_1_2_bias_terminal;
TestCB_1000_2_2_bias_terminal = G_open_2_2_bias_terminal - G_1000_2_2_bias_terminal;
TestCB_10000_2_2_bias_terminal = G_open_2_2_bias_terminal - G_10000_2_2_bias_terminal;
TestCB_100000_2_2_bias_terminal = G_open_2_2_bias_terminal - G_100000_2_2_bias_terminal;
TestCB_1000_3_3_bias_terminal = G_open_3_3_bias_terminal - G_1000_3_3_bias_terminal;
TestCB_10000_3_3_bias_terminal = G_open_3_3_bias_terminal - G_10000_3_3_bias_terminal;
TestCB_100000_3_3_bias_terminal = G_open_3_3_bias_terminal - G_100000_3_3_bias_terminal;

TestCB_1000_1_1_gnd_terminal = G_open_1_1_gnd_terminal - G_1000_1_1_gnd_terminal;
TestCB_10000_1_1_gnd_terminal = G_open_1_1_gnd_terminal - G_10000_1_1_gnd_terminal;
TestCB_100000_1_1_gnd_terminal = G_open_1_1_gnd_terminal - G_100000_1_1_gnd_terminal;
TestCB_1000_1_2_gnd_terminal = G_open_1_2_gnd_terminal - G_1000_1_2_gnd_terminal;
TestCB_10000_1_2_gnd_terminal = G_open_1_2_gnd_terminal - G_10000_1_2_gnd_terminal;
TestCB_100000_1_2_gnd_terminal = G_open_1_2_gnd_terminal - G_100000_1_2_gnd_terminal;
TestCB_1000_2_2_gnd_terminal = G_open_2_2_gnd_terminal - G_1000_2_2_gnd_terminal;
TestCB_10000_2_2_gnd_terminal = G_open_2_2_gnd_terminal - G_10000_2_2_gnd_terminal;
TestCB_100000_2_2_gnd_terminal = G_open_2_2_gnd_terminal - G_100000_2_2_gnd_terminal;
TestCB_1000_3_3_gnd_terminal = G_open_3_3_gnd_terminal - G_1000_3_3_gnd_terminal;
TestCB_10000_3_3_gnd_terminal = G_open_3_3_gnd_terminal - G_10000_3_3_gnd_terminal;
TestCB_100000_3_3_gnd_terminal = G_open_3_3_gnd_terminal - G_100000_3_3_gnd_terminal;

%% SURFACE PLOTS

x_plot = [1 2 3];
y_plot = [3 2 1];

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_1_bias_terminal);
title({'Surface Plot of 1k\Omega at [1,1]', 'using the open matrix', 'bias terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_1_bias_terminal);
title({'Surface Plot of 10k\Omega at [1,1]', 'using the open matrix', 'bias terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_1_bias_terminal);
title({'Surface Plot of 100k\Omega at [1,1]', 'using the open matrix', 'bias terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_2_bias_terminal);
title({'Surface Plot of 1k\Omega at [1,2]', 'using the open matrix', 'bias terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_2_bias_terminal);
title({'Surface Plot of 10k\Omega at [1,2]', 'using the open matrix', 'bias terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_2_bias_terminal);
title({'Surface Plot of 100k\Omega at [1,2]', 'using the open matrix', 'bias terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_2_2_bias_terminal);
title({'Surface Plot of 1k\Omega at [2,2]', 'using the open matrix', 'bias terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_2_2_bias_terminal);
title({'Surface Plot of 10k\Omega at [2,2]', 'using the open matrix', 'bias terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_2_2_bias_terminal);
title({'Surface Plot of 100k\Omega at [2,2]', 'using the open matrix', 'bias terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_3_3_bias_terminal);
title({'Surface Plot of 1k\Omega at [3,3]', 'using the open matrix', 'bias terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_3_3_bias_terminal);
title({'Surface Plot of 10k\Omega at [3,3]', 'using the open matrix', 'bias terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_3_3_bias_terminal);
title({'Surface Plot of 100k\Omega at [3,3]', 'using the open matrix', 'bias terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_1_gnd_terminal);
title({'Surface Plot of 1k\Omega at [1,1]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_1_gnd_terminal);
title({'Surface Plot of 10k\Omega at [1,1]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_1_gnd_terminal);
title({'Surface Plot of 100k\Omega at [1,1]', 'using the open matrix', 'gnd terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_1_2_gnd_terminal);
title({'Surface Plot of 1k\Omega at [1,2]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_1_2_gnd_terminal);
title({'Surface Plot of 10k\Omega at [1,2]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_1_2_gnd_terminal);
title({'Surface Plot of 100k\Omega at [1,2]', 'using the open matrix', 'gnd terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_2_2_gnd_terminal);
title({'Surface Plot of 1k\Omega at [2,2]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_2_2_gnd_terminal);
title({'Surface Plot of 10k\Omega at [2,2]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_2_2_gnd_terminal);
title({'Surface Plot of 100k\Omega at [2,2]', 'using the open matrix', 'gnd terminal'})

figure
subplot(1,3,1)
surf(x_plot,y_plot,TestCB_1000_3_3_gnd_terminal);
title({'Surface Plot of 1k\Omega at [3,3]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,2)
surf(x_plot,y_plot,TestCB_10000_3_3_gnd_terminal);
title({'Surface Plot of 10k\Omega at [3,3]', 'using the open matrix', 'gnd terminal'})
subplot(1,3,3)
surf(x_plot,y_plot,TestCB_100000_3_3_gnd_terminal);
title({'Surface Plot of 100k\Omega at [3,3]', 'using the open matrix', 'gnd terminal'})