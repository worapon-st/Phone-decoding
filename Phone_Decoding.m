clear all; close all;

%Load data
[x, fs] = audioread('D:\PROJECT2\DialTone.wav') ;

%Samping in Time Domain
N = length(x) ;
n = 0:N-1 ;
dt = 1/fs ;
t = n*dt ;

%Transpose (Frequency) Row to Column 
tx = [] ;
for i = 1:1:N-204
    tx(:,i) = x(i:i+204) ;
end

%Sampling in frequency Domain
Ndft = 205 ;
k = 0:Ndft-1 ;
df = fs/Ndft ;
f = k*df ;
%Fourier Time to Frequency domain to find Spectrum
xf = fft(tx, Ndft) ;

%visualization
figure(1)
subplot(211);
plot(t, x);
xlabel('Time [sec]');   ylabel('Amplitude');

subplot(212);
plot(f, abs(xf))
axis([0 fs/2 0 inf])
xlabel('Frequency [Hz]');   ylabel('Amplitude');

figure(2)
imagesc(t, f, abs(xf)) ;
xlabel('Time [sec]');   ylabel('Frequency [Hz]');
colorbar ;
