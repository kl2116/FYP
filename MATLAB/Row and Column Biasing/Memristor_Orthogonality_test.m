%% LOAD LTSPICE DATA
clear all;
y1 = LTspice2Matlab('Memristor_new_1_1_1000.RAW');      % 1k @ 1,1
y2 = LTspice2Matlab('Memristor_new_1_1_10000.RAW');     % 10k @ 1,1
y3 = LTspice2Matlab('Memristor_new_1_1_100000.RAW');    % 100k @ 1,1
y4 = LTspice2Matlab('Memristor_new_2_1_1000.RAW');      % 1k @ 2,1
y5 = LTspice2Matlab('Memristor_new_2_1_10000.RAW');     % 10k @ 2,1
y6 = LTspice2Matlab('Memristor_new_2_1_100000.RAW');    % 100k @ 2,1
y7 = LTspice2Matlab('Memristor_new_3_1_1000.RAW');      % 1k @ 3,1
y8 = LTspice2Matlab('Memristor_new_3_1_10000.RAW');     % 10k @ 3,1
y9 = LTspice2Matlab('Memristor_new_3_1_100000.RAW');    % 100k @ 3

%% LOAD CURRENT DATA

% 1k Resistors
Column_Current_1000_1_1 (1:3,1) = y1.variable_mat(38:-1:36,4);
Column_Current_1000_1_1 (1:3,2) = y1.variable_mat(38:-1:36,11);
Column_Current_1000_1_1 (1:3,3) = y1.variable_mat(38:-1:36,18); 

Column_Current_1000_2_1 (1:3,1) = y4.variable_mat(38:-1:36,4);
Column_Current_1000_2_1 (1:3,2) = y4.variable_mat(38:-1:36,11);
Column_Current_1000_2_1 (1:3,3) = y4.variable_mat(38:-1:36,18); 

Column_Current_1000_3_1 (1:3,1) = y7.variable_mat(38:-1:36,4);
Column_Current_1000_3_1 (1:3,2) = y7.variable_mat(38:-1:36,11);
Column_Current_1000_3_1 (1:3,3) = y7.variable_mat(38:-1:36,18);

% 10k Resistors
Column_Current_10000_1_1 (1:3,1) = y2.variable_mat(38:-1:36,4);
Column_Current_10000_1_1 (1:3,2) = y2.variable_mat(38:-1:36,11);
Column_Current_10000_1_1 (1:3,3) = y2.variable_mat(38:-1:36,18); 

Column_Current_10000_2_1 (1:3,1) = y5.variable_mat(38:-1:36,4);
Column_Current_10000_2_1 (1:3,2) = y5.variable_mat(38:-1:36,11);
Column_Current_10000_2_1 (1:3,3) = y5.variable_mat(38:-1:36,18); 

Column_Current_10000_3_1 (1:3,1) = y8.variable_mat(38:-1:36,4);
Column_Current_10000_3_1 (1:3,2) = y8.variable_mat(38:-1:36,11);
Column_Current_10000_3_1 (1:3,3) = y8.variable_mat(38:-1:36,18); 

% 100k Resistors
Column_Current_100000_1_1 (1:3,1) = y3.variable_mat(38:-1:36,4);
Column_Current_100000_1_1 (1:3,2) = y3.variable_mat(38:-1:36,11);
Column_Current_100000_1_1 (1:3,3) = y3.variable_mat(38:-1:36,18); 

Column_Current_100000_2_1 (1:3,1) = y6.variable_mat(38:-1:36,4);
Column_Current_100000_2_1 (1:3,2) = y6.variable_mat(38:-1:36,11);
Column_Current_100000_2_1 (1:3,3) = y6.variable_mat(38:-1:36,18); 

Column_Current_100000_3_1 (1:3,1) = y9.variable_mat(38:-1:36,4);
Column_Current_100000_3_1 (1:3,2) = y9.variable_mat(38:-1:36,11);
Column_Current_100000_3_1 (1:3,3) = y9.variable_mat(38:-1:36,18); 

%% ORTHOGONALITY TEST

Column_Current_1000_1_1_1_mod = 0;
Column_Current_1000_1_1_2_mod = 0;
Column_Current_1000_1_1_3_mod = 0;
Column_Current_1000_2_1_1_mod = 0;
Column_Current_1000_2_1_2_mod = 0;
Column_Current_1000_2_1_3_mod = 0;
Column_Current_1000_3_1_1_mod = 0;
Column_Current_1000_3_1_2_mod = 0;
Column_Current_1000_3_1_3_mod = 0;

Column_Current_10000_1_1_1_mod = 0;
Column_Current_10000_1_1_2_mod = 0;
Column_Current_10000_1_1_3_mod = 0;
Column_Current_10000_2_1_1_mod = 0;
Column_Current_10000_2_1_2_mod = 0;
Column_Current_10000_2_1_3_mod = 0;
Column_Current_10000_3_1_1_mod = 0;
Column_Current_10000_3_1_2_mod = 0;
Column_Current_10000_3_1_3_mod = 0;

Column_Current_100000_1_1_1_mod = 0;
Column_Current_100000_1_1_2_mod = 0;
Column_Current_100000_1_1_3_mod = 0;
Column_Current_100000_2_1_1_mod = 0;
Column_Current_100000_2_1_2_mod = 0;
Column_Current_100000_2_1_3_mod = 0;
Column_Current_100000_3_1_1_mod = 0;
Column_Current_100000_3_1_2_mod = 0;
Column_Current_100000_3_1_3_mod = 0;


for i = 1:3
     Column_Current_1000_1_1_1_mod = Column_Current_1000_1_1_1_mod + Column_Current_1000_1_1(i,1)^2;
     Column_Current_1000_1_1_2_mod = Column_Current_1000_1_1_2_mod + Column_Current_1000_1_1(i,2)^2;
     Column_Current_1000_1_1_3_mod = Column_Current_1000_1_1_3_mod + Column_Current_1000_1_1(i,3)^2;
     
     Column_Current_1000_2_1_1_mod = Column_Current_1000_2_1_1_mod + Column_Current_1000_2_1(i,1)^2;
     Column_Current_1000_2_1_2_mod = Column_Current_1000_2_1_2_mod + Column_Current_1000_2_1(i,2)^2;
     Column_Current_1000_2_1_3_mod = Column_Current_1000_2_1_3_mod + Column_Current_1000_2_1(i,3)^2;
     
     Column_Current_1000_3_1_1_mod = Column_Current_1000_3_1_1_mod + Column_Current_1000_3_1(i,1)^2;
     Column_Current_1000_3_1_2_mod = Column_Current_1000_3_1_2_mod + Column_Current_1000_3_1(i,2)^2;
     Column_Current_1000_3_1_3_mod = Column_Current_1000_3_1_3_mod + Column_Current_1000_3_1(i,3)^2;
     
     
     Column_Current_10000_1_1_1_mod = Column_Current_10000_1_1_1_mod + Column_Current_10000_1_1(i,1)^2;
     Column_Current_10000_1_1_2_mod = Column_Current_10000_1_1_2_mod + Column_Current_10000_1_1(i,2)^2;
     Column_Current_10000_1_1_3_mod = Column_Current_10000_1_1_3_mod + Column_Current_10000_1_1(i,3)^2;
     
     Column_Current_10000_2_1_1_mod = Column_Current_10000_2_1_1_mod + Column_Current_10000_2_1(i,1)^2;
     Column_Current_10000_2_1_2_mod = Column_Current_10000_2_1_2_mod + Column_Current_10000_2_1(i,2)^2;
     Column_Current_10000_2_1_3_mod = Column_Current_10000_2_1_3_mod + Column_Current_10000_2_1(i,3)^2;
     
     Column_Current_10000_3_1_1_mod = Column_Current_10000_3_1_1_mod + Column_Current_10000_3_1(i,1)^2;
     Column_Current_10000_3_1_2_mod = Column_Current_10000_3_1_2_mod + Column_Current_10000_3_1(i,2)^2;
     Column_Current_10000_3_1_3_mod = Column_Current_10000_3_1_3_mod + Column_Current_10000_3_1(i,3)^2;
     
     
     Column_Current_100000_1_1_1_mod = Column_Current_100000_1_1_1_mod + Column_Current_100000_1_1(i,1)^2;
     Column_Current_100000_1_1_2_mod = Column_Current_100000_1_1_2_mod + Column_Current_100000_1_1(i,2)^2;
     Column_Current_100000_1_1_3_mod = Column_Current_100000_1_1_3_mod + Column_Current_100000_1_1(i,3)^2;
     
     Column_Current_100000_2_1_1_mod = Column_Current_100000_2_1_1_mod + Column_Current_100000_2_1(i,1)^2;
     Column_Current_100000_2_1_2_mod = Column_Current_100000_2_1_2_mod + Column_Current_100000_2_1(i,2)^2;
     Column_Current_100000_2_1_3_mod = Column_Current_100000_2_1_3_mod + Column_Current_100000_2_1(i,3)^2;
     
     Column_Current_100000_3_1_1_mod = Column_Current_100000_3_1_1_mod + Column_Current_100000_3_1(i,1)^2;
     Column_Current_100000_3_1_2_mod = Column_Current_100000_3_1_2_mod + Column_Current_100000_3_1(i,2)^2;
     Column_Current_100000_3_1_3_mod = Column_Current_100000_3_1_3_mod + Column_Current_100000_3_1(i,3)^2;
end

Column_Current_1000_1_1_1_mod = sqrt(Column_Current_1000_1_1_1_mod);
Column_Current_1000_1_1_2_mod = sqrt(Column_Current_1000_1_1_2_mod);
Column_Current_1000_1_1_3_mod = sqrt(Column_Current_1000_1_1_3_mod);
Column_Current_1000_2_1_1_mod = sqrt(Column_Current_1000_2_1_1_mod);
Column_Current_1000_2_1_2_mod = sqrt(Column_Current_1000_2_1_2_mod);
Column_Current_1000_2_1_3_mod = sqrt(Column_Current_1000_2_1_3_mod);
Column_Current_1000_3_1_1_mod = sqrt(Column_Current_1000_2_1_1_mod);
Column_Current_1000_3_1_2_mod = sqrt(Column_Current_1000_2_1_2_mod);
Column_Current_1000_3_1_3_mod = sqrt(Column_Current_1000_2_1_3_mod);

Column_Current_10000_1_1_1_mod = sqrt(Column_Current_10000_1_1_1_mod);
Column_Current_10000_1_1_2_mod = sqrt(Column_Current_10000_1_1_2_mod);
Column_Current_10000_1_1_3_mod = sqrt(Column_Current_10000_1_1_3_mod);
Column_Current_10000_2_1_1_mod = sqrt(Column_Current_10000_2_1_1_mod);
Column_Current_10000_2_1_2_mod = sqrt(Column_Current_10000_2_1_2_mod);
Column_Current_10000_2_1_3_mod = sqrt(Column_Current_10000_2_1_3_mod);
Column_Current_10000_3_1_1_mod = sqrt(Column_Current_10000_2_1_1_mod);
Column_Current_10000_3_1_2_mod = sqrt(Column_Current_10000_2_1_2_mod);
Column_Current_10000_3_1_3_mod = sqrt(Column_Current_10000_2_1_3_mod);

Column_Current_100000_1_1_1_mod = sqrt(Column_Current_100000_1_1_1_mod);
Column_Current_100000_1_1_2_mod = sqrt(Column_Current_100000_1_1_2_mod);
Column_Current_100000_1_1_3_mod = sqrt(Column_Current_100000_1_1_3_mod);
Column_Current_100000_2_1_1_mod = sqrt(Column_Current_100000_2_1_1_mod);
Column_Current_100000_2_1_2_mod = sqrt(Column_Current_100000_2_1_2_mod);
Column_Current_100000_2_1_3_mod = sqrt(Column_Current_100000_2_1_3_mod);
Column_Current_100000_3_1_1_mod = sqrt(Column_Current_100000_2_1_1_mod);
Column_Current_100000_3_1_2_mod = sqrt(Column_Current_100000_2_1_2_mod);
Column_Current_100000_3_1_3_mod = sqrt(Column_Current_100000_2_1_3_mod);


orthogonal_test_1_1 = (Column_Current_1000_1_1(:,1)' * Column_Current_1000_2_1(:,1))/(Column_Current_1000_1_1_1_mod * Column_Current_1000_2_1_1_mod);
orthogonal_test_1_2 = (Column_Current_1000_1_1(:,2)' * Column_Current_1000_2_1(:,2))/(Column_Current_1000_1_1_2_mod * Column_Current_1000_2_1_2_mod);
orthogonal_test_1_3 = (Column_Current_1000_1_1(:,3)' * Column_Current_1000_2_1(:,3))/(Column_Current_1000_1_1_3_mod * Column_Current_1000_2_1_3_mod);

orthogonal_test_1_4 = (Column_Current_1000_2_1(:,1)' * Column_Current_1000_3_1(:,1))/(Column_Current_1000_2_1_1_mod * Column_Current_1000_3_1_1_mod);
orthogonal_test_1_5 = (Column_Current_1000_2_1(:,2)' * Column_Current_1000_3_1(:,2))/(Column_Current_1000_2_1_2_mod * Column_Current_1000_3_1_2_mod);
orthogonal_test_1_6 = (Column_Current_1000_2_1(:,3)' * Column_Current_1000_3_1(:,3))/(Column_Current_1000_2_1_3_mod * Column_Current_1000_3_1_3_mod);

orthogonal_test_1_7 = (Column_Current_1000_1_1(:,1)' * Column_Current_1000_3_1(:,1))/(Column_Current_1000_1_1_1_mod * Column_Current_1000_3_1_1_mod);
orthogonal_test_1_8 = (Column_Current_1000_1_1(:,2)' * Column_Current_1000_3_1(:,2))/(Column_Current_1000_1_1_2_mod * Column_Current_1000_3_1_2_mod);
orthogonal_test_1_9 = (Column_Current_1000_1_1(:,3)' * Column_Current_1000_3_1(:,3))/(Column_Current_1000_1_1_3_mod * Column_Current_1000_3_1_3_mod);


orthogonal_test_2_1 = (Column_Current_1000_1_1(:,1)' * Column_Current_10000_2_1(:,1))/(Column_Current_1000_1_1_1_mod * Column_Current_10000_2_1_1_mod);
orthogonal_test_2_2 = (Column_Current_1000_1_1(:,2)' * Column_Current_10000_2_1(:,2))/(Column_Current_1000_1_1_2_mod * Column_Current_10000_2_1_2_mod);
orthogonal_test_2_3 = (Column_Current_1000_1_1(:,3)' * Column_Current_10000_2_1(:,3))/(Column_Current_1000_1_1_3_mod * Column_Current_10000_2_1_3_mod);

orthogonal_test_2_4 = (Column_Current_1000_2_1(:,1)' * Column_Current_10000_3_1(:,1))/(Column_Current_1000_2_1_1_mod * Column_Current_10000_3_1_1_mod);
orthogonal_test_2_5 = (Column_Current_1000_2_1(:,2)' * Column_Current_10000_3_1(:,2))/(Column_Current_1000_2_1_2_mod * Column_Current_10000_3_1_2_mod);
orthogonal_test_2_6 = (Column_Current_1000_2_1(:,3)' * Column_Current_10000_3_1(:,3))/(Column_Current_1000_2_1_3_mod * Column_Current_10000_3_1_3_mod);

orthogonal_test_2_7 = (Column_Current_1000_1_1(:,1)' * Column_Current_10000_3_1(:,1))/(Column_Current_1000_1_1_1_mod * Column_Current_10000_3_1_1_mod);
orthogonal_test_2_8 = (Column_Current_1000_1_1(:,2)' * Column_Current_10000_3_1(:,2))/(Column_Current_1000_1_1_2_mod * Column_Current_10000_3_1_2_mod);
orthogonal_test_2_9 = (Column_Current_1000_1_1(:,3)' * Column_Current_10000_3_1(:,3))/(Column_Current_1000_1_1_3_mod * Column_Current_10000_3_1_3_mod);
