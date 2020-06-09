%testing for fourier signals on memristor crossbar array
f = 20;
%100 samples
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 100;              % Length of signal   NB: MUST be power of 2
t = (0:L-1)*T;        % Time vector (100 samples, from 0:0.001:0.099)
n = 1;
%set up input sequence of voltages being 
%required to take samples of sine wave and load into larger dimension
%array = [8x100]

v1 = sin(2*pi*f*t*n);
v2 = sin(2*pi*f*t*(n+1));
v3 = sin(2*pi*f*t*(n+2));
v4 = sin(2*pi*f*t*(n+3));
v5 = sin(2*pi*f*t*(n+4));
v6 = sin(2*pi*f*t*(n+5));
v7 = sin(2*pi*f*t*(n+6));
v8 = sin(2*pi*f*t*(n+7));

Vin = zeros(8,100); %Please parametrise the number of columns of this, and make it 2^M
Vin(1,1:100) = v1;
Vin(2,1:100) = v2;
Vin(3,1:100) = v3;
Vin(4,1:100) = v4;
Vin(5,1:100) = v5;
Vin(6,1:100) = v6;
Vin(7,1:100) = v7;
Vin(8,1:100) = v8;

G = zeros(8,8);
%{
load 100 Ohm resistors (known resistance) into array[8x8]
for i=1:8
    for j=1:8
        G(i,j) = 100;
    end
end
%}
G = randi(1000,8,8);
figure
heatmap(G);
title('Real Conductance Matrix')

%calculating for current
%transpose as column 1 resistors are multiplied by the corresponding
%current at each node at time instances
Iout = G'*Vin;
figure
plot(t,Iout(1,1:100));
title('column 1 current')
xlabel('time')
ylabel('amplitude')

FT_I1 = fft(Iout(1,1:100));
FT_I2 = fft(Iout(2,1:100));
FT_I3 = fft(Iout(3,1:100));
FT_I4 = fft(Iout(4,1:100));
FT_I5 = fft(Iout(5,1:100));
FT_I6 = fft(Iout(6,1:100));
FT_I7 = fft(Iout(7,1:100));
FT_I8 = fft(Iout(8,1:100));

%Plotting FT I1
freq = Fs*(0:(L/2))/L;              
P2_FT_I1 = abs(FT_I1/L);
P1_FT_I1 = P2_FT_I1(1:L/2+1);
P1_FT_I1(2:end-1) = 2*P1_FT_I1(2:end-1);
figure
subplot(2,4,1)
bar(freq,P1_FT_I1)
title('Single-Sided Fourier Transform of I1')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I2
freq = Fs*(0:(L/2))/L;              
P2_FT_I2 = abs(FT_I2/L);
P1_FT_I2 = P2_FT_I2(1:L/2+1);
P1_FT_I2(2:end-1) = 2*P1_FT_I2(2:end-1);
subplot(2,4,2)
bar(freq,P1_FT_I2)
title('Single-Sided Fourier Transform of I2')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I3
freq = Fs*(0:(L/2))/L;              
P2_FT_I3 = abs(FT_I3/L);
P1_FT_I3 = P2_FT_I3(1:L/2+1);
P1_FT_I3(2:end-1) = 2*P1_FT_I3(2:end-1);
subplot(2,4,3)
bar(freq,P1_FT_I3)
title('Single-Sided Fourier Transform of I3')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I4
freq = Fs*(0:(L/2))/L;              
P2_FT_I4 = abs(FT_I2/L);
P1_FT_I4 = P2_FT_I4(1:L/2+1);
P1_FT_I4(2:end-1) = 2*P1_FT_I4(2:end-1);
subplot(2,4,4)
bar(freq,P1_FT_I4)
title('Single-Sided Fourier Transform of I4')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I5
freq = Fs*(0:(L/2))/L;              
P2_FT_I5 = abs(FT_I5/L);
P1_FT_I5 = P2_FT_I5(1:L/2+1);
P1_FT_I5(2:end-1) = 2*P1_FT_I5(2:end-1);
subplot(2,4,5)
bar(freq,P1_FT_I5)
title('Single-Sided Fourier Transform of I5')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I6
freq = Fs*(0:(L/2))/L;              
P2_FT_I6 = abs(FT_I6/L);
P1_FT_I6 = P2_FT_I6(1:L/2+1);
P1_FT_I6(2:end-1) = 2*P1_FT_I6(2:end-1);
subplot(2,4,6)
bar(freq,P1_FT_I6)
title('Single-Sided Fourier Transform of I6')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I7
freq = Fs*(0:(L/2))/L;              
P2_FT_I7 = abs(FT_I2/L);
P1_FT_I7 = P2_FT_I7(1:L/2+1);
P1_FT_I7(2:end-1) = 2*P1_FT_I7(2:end-1);
subplot(2,4,7)
bar(freq,P1_FT_I7)
title('Single-Sided Fourier Transform of I7')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Plotting FT I8
freq = Fs*(0:(L/2))/L;              
P2_FT_I8 = abs(FT_I8/L);
P1_FT_I8 = P2_FT_I8(1:L/2+1);
P1_FT_I8(2:end-1) = 2*P1_FT_I8(2:end-1);
subplot(2,4,8)
bar(freq,P1_FT_I8)
title('Single-Sided Fourier Transform of I8')
xlabel('f (Hz)')
ylabel('|P1(f)|')
xlim([0 200])

%Use fourier transform to compute estimate for new conductance matrix
G_fourier(1:8,1) = P1_FT_I1(3:2:17);
G_fourier(1:8,2) = P1_FT_I2(3:2:17);
G_fourier(1:8,3) = P1_FT_I3(3:2:17);
G_fourier(1:8,4) = P1_FT_I4(3:2:17);
G_fourier(1:8,5) = P1_FT_I5(3:2:17);
G_fourier(1:8,6) = P1_FT_I6(3:2:17);
G_fourier(1:8,7) = P1_FT_I7(3:2:17);
G_fourier(1:8,8) = P1_FT_I8(3:2:17);
figure
heatmap(G_fourier)
title('Estimated Conductance Matrix with Fourier Transform')

%Calculate new current from conductance matrix
Iout_1 = G_fourier'*Vin;

%Find error between 'measured' current and 'guessed' current (square?)
Error_1 = Iout_1 - Iout;

%Correct conductance by adding/subtracting error to conductance
G_1 = G_fourier - Error_1;

%2nd iteration
Iout_2 = G_1'*Vin;
Error_2 = Iout__2 - Iout_1;
G_2 = G_1 - Error_2;

%3rd iteration
Iout_3 = G_2'*Vin;
Error_3 = Iout__3 - Iout_2;
G_3 = G_2 - Error_3;

%4th iteration
Iout_4 = G_3'*Vin;
Error_4 = Iout__4 - Iout_3;
G_4 = G_3 - Error_4;

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