%testing for fourier signals on memristor crossbar array
M = 4;                % Power of signal frequency
N = 5;                % Power of length
f = 2^M;              % Frequency of base harmonic
%100 samples
Fs = 32*f;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 2^N;              % Length of signal   NB: MUST be power of 2
t = (0:L-1)*T;        % Time vector (2^N samples, from 0:2^N-1)
n = 1;

%set up input sequence of voltages being 
v1 = sin(2*pi*f*t*n);
v2 = sin(2*pi*f*t*(n+1));
v3 = sin(2*pi*f*t*(n+2));
v4 = sin(2*pi*f*t*(n+3));
v5 = sin(2*pi*f*t*(n+4));
v6 = sin(2*pi*f*t*(n+5));
v7 = sin(2*pi*f*t*(n+6));
v8 = sin(2*pi*f*t*(n+7));

Vin = zeros(8,L); %Please parametrise the number of columns of this, and make it 2^N
Vin(1,1:L) = v1;
Vin(2,1:L) = v2;
Vin(3,1:L) = v3;
Vin(4,1:L) = v4;
Vin(5,1:L) = v5;
Vin(6,1:L) = v6;
Vin(7,1:L) = v7;
Vin(8,1:L) = v8;

%Conductance Matrix Setup
G = zeros(8,8);
%G = randi(1000,8,8);
G = (20*10^-6)+(rand(8,8).*200*10^-6);

%calculating for current
%transpose as column 1 resistors are multiplied by the corresponding
%current at each node at time instances
Iout = G'*Vin;
figure
plot(t,Iout(1,1:L));
title('column 1 current')
xlabel('time')
ylabel('amplitude')

%Transform of current in each column
FT_I1 = fft(Iout(1,1:L));
FT_I2 = fft(Iout(2,1:L));
FT_I3 = fft(Iout(3,1:L));
FT_I4 = fft(Iout(4,1:L));
FT_I5 = fft(Iout(5,1:L));
FT_I6 = fft(Iout(6,1:L));
FT_I7 = fft(Iout(7,1:L));
FT_I8 = fft(Iout(8,1:L));

%Plotting FT I1
freq = Fs*(0:(L/2))/L;              
P2_FT_I1 = abs(FT_I1/L);
P1_FT_I1 = P2_FT_I1(1:L/2+1);
P1_FT_I1(2:end-1) = 2*P1_FT_I1(2:end-1);
subplot(2,4,1)
bar(freq,P1_FT_I1)
title('Fourier Transform of I1')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 150])
grid on;
grid minor;

%Plotting FT I2
freq = Fs*(0:(L/2))/L;              
P2_FT_I2 = abs(FT_I2/L);
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

%Plotting FT I3
freq = Fs*(0:(L/2))/L;              
P2_FT_I3 = abs(FT_I3/L);
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

%Plotting FT I4
freq = Fs*(0:(L/2))/L;              
P2_FT_I4 = abs(FT_I2/L);
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

%Plotting FT I5
freq = Fs*(0:(L/2))/L;              
P2_FT_I5 = abs(FT_I5/L);
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

%Plotting FT I6
freq = Fs*(0:(L/2))/L;              
P2_FT_I6 = abs(FT_I6/L);
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

%Plotting FT I7
freq = Fs*(0:(L/2))/L;              
P2_FT_I7 = abs(FT_I2/L);
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

%Plotting FT I8
freq = Fs*(0:(L/2))/L;              
P2_FT_I8 = abs(FT_I8/L);
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


%Use fourier transform to compute estimate for new conductance matrix
G_fourier(1:8,1) = P1_FT_I1(2:9);
G_fourier(1:8,2) = P1_FT_I2(2:9);
G_fourier(1:8,3) = P1_FT_I3(2:9);
G_fourier(1:8,4) = P1_FT_I4(2:9);
G_fourier(1:8,5) = P1_FT_I5(2:9);
G_fourier(1:8,6) = P1_FT_I6(2:9);
G_fourier(1:8,7) = P1_FT_I7(2:9);
G_fourier(1:8,8) = P1_FT_I8(2:9);

figure
heatmap(G);
title('Real Conductance Matrix')
figure
heatmap(G_fourier);
title('Estimated Conductance Matrix with Fourier Transform')


%Calculate new current from conductance matrix
Iout_1 = G_fourier'*Vin;

%Find error between 'measured' current and 'guessed' current
error_1 = Iout_1 - Iout;
mean_error_1 = zeros(8,8);
for k = 1:8 
mean_error_1 (k,1:8) = mean(error_1,2);
end

%Correct conductance by adding/subtracting error to conductance
G_1 = G_fourier - mean_error_1;

%2nd iteration
Iout_2 = G_1'*Vin;
error_2 = Iout_2 - Iout_1;
mean_error_2 = zeros(8,8);
for k = 1:8 
mean_error_2 (k,1:8) = mean(error_2,2);
end
G_2 = G_1 - mean_error_2;

%3rd iteration
Iout_3 = G_2'*Vin;
error_3 = Iout_3 - Iout_2;
mean_error_3 = zeros(8,8);
for k = 1:8 
mean_error_3 (k,1:8) = mean(error_3,2);
end
G_3 = G_2 - mean_error_3;

%4th iteration
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