%% LOAD LTSPICE DATA
clear all;
z1 = LTspice2Matlab('Memristor_new_1_1_1000.RAW');
z2 = LTspice2Matlab('Memristor_new_1_1_open.RAW');

z3 = LTspice2Matlab('Memristor_new_1_1_1000_4_by_4.RAW');     
z4 = LTspice2Matlab('Memristor_new_1_1_open_4_by_4.RAW');      

z5 = LTspice2Matlab('Memristor_new_1_1_1000_5_by_5.RAW');      
z6 = LTspice2Matlab('Memristor_new_1_1_open_5_by_5.RAW'); 

z7 = LTspice2Matlab('Memristor_new_1_1_1000_6_by_6.RAW');      
z8 = LTspice2Matlab('Memristor_new_1_1_open_6_by_6.RAW'); 

x3 = LTspice2Matlab('Memristor_new_1_1_10000_4_by_4.RAW');      

%% VARIABLE SETUP (3x3)

vin1 = [2 ;0 ;0 ;0 ;0 ;0];
vin2 = [0 ;2 ;0 ;0 ;0 ;0];
vin3 = [0 ;0 ;2 ;0 ;0 ;0];
vin4 = [0 ;0 ;0 ;2 ;0 ;0];
vin5 = [0 ;0 ;0 ;0 ;2 ;0];
vin6 = [0 ;0 ;0 ;0 ;0 ;2];

%% FILL DATA INTO ARRAY (1k @ 1,1)

% setting up Vin1 =\0 array
Current_1000_1_1 (1:6,1) = z1.variable_mat(41:-1:36,4); 
G_1000_1_1 = zeros(6,6);
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Current_1000_1_1 (1:6,2) = z1.variable_mat(41:-1:36,11); 
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Current_1000_1_1 (1:6,3) = z1.variable_mat(41:-1:36,18); 
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Current_1000_1_1 (1:6,4) = z1.variable_mat(41:-1:36,25); 
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Current_1000_1_1 (1:6,5) = z1.variable_mat(41:-1:36,32); 
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Current_1000_1_1 (1:6,6) = z1.variable_mat(41:-1:36,39); 
G_1000_1_1 = G_1000_1_1 + (Current_1000_1_1 (1:6,6)/vin6);


%% FILL DATA INTO ARRAY (OPEN @ 1,1)

% setting up Vin1 =\0 array
Current_open_1_1 (1:6,1) = z2.variable_mat(40:-1:35,4); 
G_open_1_1 = zeros(6,6);
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,1)/vin1);

% setting up Vin2 =\0 array
Current_open_1_1 (1:6,2) = z2.variable_mat(40:-1:35,11); 
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,2)/vin2);

% setting up Vin3 =\0 array
Current_open_1_1 (1:6,3) = z2.variable_mat(40:-1:35,18); 
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,3)/vin3);

% setting up Vin4 =\0 array
Current_open_1_1 (1:6,4) = z2.variable_mat(40:-1:35,25); 
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,4)/vin4);

% setting up Vin5 =\0 array
Current_open_1_1 (1:6,5) = z2.variable_mat(40:-1:35,32); 
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,5)/vin5);

% setting up Vin6 =\0 array
Current_open_1_1 (1:6,6) = z2.variable_mat(40:-1:35,39); 
G_open_1_1 = G_open_1_1 + (Current_open_1_1 (1:6,6)/vin6);

%% VARIABLE SETUP (4x4)

vin1 = [2 ;0 ;0 ;0 ;0 ;0; 0; 0];
vin2 = [0 ;2 ;0 ;0 ;0 ;0; 0; 0];
vin3 = [0 ;0 ;2 ;0 ;0 ;0; 0; 0];
vin4 = [0 ;0 ;0 ;2 ;0 ;0; 0; 0];
vin5 = [0 ;0 ;0 ;0 ;2 ;0; 0; 0];
vin6 = [0 ;0 ;0 ;0 ;0 ;2; 0; 0];
vin7 = [0 ;0 ;0 ;0 ;0 ;0; 2; 0];
vin8 = [0 ;0 ;0 ;0 ;0 ;0; 0; 2];

%% FILL DATA INTO ARRAY (1k @ 1,1) for (4x4)

% setting up Vin1 =\0 array
Current_1000_1_1_4_by_4 (1:8,1) = z3.variable_mat(66:-1:59,4); 
G_1000_1_1_4_by_4 = zeros(8,8);
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,1)/vin1);

% setting up Vin2 =\0 array
Current_1000_1_1_4_by_4 (1:8,2) = z3.variable_mat(66:-1:59,11); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,2)/vin2);

% setting up Vin3 =\0 array
Current_1000_1_1_4_by_4 (1:8,3) = z3.variable_mat(66:-1:59,18); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,3)/vin3);

% setting up Vin4 =\0 array
Current_1000_1_1_4_by_4 (1:8,4) = z3.variable_mat(66:-1:59,25); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,4)/vin4);

% setting up Vin5 =\0 array
Current_1000_1_1_4_by_4 (1:8,5) = z3.variable_mat(66:-1:59,32); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,5)/vin5);

% setting up Vin6 =\0 array
Current_1000_1_1_4_by_4 (1:8,6) = z3.variable_mat(66:-1:59,39); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,6)/vin6);

% setting up Vin7 =\0 array
Current_1000_1_1_4_by_4 (1:8,7) = z3.variable_mat(66:-1:59,46); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,7)/vin7);

% setting up Vin8 =\0 array
Current_1000_1_1_4_by_4 (1:8,8) = z3.variable_mat(66:-1:59,53); 
G_1000_1_1_4_by_4 = G_1000_1_1_4_by_4 + (Current_1000_1_1_4_by_4 (1:8,8)/vin8);


%% FILL DATA INTO ARRAY (10k @ 1,1) for (4x4)

% setting up Vin1 =\0 array
Current_10000_1_1_4_by_4 (1:8,1) = x3.variable_mat(66:-1:59,4); 
G_10000_1_1_4_by_4 = zeros(8,8);
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,1)/vin1);

% setting up Vin2 =\0 array
Current_10000_1_1_4_by_4 (1:8,2) = x3.variable_mat(66:-1:59,11); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,2)/vin2);

% setting up Vin3 =\0 array
Current_10000_1_1_4_by_4 (1:8,3) = x3.variable_mat(66:-1:59,18); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,3)/vin3);

% setting up Vin4 =\0 array
Current_10000_1_1_4_by_4 (1:8,4) = x3.variable_mat(66:-1:59,25); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,4)/vin4);

% setting up Vin5 =\0 array
Current_10000_1_1_4_by_4 (1:8,5) = x3.variable_mat(66:-1:59,32); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,5)/vin5);

% setting up Vin6 =\0 array
Current_10000_1_1_4_by_4 (1:8,6) = x3.variable_mat(66:-1:59,39); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,6)/vin6);

% setting up Vin7 =\0 array
Current_10000_1_1_4_by_4 (1:8,7) = x3.variable_mat(66:-1:59,46); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,7)/vin7);

% setting up Vin8 =\0 array
Current_10000_1_1_4_by_4 (1:8,8) = x3.variable_mat(66:-1:59,53); 
G_10000_1_1_4_by_4 = G_10000_1_1_4_by_4 + (Current_10000_1_1_4_by_4 (1:8,8)/vin8);


%% FILL DATA INTO ARRAY (open @ 1,1) for (4x4)

% setting up Vin1 =\0 array
Current_open_1_1_4_by_4 (1:8,1) = z4.variable_mat(65:-1:58,4); 
G_open_1_1_4_by_4 = zeros(8,8);
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,1)/vin1);

% setting up Vin2 =\0 array
Current_open_1_1_4_by_4 (1:8,2) = z4.variable_mat(65:-1:58,11); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,2)/vin2);

% setting up Vin3 =\0 array
Current_open_1_1_4_by_4 (1:8,3) = z4.variable_mat(65:-1:58,18); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,3)/vin3);

% setting up Vin4 =\0 array
Current_open_1_1_4_by_4 (1:8,4) = z4.variable_mat(65:-1:58,25); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,4)/vin4);

% setting up Vin5 =\0 array
Current_open_1_1_4_by_4 (1:8,5) = z4.variable_mat(65:-1:58,32); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,5)/vin5);

% setting up Vin6 =\0 array
Current_open_1_1_4_by_4 (1:8,6) = z4.variable_mat(65:-1:58,39); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,6)/vin6);

% setting up Vin7 =\0 array
Current_open_1_1_4_by_4 (1:8,7) = z4.variable_mat(65:-1:58,46); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,7)/vin7);

% setting up Vin8 =\0 array
Current_open_1_1_4_by_4 (1:8,8) = z4.variable_mat(65:-1:58,53); 
G_open_1_1_4_by_4 = G_open_1_1_4_by_4 + (Current_open_1_1_4_by_4 (1:8,8)/vin8);


%% VARIABLE SETUP (5x5)

vin1 = [2 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 0];
vin2 = [0 ;2 ;0 ;0 ;0 ;0; 0; 0; 0; 0];
vin3 = [0 ;0 ;2 ;0 ;0 ;0; 0; 0; 0; 0];
vin4 = [0 ;0 ;0 ;2 ;0 ;0; 0; 0; 0; 0];
vin5 = [0 ;0 ;0 ;0 ;2 ;0; 0; 0; 0; 0];
vin6 = [0 ;0 ;0 ;0 ;0 ;2; 0; 0; 0; 0];
vin7 = [0 ;0 ;0 ;0 ;0 ;0; 2; 0; 0; 0];
vin8 = [0 ;0 ;0 ;0 ;0 ;0; 0; 2; 0; 0];
vin9 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 2; 0];
vin10 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 2];


%% FILL DATA INTO ARRAY (1k @ 1,1) for (5x5)

% setting up Vin1 =\0 array
Current_1000_1_1_5_by_5 (1:10,1) = z5.variable_mat(97:-1:88,4); 
G_1000_1_1_5_by_5 = zeros(10,10);
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,1)/vin1);

% setting up Vin2 =\0 array
Current_1000_1_1_5_by_5 (1:10,2) = z5.variable_mat(97:-1:88,11); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,2)/vin2);

% setting up Vin3 =\0 array
Current_1000_1_1_5_by_5 (1:10,3) = z5.variable_mat(97:-1:88,18); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,3)/vin3);

% setting up Vin4 =\0 array
Current_1000_1_1_5_by_5 (1:10,4) = z5.variable_mat(97:-1:88,25); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,4)/vin4);

% setting up Vin5 =\0 array
Current_1000_1_1_5_by_5 (1:10,5) = z5.variable_mat(97:-1:88,32); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,5)/vin5);

% setting up Vin6 =\0 array
Current_1000_1_1_5_by_5 (1:10,6) = z5.variable_mat(97:-1:88,39); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,6)/vin6);

% setting up Vin7 =\0 array
Current_1000_1_1_5_by_5 (1:10,7) = z5.variable_mat(97:-1:88,46); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,7)/vin7);

% setting up Vin8 =\0 array
Current_1000_1_1_5_by_5 (1:10,8) = z5.variable_mat(97:-1:88,53); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,8)/vin8);

% setting up Vin9 =\0 array
Current_1000_1_1_5_by_5 (1:10,9) = z5.variable_mat(97:-1:88,61); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,9)/vin9);

% setting up Vin10 =\0 array
Current_1000_1_1_5_by_5 (1:10,10) = z5.variable_mat(97:-1:88,68); 
G_1000_1_1_5_by_5 = G_1000_1_1_5_by_5 + (Current_1000_1_1_5_by_5 (1:10,10)/vin10);


%% FILL DATA INTO ARRAY (open @ 1,1) for (5x5)

% setting up Vin1 =\0 array
Current_open_1_1_5_by_5 (1:10,1) = z6.variable_mat(96:-1:87,4); 
G_open_1_1_5_by_5 = zeros(10,10);
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,1)/vin1);

% setting up Vin2 =\0 array
Current_open_1_1_5_by_5 (1:10,2) = z6.variable_mat(96:-1:87,11); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,2)/vin2);

% setting up Vin3 =\0 array
Current_open_1_1_5_by_5 (1:10,3) = z6.variable_mat(96:-1:87,18); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,3)/vin3);

% setting up Vin4 =\0 array
Current_open_1_1_5_by_5 (1:10,4) = z6.variable_mat(96:-1:87,25); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,4)/vin4);

% setting up Vin5 =\0 array
Current_open_1_1_5_by_5 (1:10,5) = z6.variable_mat(96:-1:87,32); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,5)/vin5);

% setting up Vin6 =\0 array
Current_open_1_1_5_by_5 (1:10,6) = z6.variable_mat(96:-1:87,39); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,6)/vin6);

% setting up Vin7 =\0 array
Current_open_1_1_5_by_5 (1:10,7) = z6.variable_mat(96:-1:87,46); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,7)/vin7);

% setting up Vin8 =\0 array
Current_open_1_1_5_by_5 (1:10,8) = z6.variable_mat(96:-1:87,53); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,8)/vin8);

% setting up Vin9 =\0 array
Current_open_1_1_5_by_5 (1:10,9) = z6.variable_mat(96:-1:87,61); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,9)/vin9);

% setting up Vin10 =\0 array
Current_open_1_1_5_by_5 (1:10,10) = z6.variable_mat(96:-1:87,68); 
G_open_1_1_5_by_5 = G_open_1_1_5_by_5 + (Current_open_1_1_5_by_5 (1:10,10)/vin10);

%% VARIABLE SETUP (6x6)

vin1 = [2 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 0; 0; 0];
vin2 = [0 ;2 ;0 ;0 ;0 ;0; 0; 0; 0; 0; 0; 0];
vin3 = [0 ;0 ;2 ;0 ;0 ;0; 0; 0; 0; 0; 0; 0];
vin4 = [0 ;0 ;0 ;2 ;0 ;0; 0; 0; 0; 0; 0; 0];
vin5 = [0 ;0 ;0 ;0 ;2 ;0; 0; 0; 0; 0; 0; 0];
vin6 = [0 ;0 ;0 ;0 ;0 ;2; 0; 0; 0; 0; 0; 0];
vin7 = [0 ;0 ;0 ;0 ;0 ;0; 2; 0; 0; 0; 0; 0];
vin8 = [0 ;0 ;0 ;0 ;0 ;0; 0; 2; 0; 0; 0; 0];
vin9 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 2; 0; 0; 0];
vin10 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 2; 0; 0];
vin11 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 0; 2; 0];
vin12 = [0 ;0 ;0 ;0 ;0 ;0; 0; 0; 0; 0; 0; 2];

%% FILL DATA INTO ARRAY (1k @ 1,1) for (6x6)

% setting up Vin1 =\0 array
Current_1000_1_1_6_by_6 (1:12,1) = z7.variable_mat(134:-1:123,4); 
G_1000_1_1_6_by_6 = zeros(12,12);
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,1)/vin1);

% setting up Vin2 =\0 array
Current_1000_1_1_6_by_6 (1:12,2) = z7.variable_mat(134:-1:123,11); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,2)/vin2);

% setting up Vin3 =\0 array
Current_1000_1_1_6_by_6 (1:12,3) = z7.variable_mat(134:-1:123,18); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,3)/vin3);

% setting up Vin4 =\0 array
Current_1000_1_1_6_by_6 (1:12,4) = z7.variable_mat(134:-1:123,25); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,4)/vin4);

% setting up Vin5 =\0 array
Current_1000_1_1_6_by_6 (1:12,5) = z7.variable_mat(134:-1:123,32); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,5)/vin5);

% setting up Vin6 =\0 array
Current_1000_1_1_6_by_6 (1:12,6) = z7.variable_mat(134:-1:123,39); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,6)/vin6);

% setting up Vin7 =\0 array
Current_1000_1_1_6_by_6 (1:12,7) = z7.variable_mat(134:-1:123,46); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,7)/vin7);

% setting up Vin8 =\0 array
Current_1000_1_1_6_by_6 (1:12,8) = z7.variable_mat(134:-1:123,53); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,8)/vin8);

% setting up Vin9 =\0 array
Current_1000_1_1_6_by_6 (1:12,9) = z7.variable_mat(134:-1:123,60); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,9)/vin9);

% setting up Vin10 =\0 array
Current_1000_1_1_6_by_6 (1:12,10) = z7.variable_mat(134:-1:123,67); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,10)/vin10);

% setting up Vin11 =\0 array
Current_1000_1_1_6_by_6 (1:12,11) = z7.variable_mat(134:-1:123,74); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,11)/vin11);

% setting up Vin12 =\0 array
Current_1000_1_1_6_by_6 (1:12,12) = z7.variable_mat(134:-1:123,86); 
G_1000_1_1_6_by_6 = G_1000_1_1_6_by_6 + (Current_1000_1_1_6_by_6 (1:12,12)/vin12);


%% FILL DATA INTO ARRAY (open @ 1,1) for (5x5)

% setting up Vin1 =\0 array
Current_open_1_1_6_by_6 (1:12,1) = z8.variable_mat(133:-1:122,4); 
G_open_1_1_6_by_6 = zeros(12,12);
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,1)/vin1);

% setting up Vin2 =\0 array
Current_open_1_1_6_by_6 (1:12,2) = z8.variable_mat(133:-1:122,11); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,2)/vin2);

% setting up Vin3 =\0 array
Current_open_1_1_6_by_6 (1:12,3) = z8.variable_mat(133:-1:122,18); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,3)/vin3);

% setting up Vin4 =\0 array
Current_open_1_1_6_by_6 (1:12,4) = z8.variable_mat(133:-1:122,25); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,4)/vin4);

% setting up Vin5 =\0 array
Current_open_1_1_6_by_6 (1:12,5) = z8.variable_mat(133:-1:122,32); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,5)/vin5);

% setting up Vin6 =\0 array
Current_open_1_1_6_by_6 (1:12,6) = z8.variable_mat(133:-1:122,39); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,6)/vin6);

% setting up Vin7 =\0 array
Current_open_1_1_6_by_6 (1:12,7) = z8.variable_mat(133:-1:122,46); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,7)/vin7);

% setting up Vin8 =\0 array
Current_open_1_1_6_by_6 (1:12,8) = z8.variable_mat(133:-1:122,53); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,8)/vin8);

% setting up Vin9 =\0 array
Current_open_1_1_6_by_6 (1:12,9) = z8.variable_mat(133:-1:122,61); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,9)/vin9);

% setting up Vin10 =\0 array
Current_open_1_1_6_by_6 (1:12,10) = z8.variable_mat(133:-1:122,67); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,10)/vin10);

% setting up Vin11 =\0 array
Current_open_1_1_6_by_6 (1:12,11) = z8.variable_mat(133:-1:122,74); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,11)/vin11);

% setting up Vin12 =\0 array
Current_open_1_1_6_by_6 (1:12,12) = z8.variable_mat(133:-1:122,86); 
G_open_1_1_6_by_6 = G_open_1_1_6_by_6 + (Current_open_1_1_6_by_6 (1:12,12)/vin12);



%% REVERSE SIGN OF ADMITTANCE ARRAY TO REFLECT CORRECT CURRENT FLOW DIRECTION

G_1000_1_1 = - G_1000_1_1;
G_open_1_1 = - G_open_1_1;

G_1000_1_1_4_by_4 = - G_1000_1_1_4_by_4;
G_open_1_1_4_by_4 = - G_open_1_1_4_by_4;
G_1000_1_1_5_by_5 = - G_1000_1_1_5_by_5;
G_open_1_1_5_by_5 = - G_open_1_1_5_by_5;
G_1000_1_1_6_by_6 = - G_1000_1_1_6_by_6;
G_open_1_1_6_by_6 = - G_open_1_1_6_by_6;

G_10000_1_1_4_by_4 = - G_10000_1_1_4_by_4;

                   
%% LINE RESISTANCE REMOVAL TECHNIQUES

TestCB_1000_1_1 = G_open_1_1 - G_1000_1_1;
TestCB_1000_1_1_4_by_4 = G_open_1_1_4_by_4 - G_1000_1_1_4_by_4;
TestCB_1000_1_1_5_by_5 = G_open_1_1_5_by_5 - G_1000_1_1_5_by_5;
TestCB_1000_1_1_6_by_6 = G_open_1_1_6_by_6 - G_1000_1_1_6_by_6;

TestCB_10000_1_1_4_by_4 = G_open_1_1_4_by_4 - G_10000_1_1_4_by_4;

%% HEATMAP CONDUCTANCE MATRICES

x_plot = [1 2 3 4 5 6];
y_plot = [6 5 4 3 2 1];
figure
subplot(2,2,1)
surf(x_plot,y_plot,TestCB_1000_1_1);
title({'Surface Plot of 1k\Omega at [1,1]', 'for Array Size 3x3'})

x_plot = [1 2 3 4 5 6 7 8];
y_plot = [8 7 6 5 4 3 2 1];
subplot(2,2,2)
surf(x_plot,y_plot,TestCB_1000_1_1_4_by_4);
title({'Surface Plot of 1k\Omega at [1,1]', 'for Array Size 4x4'})

x_plot = [1 2 3 4 5 6 7 8 9 10];
y_plot = [10 9 8 7 6 5 4 3 2 1];
subplot(2,2,3)
surf(x_plot,y_plot,TestCB_1000_1_1_5_by_5);
title({'Surface Plot of 1k\Omega at [1,1]', 'for Array Size 5x5'})

x_plot = [1 2 3 4 5 6 7 8 9 10 11 12];
y_plot = [12 11 10 9 8 7 6 5 4 3 2 1];
subplot(2,2,4)
surf(x_plot,y_plot,TestCB_1000_1_1_6_by_6);
title({'Surface Plot of 1k\Omega at [1,1]', 'for array size 6x6'})

%% ESTIMATIONS

% Estimation of Position 1k @ [1,1] (3x3)
quarter_1000_1_1_1 = (TestCB_1000_1_1(1:3,1:3)).^-1;
quarter_1000_1_1_2 = (TestCB_1000_1_1(1:3,4:6)).^-1;
quarter_1000_1_1_3 = (TestCB_1000_1_1(4:6,1:3)).^-1;
quarter_1000_1_1_4 = (TestCB_1000_1_1(4:6,4:6)).^-1;
G_1000_1_1_est = (-quarter_1000_1_1_1 + quarter_1000_1_1_2 + quarter_1000_1_1_3 + -quarter_1000_1_1_4)./((1/8.5)*10^6);

% Estimation of Position 1k @ [1,1] (4x4)
quarter_1000_1_1_1_4_by_4 = (TestCB_1000_1_1_4_by_4(1:4,5:8)).^-1;
quarter_1000_1_1_2_4_by_4 = (TestCB_1000_1_1_4_by_4(1:4,5:8)).^-1;
quarter_1000_1_1_3_4_by_4 = (TestCB_1000_1_1_4_by_4(5:8,1:4)).^-1;
quarter_1000_1_1_4_4_by_4 = (TestCB_1000_1_1_4_by_4(5:8,5:8)).^-1;
G_1000_1_1_4_by_4_est = (-quarter_1000_1_1_1_4_by_4 + quarter_1000_1_1_2_4_by_4 + quarter_1000_1_1_3_4_by_4 + -quarter_1000_1_1_4_4_by_4)./((1/(8.5))*10^6);

% Estimation of Position 1k @ [1,1] (5x5)
quarter_1000_1_1_1_5_by_5 = (TestCB_1000_1_1_5_by_5(1:5,6:10)).^-1;
quarter_1000_1_1_2_5_by_5 = (TestCB_1000_1_1_5_by_5(1:5,6:10)).^-1;
quarter_1000_1_1_3_5_by_5 = (TestCB_1000_1_1_5_by_5(6:10,1:5)).^-1;
quarter_1000_1_1_4_5_by_5 = (TestCB_1000_1_1_5_by_5(6:10,6:10)).^-1;
G_1000_1_1_5_by_5_est = (-quarter_1000_1_1_1_5_by_5 + quarter_1000_1_1_2_5_by_5 + quarter_1000_1_1_3_5_by_5 + -quarter_1000_1_1_4_5_by_5)./((1/(8.5))*10^6);

% Estimation of Position 10k @ [1,1] (4x4)
quarter_10000_1_1_1_4_by_4 = (TestCB_10000_1_1_4_by_4(1:4,5:8)).^-1;
quarter_10000_1_1_2_4_by_4 = (TestCB_10000_1_1_4_by_4(1:4,5:8)).^-1;
quarter_10000_1_1_3_4_by_4 = (TestCB_10000_1_1_4_by_4(5:8,1:4)).^-1;
quarter_10000_1_1_4_4_by_4 = (TestCB_10000_1_1_4_by_4(5:8,5:8)).^-1;
G_10000_1_1_4_by_4_est = (-quarter_10000_1_1_1_4_by_4 + quarter_10000_1_1_2_4_by_4 + quarter_10000_1_1_3_4_by_4 + -quarter_10000_1_1_4_4_by_4)./((1/(8.5))*10^6);


% Remove the 'NaN'
G_1000_1_1_est(isnan(G_1000_1_1_est)) = 0;
G_1000_1_1_4_by_4_est(isnan(G_1000_1_1_4_by_4_est)) = 0;
G_1000_1_1_5_by_5_est(isnan(G_1000_1_1_5_by_5_est)) = 0;

G_10000_1_1_4_by_4_est(isnan(G_10000_1_1_4_by_4_est)) = 0;

% Ratio
check_1 = TestCB_1000_1_1_4_by_4 ./ TestCB_10000_1_1_4_by_4;

figure
subplot(1,3,1)
heatmap(G_1000_1_1_est);
title({'Estimation of Memristor Array', '1k @ [1,1] in 3-by-3'})
subplot(1,3,2)
heatmap(G_1000_1_1_4_by_4_est);
title({'Estimation of Memristor Array', '1k @ [1,1] in 4-by-4'})
subplot(1,3,3)
heatmap(G_1000_1_1_5_by_5_est);
title({'Estimation of Memristor Array', '1k @ [1,1] in 5-by-5'})
