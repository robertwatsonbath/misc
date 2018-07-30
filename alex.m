clear vars;

% N (1M) samples in delta (1us) steps
Nsamp=2^20;
deltat=1e-6;
t=0:deltat:(Nsamp-1)*deltat;
% sample frequency;
fs=1./deltat;

% Frequency in Hz of thing to be generated (110kHz)
f=110e3;

% simple cosine wave +1/-1
s=cos(2*pi*f*t);

% generate frequency axis (-fs/2 to +fs/2)
freq=linspace(-0.5.*fs, +0.5.*fs, Nsamp);

% window function
w=window(@blackmanharris, Nsamp);

% generate a centred fft, plot and print
fig=figure;
plot(freq,10*log10(abs(fftshift(fft(w'.*s)))./fs));
xlabel('Frequency [Hz]');
ylabel('Power spectral density [dB/Hz]')
print(fig,'alex.pdf','-dpdf');

