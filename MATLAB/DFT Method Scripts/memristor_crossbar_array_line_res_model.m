M = 4;                % Power of signal frequency
N = 5;                % Power of length
f = 2^M;              % Frequency of base harmonic
Fs = 32*f;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2^N;              % Length of signal   NB: MUST be power of 2
t = (0:L-1)*T;        % Time vector (2^N samples, from 0:2^N-1)
k = 1;                % multiplier basis for orthogonal signal
n = 8;                % rows of memristor crossbar array
m = 8;                % Columns of memristor crossbar array

% set up input sequence of voltages being, parameterised to make it 2^N 
Vin = zeros(8,L);
Vin(1,1:L) = sin(2*pi*f*t*k);
Vin(2,1:L) = sin(2*pi*f*t*(k+1));
Vin(3,1:L) = sin(2*pi*f*t*(k+2));
Vin(4,1:L) = sin(2*pi*f*t*(k+3));
Vin(5,1:L) = sin(2*pi*f*t*(k+4));
Vin(6,1:L) = sin(2*pi*f*t*(k+5));
Vin(7,1:L) = sin(2*pi*f*t*(k+6));
Vin(8,1:L) = sin(2*pi*f*t*(k+7));

% Conductance Matrix Setup (range of around 5k to 50k)
%G = (20*10^-6)+(rand(n,m).*200*10^-6);
figure
heatmap(G);
title('Real Conductance Matrix')

% Define matrices of potentials at each node (top [U] and bottom [V])
U = zeros(8,8,L);
U_ideal = zeros(8,8,L);
V = zeros(8,8,L);
V_ideal = zeros(8,8,L);
I_U = zeros(8,8,L);
I_V = zeros(8,8,L);

% Obtain lower triangular matrix
A = ones(8,8);
Low_Tri = tril(A);

% Define line resistance
R_row = 100;
R_col = 100;

% Required to calculate estimate of current through memristors
% Initially assume no line resistance (all row nodes of U are equal to input)
% Require 3D matrix; The potential at each node of array at each point in time

for p = 1:8
    for q = 1:8
        U_ideal(p,q,1:L) = Vin(p,1:L);
    end
end

% Calculate current through each memristor
I_mem = G.*(U_ideal-V_ideal);

% Calculate row and column currents using sums of memristor currents
for q = 1:L
I_U(:,:,q) = I_mem(:,:,q)*Low_Tri;
I_V(:,:,q) = Low_Tri*I_mem(:,:,q);
end

% Construct initial U potential array with line resistance included
for p = 1:8
    U(p,1,1:L) = Vin(p,1:L);
end

% Calculate actual U potentials of nodes due to line resistance
for i = 1:8
    for j = 2:8
        for k = 1:L
            U(i,j,k) = U(i,j-1,k) - I_U(i,j-1,k)*R_row; %why is it j-1? j?
        end
    end
end

% Calculate actual V potentials of nodes due to line resistance
for i = 2:8
    for j = 1:8
        for k = 1:L
            V(i,j,k) = V(i-1,j,k) + I_V(i-1,j,k)*R_col; %why is it i-1? i?
        end
    end
end


% END OF LINE RESISTANCE MODELLING
% THE FOLLOWING SHOWS A METHOD USED TO COMPUTE 'GUESSES' OF THE CONDUCTANCE
% MATRIX USING THE FOURIER TRANSFORM FUNCTION

% calculating for current
% transpose as column 1 resistors are multiplied by the corresponding
% current at each node at time instances

%Iout = G'*Vin;
Iout = G'.*(U-V);
Iout_int = sum(Iout,1);
Iout_sum = reshape(Iout_int,8,32);

% Transform of current in each column
FT_Mem_Current = fft(Iout_sum,L,2); %compute the fft of the current for each row

% Plotting FT I1
freq = Fs*(0:(L/2))/L;              
P2_FT_I1 = abs(FT_Mem_Current(1,1:L)/L);
P1_FT_I1 = P2_FT_I1(1:L/2+1);
P1_FT_I1(2:end-1) = 2*P1_FT_I1(2:end-1);
figure
subplot(2,4,1)
bar(freq,P1_FT_I1)
title('Fourier Transform of I1')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I2
freq = Fs*(0:(L/2))/L;              
P2_FT_I2 = abs(FT_Mem_Current(2,1:L)/L);
P1_FT_I2 = P2_FT_I2(1:L/2+1);
P1_FT_I2(2:end-1) = 2*P1_FT_I2(2:end-1);
subplot(2,4,2)
bar(freq,P1_FT_I2)
title('Fourier Transform of I2')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I3
freq = Fs*(0:(L/2))/L;              
P2_FT_I3 = abs(FT_Mem_Current(3,1:L)/L);
P1_FT_I3 = P2_FT_I3(1:L/2+1);
P1_FT_I3(2:end-1) = 2*P1_FT_I3(2:end-1);
subplot(2,4,3)
bar(freq,P1_FT_I3)
title('Fourier Transform of I3')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I4
freq = Fs*(0:(L/2))/L;              
P2_FT_I4 = abs(FT_Mem_Current(4,1:L)/L);
P1_FT_I4 = P2_FT_I4(1:L/2+1);
P1_FT_I4(2:end-1) = 2*P1_FT_I4(2:end-1);
subplot(2,4,4)
bar(freq,P1_FT_I4)
title('Fourier Transform of I4')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I5
freq = Fs*(0:(L/2))/L;              
P2_FT_I5 = abs(FT_Mem_Current(5,1:L)/L);
P1_FT_I5 = P2_FT_I5(1:L/2+1);
P1_FT_I5(2:end-1) = 2*P1_FT_I5(2:end-1);
subplot(2,4,5)
bar(freq,P1_FT_I5)
title('Fourier Transform of I5')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I6
freq = Fs*(0:(L/2))/L;              
P2_FT_I6 = abs(FT_Mem_Current(6,1:L)/L);
P1_FT_I6 = P2_FT_I6(1:L/2+1);
P1_FT_I6(2:end-1) = 2*P1_FT_I6(2:end-1);
subplot(2,4,6)
bar(freq,P1_FT_I6)
title('Fourier Transform of I6')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I7
freq = Fs*(0:(L/2))/L;              
P2_FT_I7 = abs(FT_Mem_Current(7,1:L)/L);
P1_FT_I7 = P2_FT_I7(1:L/2+1);
P1_FT_I7(2:end-1) = 2*P1_FT_I7(2:end-1);
subplot(2,4,7)
bar(freq,P1_FT_I7)
title('Fourier Transform of I7')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Plotting FT I8
freq = Fs*(0:(L/2))/L;              
P2_FT_I8 = abs(FT_Mem_Current(8,1:L)/L);
P1_FT_I8 = P2_FT_I8(1:L/2+1);
P1_FT_I8(2:end-1) = 2*P1_FT_I8(2:end-1);
subplot(2,4,8)
bar(freq,P1_FT_I8)
title('Fourier Transform of I8')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150]);
grid on;
grid minor;

% Use fourier transform to compute estimate for new conductance matrix
G_fourier(1:8,1) = P1_FT_I1(2:9);
G_fourier(1:8,2) = P1_FT_I2(2:9);
G_fourier(1:8,3) = P1_FT_I3(2:9);
G_fourier(1:8,4) = P1_FT_I4(2:9);
G_fourier(1:8,5) = P1_FT_I5(2:9);
G_fourier(1:8,6) = P1_FT_I6(2:9);
G_fourier(1:8,7) = P1_FT_I7(2:9);
G_fourier(1:8,8) = P1_FT_I8(2:9);

figure
heatmap(G_fourier)
title('Estimated Conductance Matrix with Fourier Transform')

% Calculate new current from conductance matrix
Iout_1 = G_fourier'*Vin;

% Find error between 'measured' current and 'guessed' current
error_1 = Iout_1 - Iout;
mean_error_1 = zeros(8,8);
for k = 1:8 
mean_error_1 (k,1:8) = mean(error_1,2);
end

% Correct conductance by adding/subtracting error to conductance
G_1 = G_fourier - mean_error_1;

% 2nd iteration
Iout_2 = G_1'*Vin;
error_2 = Iout_2 - Iout_1;
mean_error_2 = zeros(8,8);
for k = 1:8 
mean_error_2 (k,1:8) = mean(error_2,2);
end
G_2 = G_1 - mean_error_2;

% 3rd iteration
Iout_3 = G_2'*Vin;
error_3 = Iout_3 - Iout_2;
mean_error_3 = zeros(8,8);
for k = 1:8 
mean_error_3 (k,1:8) = mean(error_3,2);
end
G_3 = G_2 - mean_error_3;

% 4th iteration
Iout_4 = G_3'*Vin;
error_4 = Iout_4 - Iout_3;
mean_error_4 = zeros(8,8);
for k = 1:8 
mean_error_4 (k,1:8) = mean(error_4,2);
end
G_4 = G_3 - mean_error_4;

%Plotting the Fourier Transform of signal
%{ 
figure
plot(t,v1);                 %signal for FT to be taken
Y = fft(v1);                %transform of input
freq = Fs*(0:(L/2))/L;      %define frequency axis
P2 = abs(Y/L);
P1 = P2(1:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
bar(freq,P1) 
title('Single-Sided Amplitude Spectrum of S(t)')
xlabel('f (Hz)')
ylabel('|P1(f)|')
%}