%% LOAD LTSPICE DATA
clear all;
x = LTspice2Matlab('Memristor_modelling_2.RAW');
x10 = LTspice2Matlab('Memristor_new_3_3_1000.RAW');    % 1k @ 3,3
x_combo_1 = LTspice2Matlab('Memristor_new_combo_1.RAW');    % 1k @ 1,1 & 1k @ 2,2

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
figure
subplot(2,3,1)
heatmap(Voltage_1_empty);
title('Voltage Array for Vin1 (Empty)')
G_1_empty = Current_empty(1:6,1)/vin1;

% setting up Vin2 =\0 array
Voltage_2_empty(1,1:3) = x.variable_mat(7:9,11);
Voltage_2_empty(2,1:3) = x.variable_mat(10:12,11);
Voltage_2_empty(3,1:3) = x.variable_mat(13:15,11);
Current_empty(1:6,2) = x.variable_mat(39:-1:34,11); 
subplot(2,3,2)
heatmap(Voltage_2_empty);
title('Voltage Array for Vin2 (Empty)')
G_2_empty = Current_empty(1:6,2)/vin2;

% setting up Vin3 =\0 array
Voltage_3_empty(1,1:3) = x.variable_mat(7:9,18);
Voltage_3_empty(2,1:3) = x.variable_mat(10:12,18);
Voltage_3_empty(3,1:3) = x.variable_mat(13:15,18);
Current_empty(1:6,3) = x.variable_mat(39:-1:34,18); 
subplot(2,3,3)
heatmap(Voltage_3_empty);
title('Voltage Array for Vin3 (Empty)')
G_3_empty = Current_empty(1:6,3)/vin3;

% setting up Vin4 =\0 array
Voltage_4_empty(1,1:3) = x.variable_mat(7:9,26);
Voltage_4_empty(2,1:3) = x.variable_mat(10:12,26);
Voltage_4_empty(3,1:3) = x.variable_mat(13:15,26);
Current_empty(1:6,4) = x.variable_mat(39:-1:34,26); 
subplot(2,3,4)
heatmap(Voltage_4_empty);
title('Voltage Array for Vin4 (Empty)')
G_4_empty = Current_empty(1:6,4)/vin4;

% setting up Vin5 =\0 array
Voltage_5_empty(1,1:3) = x.variable_mat(7:9,33);
Voltage_5_empty(2,1:3) = x.variable_mat(10:12,33);
Voltage_5_empty(3,1:3) = x.variable_mat(13:15,33);
Current_empty(1:6,5) = x.variable_mat(39:-1:34,33); 
subplot(2,3,5)
heatmap(Voltage_5_empty);
title('Voltage Array for Vin5 (Empty)')
G_5_empty = Current_empty(1:6,5)/vin5;

% setting up Vin6 =\0 array
Voltage_6_empty(1,1:3) = x.variable_mat(7:9,41);
Voltage_6_empty(2,1:3) = x.variable_mat(10:12,41);
Voltage_6_empty(3,1:3) = x.variable_mat(13:15,41);
Current_empty(1:6,6) = x.variable_mat(39:-1:34,41); 
subplot(2,3,6)
heatmap(Voltage_6_empty);
title('Voltage Array for Vin6 (Empty)')
G_6_empty = Current_empty(1:6,6)/vin6;

%% FILL DATA INTO ARRAY (1k @ 3,3)

% setting up Vin1 =\0 array
Voltage_1_combo_1 (1,1:3) = x10.variable_mat(7:9,4);
Voltage_1_combo_1 (2,1:3) = x10.variable_mat(10:12,4);
Voltage_1_combo_1 (3,1:3) = x10.variable_mat(13:15,4);
Current_1000_3_3 (1:6,1) = x10.variable_mat(41:-1:36,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_combo_1 );
title('Voltage Array for Vin1 (1k @ 3,3)')
G_1_1000_3_3 = Current_1000_3_3 (1:6,1)/vin1;
%G_1_1000_1_1_check = Current_1000_1_1 (2:6,1)/vin1(1:5,1);

% setting up Vin2 =\0 array
Voltage_2_1000_3_3 (1,1:3) = x10.variable_mat(7:9,11);
Voltage_2_1000_3_3 (2,1:3) = x10.variable_mat(10:12,11);
Voltage_2_1000_3_3 (3,1:3) = x10.variable_mat(13:15,11);
Current_1000_3_3 (1:6,2) = x10.variable_mat(41:-1:36,11); 
subplot(2,3,2)
heatmap(Voltage_2_1000_3_3 );
title('Voltage Array for Vin2 (1k @ 3,3)')
G_2_1000_3_3 = Current_1000_3_3 (1:6,2)/vin2;

% setting up Vin3 =\0 array
Voltage_3_1000_3_3 (1,1:3) = x10.variable_mat(7:9,18);
Voltage_3_1000_3_3 (2,1:3) = x10.variable_mat(10:12,18);
Voltage_3_1000_3_3 (3,1:3) = x10.variable_mat(13:15,18);
Current_1000_3_3 (1:6,3) = x10.variable_mat(41:-1:36,18); 
subplot(2,3,3)
heatmap(Voltage_3_1000_3_3 );
title('Voltage Array for Vin3 (1k @ 3,3)')
G_3_1000_3_3 = Current_1000_3_3 (1:6,3)/vin3;

% setting up Vin4 =\0 array
Voltage_4_combo_1 (1,1:3) = x10.variable_mat(7:9,26);
Voltage_4_combo_1 (2,1:3) = x10.variable_mat(10:12,26);
Voltage_4_combo_1 (3,1:3) = x10.variable_mat(13:15,26);
Current_1000_3_3 (1:6,4) = x10.variable_mat(41:-1:36,26); 
subplot(2,3,4)
heatmap(Voltage_4_combo_1);
title('Voltage Array for Vin4 (1k @ 3,3)')
G_4_1000_3_3 = Current_1000_3_3 (1:6,4)/vin4;

% setting up Vin5 =\0 array
Voltage_5_combo_1 (1,1:3) = x10.variable_mat(7:9,33);
Voltage_5_combo_1 (2,1:3) = x10.variable_mat(10:12,33);
Voltage_5_combo_1 (3,1:3) = x10.variable_mat(13:15,33);
Current_1000_3_3 (1:6,5) = x10.variable_mat(41:-1:36,33); 
subplot(2,3,5)
heatmap(Voltage_5_combo_1);
title('Voltage Array for Vin5 (1k @ 3,3)')
G_5_1000_3_3 = Current_1000_3_3 (1:6,5)/vin5;

% setting up Vin6 =\0 array
Voltage_6_1000_3_3 (1,1:3) = x10.variable_mat(7:9,41);
Voltage_6_1000_3_3 (2,1:3) = x10.variable_mat(10:12,41);
Voltage_6_1000_3_3 (3,1:3) = x10.variable_mat(13:15,41);
Current_1000_3_3 (1:6,6) = x10.variable_mat(41:-1:36,41); 
subplot(2,3,6)
heatmap(Voltage_6_1000_3_3);
title('Voltage Array for Vin6 (1k @ 3,3)')
G_6_1000_3_3 = Current_1000_3_3 (1:6,6)/vin6;

%% DATA FILL FOR COMBINATION OF MEMRISTORS

% setting up Vin1 =\0 array
Voltage_1_combo_1 (1,1:3) = x_combo_1.variable_mat(7:9,4);
Voltage_1_combo_1 (2,1:3) = x_combo_1.variable_mat(10:12,4);
Voltage_1_combo_1 (3,1:3) = x_combo_1.variable_mat(13:15,4);
Current_combo_1 (1:6,1) = x_combo_1.variable_mat(43:-1:38,4); 
figure
subplot(2,3,1)
heatmap(Voltage_1_combo_1 );
title('Voltage Array for Vin1 (1k @ 1,1 & 1k @ 2,2)')
G_1_combo_1 = Current_combo_1 (1:6,1)/vin1;

% setting up Vin2 =\0 array
Voltage_2_combo_1 (1,1:3) = x_combo_1.variable_mat(7:9,11);
Voltage_2_combo_1 (2,1:3) = x_combo_1.variable_mat(10:12,11);
Voltage_2_combo_1 (3,1:3) = x_combo_1.variable_mat(13:15,11);
Current_combo_1 (1:6,2) = x_combo_1.variable_mat(43:-1:38,11); 
subplot(2,3,2)
heatmap(Voltage_2_combo_1 );
title('Voltage Array for Vin2 (1k @ 1,1 & 1k @ 2,2)')
G_2_combo_1 = Current_combo_1 (1:6,2)/vin2;

% setting up Vin3 =\0 array
Voltage_3_combo_1 (1,1:3) = x_combo_1.variable_mat(7:9,18);
Voltage_3_combo_1 (2,1:3) = x_combo_1.variable_mat(10:12,18);
Voltage_3_combo_1 (3,1:3) = x_combo_1.variable_mat(13:15,18);
Current_combo_1 (1:6,3) = x_combo_1.variable_mat(43:-1:38,18); 
subplot(2,3,3)
heatmap(Voltage_3_combo_1 );
title('Voltage Array for Vin3 (1k @ 1,1 & 1k @ 2,2)')
G_3_combo_1 = Current_combo_1 (1:6,3)/vin3;

% setting up Vin4 =\0 array
Voltage_4_combo_1 (1,1:3) = x_combo_1.variable_mat(7:9,26);
Voltage_4_combo_1 (2,1:3) = x_combo_1.variable_mat(10:12,26);
Voltage_4_combo_1 (3,1:3) = x_combo_1.variable_mat(13:15,26);
Current_combo_1 (1:6,4) = x_combo_1.variable_mat(43:-1:38,26); 
subplot(2,3,4)
heatmap(Voltage_4_combo_1);
title('Voltage Array for Vin4 (1k @ 1,1 & 1k @ 2,2)')
G_4_combo_1 = Current_combo_1 (1:6,4)/vin4;

% setting up Vin5 =\0 array
Voltage_5_combo_1(1,1:3) = x_combo_1.variable_mat(7:9,33);
Voltage_5_combo_1 (2,1:3) = x_combo_1.variable_mat(10:12,33);
Voltage_5_combo_1 (3,1:3) = x_combo_1.variable_mat(13:15,33);
Current_combo_1 (1:6,5) = x_combo_1.variable_mat(43:-1:38,33); 
subplot(2,3,5)
heatmap(Voltage_5_combo_1);
title('Voltage Array for Vin5 (1k @ 1,1 & 1k @ 2,2)')
G_5_combo_1 = Current_combo_1 (1:6,5)/vin5;


%% CONDUCTANCE OPERATIONS (5x5) - Create the 5x5 version by removing a column and row (Vin6 = 0)

G_1_empty_5_by_5 = G_1_empty;
G_1_empty_5_by_5(:,6) = [];
G_1_empty_5_by_5(1,:) = [];

G_2_empty_5_by_5 = G_2_empty;
G_2_empty_5_by_5(:,6) = [];
G_2_empty_5_by_5(2,:) = [];

G_3_empty_5_by_5 = G_3_empty;
G_3_empty_5_by_5(:,6) = [];
G_3_empty_5_by_5(3,:) = [];

G_4_empty_5_by_5 = G_4_empty;
G_4_empty_5_by_5(:,6) = [];
G_4_empty_5_by_5(4,:) = [];

G_5_empty_5_by_5 = G_5_empty;
G_5_empty_5_by_5(:,6) = [];
G_5_empty_5_by_5(5,:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

G_1_1000_3_3_5_by_5 = G_1_1000_3_3;
G_1_1000_3_3_5_by_5(:,6) = [];
G_1_1000_3_3_5_by_5(1,:) = [];

G_2_1000_3_3_5_by_5 = G_2_1000_3_3;
G_2_1000_3_3_5_by_5(:,6) = [];
G_2_1000_3_3_5_by_5(2,:) = [];

G_3_1000_3_3_5_by_5 = G_3_1000_3_3;
G_3_1000_3_3_5_by_5(:,6) = [];
G_3_1000_3_3_5_by_5(3,:) = [];

G_4_1000_3_3_5_by_5 = G_4_1000_3_3;
G_4_1000_3_3_5_by_5(:,6) = [];
G_4_1000_3_3_5_by_5(4,:) = [];

G_5_1000_3_3_5_by_5 = G_5_1000_3_3;
G_5_1000_3_3_5_by_5(:,6) = [];
G_5_1000_3_3_5_by_5(5,:) = [];

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

G_1_combo_1_5_by_5 = G_1_combo_1;
G_1_combo_1_5_by_5(:,6) = [];
G_1_combo_1_5_by_5(1,:) = [];

G_2_combo_1_5_by_5 = G_2_combo_1;
G_2_combo_1_5_by_5(:,6) = [];
G_2_combo_1_5_by_5(2,:) = [];

G_3_combo_1_5_by_5 = G_3_combo_1;
G_3_combo_1_5_by_5(:,6) = [];
G_3_combo_1_5_by_5(3,:) = [];

G_4_combo_1_5_by_5 = G_4_combo_1;
G_4_combo_1_5_by_5(:,6) = [];
G_4_combo_1_5_by_5(4,:) = [];

G_5_combo_1_5_by_5 = G_5_combo_1;
G_5_combo_1_5_by_5(:,6) = [];
G_5_combo_1_5_by_5(5,:) = [];

%% CONDUCTANCE SCALING - Scale the conductance by removing the empty array conductance from the filled

G_empty_5_by_5 = G_1_empty_5_by_5 + G_2_empty_5_by_5...
                 + G_3_empty_5_by_5 + G_4_empty_5_by_5...
                 + G_5_empty_5_by_5;

G_1000_3_3_5_by_5 = G_1_1000_3_3_5_by_5 + G_2_1000_3_3_5_by_5...
                    + G_3_1000_3_3_5_by_5 + G_4_1000_3_3_5_by_5...
                    + G_5_1000_3_3_5_by_5;
           
G_combo_1_5_by_5 = G_1_combo_1_5_by_5 + G_2_combo_1_5_by_5...
                    + G_3_combo_1_5_by_5 + G_4_combo_1_5_by_5...
                    + G_5_combo_1_5_by_5;
                
G_scaled_1000_3_3_5_by_5 = G_1000_3_3_5_by_5 - G_empty_5_by_5;
G_scaled_combo_1_5_by_5 = G_combo_1_5_by_5 - G_empty_5_by_5;
