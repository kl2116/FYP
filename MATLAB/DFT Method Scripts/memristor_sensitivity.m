%testing for fourier signals on memristor crossbar array
f = 20;
%100 samples
Fs = 1000;            % Sampling frequency                    
T = 1/Fs;             % Sampling period       
L = 100;              % Length of signal
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

Vin = zeros(8,100);
Vin(1,1:100) = v1;
Vin(2,1:100) = v2;
Vin(3,1:100) = v3;
Vin(4,1:100) = v4;
Vin(5,1:100) = v5;
Vin(6,1:100) = v6;
Vin(7,1:100) = v7;
Vin(8,1:100) = v8;
G = zeros(8,8);

%load 100 Ohm resistors (known resistance) into array[8x8]
for i=1:8
    for j=1:8
        G(i,j) = 100;
    end
end

H = G;
H(2,4)= 1000;


Iout = G'*Vin;
Iout_comparison = H'*Vin;
figure
heatmap(Iout);
title('Heatmap of Iout')
figure
heatmap(Iout_comparison)
title('Heatmap of changed conductance array')
figure
heatmap(G);
title('Heatmap of G Matrix')
figure
heatmap(H);
title('Heatmap of H Matrix')

