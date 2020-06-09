%% SET-UP CONDITIONS

Row_Size = 3;         % Matrix Size (Row)
Column_Size = 3;      % Matrix Size (Column)
M = 5;                % Power of signal frequency
N = 8;                % Power of length
f = 2^M;              % Frequency of base harmonic
Fs = 32*f;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2^N;              % Length of signal   NB: MUST be power of 2
t = (0:L-1)*T;        % Time vector (2^N samples, from 0:2^N-1)
k = 1;                % multiplier basis for orthogonal signal

%% OBTAINING C MATRIX FOR THE EMPTY MEMRISTOR MODEL

% set up input sequence of voltages being, parameterised to make it 2^N 
number_of_inputs = Row_Size+Column_Size-1;
Vin = zeros(number_of_inputs,L);
for i = 1:number_of_inputs
Vin(i,1:L) = sin(2*pi*f*t*i);
end
Vin(4,1:L) = sin(2*pi*f*t*4);
Vin(5,1:L) = zeros(1,256);
Vin(6,1:L) = sin(2*pi*f*t*5);

% Conductance Matrix Setup (range of around 5k to 50k)
G_empty = zeros(Row_Size, Column_Size);
for i = 1:Row_Size
    for j = 1:Column_Size
        G_empty(i,j) = 10000;
    end
end

% Define matrices of potentials at each node (top [U] and bottom [V])
U = zeros(Row_Size,Column_Size,L);
U_ideal = zeros(Row_Size,Column_Size,L);
V = zeros(Row_Size,Column_Size,L);
V_ideal = zeros(Row_Size,Column_Size,L);
I_U = zeros(Row_Size,Column_Size,L);
I_V = zeros(Row_Size,Column_Size,L);

% Obtain lower triangular matrix
A = ones(Row_Size,Column_Size);
Low_Tri = tril(A);

% Define line resistance
R_row = 0.1;
R_col = 0.1;

% Required to calculate estimate of current through memristors
% Initially assume no line resistance (all row nodes of U are equal to input)
% Require 3D matrix; The potential at each node of array at each point in time

for p = 1:Row_Size
    for q = 1:Column_Size
        U_ideal(p,q,1:L) = Vin(p,1:L);
    end
end

% Calculate current through each memristor
I_mem = G_empty.*(U_ideal-V_ideal);

% Calculate row and column currents using sums of memristor currents
for q = 1:L
I_U(:,:,q) = I_mem(:,:,q)*Low_Tri;
I_V(:,:,q) = Low_Tri*I_mem(:,:,q);
end

% Construct initial U potential array (First Row) with line resistance included
for p = 1:Row_Size
    U(p,1,1:L) = Vin(p,1:L);
end

% Calculate actual U potentials of nodes due to line resistance
for i = 1:Row_Size
    for j = 2:Column_Size
        for k = 1:L
            U(i,j,k) = U(i,j-1,k) - I_U(i,j,k)*R_row; %why is it j-1? j?
        end
    end
end

% Calculate actual V potentials of nodes due to line resistance
for i = 2:Row_Size
    for j = 1:Column_Size
        for k = 1:L
            V(i,j,k) = V(i-1,j,k) + I_V(i,j,k)*R_col; %why is it i-1? i?
        end
    end
end

% Calculate Actual Memristor Currents Due to Line Resistances
I_mem_actual = G_empty.*(U-V);
Iout = zeros(number_of_inputs+1,L);

% I_row_1(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(1,2,1:L) + I_mem_actual(1,3,1:L);
% I_row_2(1,1:L) = I_mem_actual(2,1,1:L) + I_mem_actual(2,2,1:L) + I_mem_actual(2,3,1:L);
% I_row_3(1,1:L) = I_mem_actual(3,1,1:L) + I_mem_actual(3,2,1:L) + I_mem_actual(3,3,1:L);
% I_column_4(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(2,1,1:L) + I_mem_actual(3,1,1:L);
% I_column_6(1,1:L) = I_mem_actual(1,3,1:L) + I_mem_actual(2,3,1:L) + I_mem_actual(3,3,1:L);

for i = 1:Row_Size
Iout(i,1:L) =  I_mem_actual(i,1,1:L) +  I_mem_actual(i,2,1:L) +  I_mem_actual(i,3,1:L);
end
for j = 1:Column_Size
Iout(j+Row_Size,1:L) = I_mem_actual(1,j,1:L) + I_mem_actual(2,j,1:L) + I_mem_actual(3,j,1:L);
end

Vin_5_items(1:4,1:L) = Vin(1:4,1:L);
Vin_5_items(5,1:L) = Vin(6,1:L);
Iout_5_items(1:4,1:L) = Iout(1:4,1:L);
Iout_5_items(5,1:L) = Iout(6,1:L);
C_empty = Iout/Vin;
C_empty_5_items = Iout_5_items/Vin_5_items;


%% OBTAINING C MATRIX FOR THE FILLED MEMRISTOR MODEL

number_of_inputs = Row_Size+Column_Size-1;
Vin = zeros(number_of_inputs,L);
for i = 1:Row_Size
Vin(i,1:L) = sin(2*pi*f*t*i);
end
Vin(4,1:L) = sin(2*pi*f*t*4);
Vin(5,1:L) = zeros(1,256);
Vin(6,1:L) = sin(2*pi*f*t*5);

% Conductance Matrix Setup (range of around 5k to 50k)
G_filled = (20*10^-6)+(rand(Row_Size,Column_Size).*200*10^-6);

% Define matrices of potentials at each node (top [U] and bottom [V])
U = zeros(Row_Size,Column_Size,L);
U_ideal = zeros(Row_Size,Column_Size,L);
V = zeros(Row_Size,Column_Size,L);
V_ideal = zeros(Row_Size,Column_Size,L);
I_U = zeros(Row_Size,Column_Size,L);
I_V = zeros(Row_Size,Column_Size,L);

% Obtain lower triangular matrix
A = ones(Row_Size,Column_Size);
Low_Tri = tril(A);

% Define line resistance
R_row = 0.1;
R_col = 0.1;

% Required to calculate estimate of current through memristors
% Initially assume no line resistance (all row nodes of U are equal to input)
% Require 3D matrix; The potential at each node of array at each point in time

for p = 1:Row_Size
    for q = 1:Column_Size
        U_ideal(p,q,1:L) = Vin(p,1:L);
    end
end

for p = 1:Column_Size
    for q = 1:Row_Size
        V_ideal(q,p,1:L) = Vin(p+Row_Size,1:L);
    end
end

% Calculate current through each memristor
I_mem = G_filled.*(U_ideal-V_ideal);

% Calculate row and column currents using sums of memristor currents
for q = 1:L
I_U(:,:,q) = I_mem(:,:,q)*Low_Tri;
I_V(:,:,q) = Low_Tri*I_mem(:,:,q);
end

% Construct initial U potential array (First Row) with line resistance included
for p = 1:Row_Size
    U(p,1,1:L) = Vin(p,1:L);
end

% Calculate actual U potentials of nodes due to line resistance
for i = 1:Row_Size
    for j = 2:Column_Size
        for k = 1:L
            U(i,j,k) = U(i,j-1,k) - I_U(i,j,k)*R_row; %why is it j-1? j?
        end
    end
end

% Calculate actual V potentials of nodes due to line resistance
for i = 2:Row_Size
    for j = 1:Column_Size
        for k = 1:L
            V(i,j,k) = V(i-1,j,k) + I_V(i,j,k)*R_col; %why is it i-1? i?
        end
    end
end

% Calculate Actual Memristor Currents Due to Line Resistances
I_mem_actual = G_filled.*(U-V);
Iout = zeros(number_of_inputs+1,L);

% I_row_1(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(1,2,1:L) + I_mem_actual(1,3,1:L);
% I_row_2(1,1:L) = I_mem_actual(2,1,1:L) + I_mem_actual(2,2,1:L) + I_mem_actual(2,3,1:L);
% I_row_3(1,1:L) = I_mem_actual(3,1,1:L) + I_mem_actual(3,2,1:L) + I_mem_actual(3,3,1:L);
% I_column_4(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(2,1,1:L) + I_mem_actual(3,1,1:L);
% I_column_6(1,1:L) = I_mem_actual(1,3,1:L) + I_mem_actual(2,3,1:L) + I_mem_actual(3,3,1:L);

for i = 1:Row_Size
Iout(i,1:L) =  I_mem_actual(i,1,1:L) +  I_mem_actual(i,2,1:L) +  I_mem_actual(i,3,1:L);
end
for j = 1:Column_Size
Iout(j+Row_Size,1:L) = I_mem_actual(1,j,1:L) + I_mem_actual(2,j,1:L) + I_mem_actual(3,j,1:L);
end

Vin_5_items(1:4,1:L) = Vin(1:4,1:L);
Vin_5_items(5,1:L) = Vin(6,1:L);
Iout_5_items(1:4,1:L) = Iout(1:4,1:L);
Iout_5_items(5,1:L) = Iout(6,1:L);
C_filled_5_items = Iout_5_items/Vin_5_items;
C_filled = Iout/Vin;

%% DETERMINE DIFFERNECE BETWEEN EMPTY AND FILLED ARRAY

C_mem = C_filled - C_empty;
C_mem_5_items = C_filled_5_items - C_empty_5_items;
I_mem_estimated = C_mem*Vin;

%%---------------------------------------------------------------------------
%%---------------------------------------------------------------------------
%% OBTAINING C MATRIX FOR THE EMPTY MEMRISTOR MODEL (2ND ATTEMPT)

% Define matrices of potentials at each node (top [U] and bottom [V])
U = zeros(Row_Size,Column_Size,L);
U_ideal = zeros(Row_Size,Column_Size,L);
V = zeros(Row_Size,Column_Size,L);
V_ideal = zeros(Row_Size,Column_Size,L);
I_U = zeros(Row_Size,Column_Size,L);
I_V = zeros(Row_Size,Column_Size,L);

% Obtain lower triangular matrix
A = ones(Row_Size,Column_Size);
Low_Tri = tril(A);

% Define line resistance
R_row = 0.4;
R_col = 0.4;

% Required to calculate estimate of current through memristors
% Initially assume no line resistance (all row nodes of U are equal to input)
% Require 3D matrix; The potential at each node of array at each point in time

for p = 1:Row_Size
    for q = 1:Column_Size
        U_ideal(p,q,1:L) = Vin(p,1:L);
    end
end

% Calculate current through each memristor
I_mem = G_empty.*(U_ideal-V_ideal);

% Calculate row and column currents using sums of memristor currents
for q = 1:L
I_U(:,:,q) = I_mem(:,:,q)*Low_Tri;
I_V(:,:,q) = Low_Tri*I_mem(:,:,q);
end

% Construct initial U potential array (First Row) with line resistance included
for p = 1:Row_Size
    U(p,1,1:L) = Vin(p,1:L);
end

% Calculate actual U potentials of nodes due to line resistance
for i = 1:Row_Size
    for j = 2:Column_Size
        for k = 1:L
            U(i,j,k) = U(i,j-1,k) - I_U(i,j,k)*R_row; %why is it j-1? j?
        end
    end
end

% Calculate actual V potentials of nodes due to line resistance
for i = 2:Row_Size
    for j = 1:Column_Size
        for k = 1:L
            V(i,j,k) = V(i-1,j,k) + I_V(i,j,k)*R_col; %why is it i-1? i?
        end
    end
end

% Calculate Actual Memristor Currents Due to Line Resistances
I_mem_actual = G_empty.*(U-V);
Iout = zeros(number_of_inputs+1,L);

for i = 1:Row_Size
Iout(i,1:L) =  I_mem_actual(i,1,1:L) +  I_mem_actual(i,2,1:L) +  I_mem_actual(i,3,1:L);
end
for j = 1:Column_Size
Iout(j+Row_Size,1:L) = I_mem_actual(1,j,1:L) + I_mem_actual(2,j,1:L) + I_mem_actual(3,j,1:L);
end

Vin_5_items(1:4,1:L) = Vin(1:4,1:L);
Vin_5_items(5,1:L) = Vin(6,1:L);
Iout_5_items(1:4,1:L) = Iout(1:4,1:L);
Iout_5_items(5,1:L) = Iout(6,1:L);
C_empty_2_5_items = Iout_5_items/Vin_5_items;
C_empty_2 = Iout/Vin;


%% OBTAINING C MATRIX FOR THE FILLED MEMRISTOR MODEL (2ND ATTEMPT)

% Define matrices of potentials at each node (top [U] and bottom [V])
U = zeros(Row_Size,Column_Size,L);
U_ideal = zeros(Row_Size,Column_Size,L);
V = zeros(Row_Size,Column_Size,L);
V_ideal = zeros(Row_Size,Column_Size,L);
I_U = zeros(Row_Size,Column_Size,L);
I_V = zeros(Row_Size,Column_Size,L);

% Obtain lower triangular matrix
A = ones(Row_Size,Column_Size);
Low_Tri = tril(A);

% Define line resistance
R_row = 0.4;
R_col = 0.4;

% Required to calculate estimate of current through memristors
% Initially assume no line resistance (all row nodes of U are equal to input)
% Require 3D matrix; The potential at each node of array at each point in time

for p = 1:Row_Size
    for q = 1:Column_Size
        U_ideal(p,q,1:L) = Vin(p,1:L);
    end
end

for p = 1:Column_Size
    for q = 1:Row_Size
        V_ideal(q,p,1:L) = Vin(p+Row_Size,1:L);
    end
end

% Calculate current through each memristor
I_mem = G_filled.*(U_ideal-V_ideal);

% Calculate row and column currents using sums of memristor currents
for q = 1:L
I_U(:,:,q) = I_mem(:,:,q)*Low_Tri;
I_V(:,:,q) = Low_Tri*I_mem(:,:,q);
end

% Construct initial U potential array (First Row) with line resistance included
for p = 1:Row_Size
    U(p,1,1:L) = Vin(p,1:L);
end

% Calculate actual U potentials of nodes due to line resistance
for i = 1:Row_Size
    for j = 2:Column_Size
        for k = 1:L
            U(i,j,k) = U(i,j-1,k) - I_U(i,j,k)*R_row; %why is it j-1? j?
        end
    end
end

% Calculate actual V potentials of nodes due to line resistance
for i = 2:Row_Size
    for j = 1:Column_Size
        for k = 1:L
            V(i,j,k) = V(i-1,j,k) + I_V(i,j,k)*R_col; %why is it i-1? i?
        end
    end
end

% Calculate Actual Memristor Currents Due to Line Resistances
I_mem_actual = G_filled.*(U-V);
Iout = zeros(number_of_inputs+1,L);

% I_row_1(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(1,2,1:L) + I_mem_actual(1,3,1:L);
% I_row_2(1,1:L) = I_mem_actual(2,1,1:L) + I_mem_actual(2,2,1:L) + I_mem_actual(2,3,1:L);
% I_row_3(1,1:L) = I_mem_actual(3,1,1:L) + I_mem_actual(3,2,1:L) + I_mem_actual(3,3,1:L);
% I_column_4(1,1:L) = I_mem_actual(1,1,1:L) + I_mem_actual(2,1,1:L) + I_mem_actual(3,1,1:L);
% I_column_6(1,1:L) = I_mem_actual(1,3,1:L) + I_mem_actual(2,3,1:L) + I_mem_actual(3,3,1:L);

for i = 1:Row_Size
Iout(i,1:L) =  I_mem_actual(i,1,1:L) +  I_mem_actual(i,2,1:L) +  I_mem_actual(i,3,1:L);
end
for j = 1:Column_Size
Iout(j+Row_Size,1:L) = I_mem_actual(1,j,1:L) + I_mem_actual(2,j,1:L) + I_mem_actual(3,j,1:L);
end

Vin_5_items(1:4,1:L) = Vin(1:4,1:L);
Vin_5_items(5,1:L) = Vin(6,1:L);
Iout_5_items(1:4,1:L) = Iout(1:4,1:L);
Iout_5_items(5,1:L) = Iout(6,1:L);
C_filled_2_5_items = Iout_5_items/Vin_5_items;
C_filled_2 = Iout/Vin;

%% DETERMINE DIFFERNECE BETWEEN EMPTY AND FILLED ARRAY (2ND ATTEMPT)

C_mem_2 = C_filled_2 - C_empty_2;
C_mem_2_5_items = C_filled_2_5_items - C_empty_2_5_items;
I_mem_estimated_2 = C_mem*Vin;

%%---------------------------------------------------------------------------
%%---------------------------------------------------------------------------

for i = 1:6
    for j=1:6
        scale_factor_diff(i,j) = C_mem(i,j)./C_mem_2(i,j);
    end
end
for i = 1:5
    for j=1:5
        scale_factor_diff_2(i,j) = C_mem_5_items(i,j)./C_mem_2_5_items(i,j);
    end
end

%% BLANK

LTSPICE
