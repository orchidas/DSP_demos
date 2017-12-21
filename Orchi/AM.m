function [am] = AM(mod_ind, fm)
%AM demo with modulation index and modulation frequency

%carrier amplitude
Ac = 5;
%carrier frequency
fc = 200;
%sampling rate
fs = 44100;
%time duration
dur = 2;
%time vector
t = linspace(0,dur,fs*dur);
%t = 0:1/fs:dur;
car = Ac * sin(2*pi*fc*t);
%modulation signal
mod = sin(2*pi*fm*t);
%AM signal
am = (1+mod_ind*mod).*car;

figure(1);
subplot(3,1,1);
plot(t, car);title('Carrier signal');
subplot(3,1,2);
plot(t,mod);title('Modulation signal');
subplot(3,1,3);
plot(t,am);title('AM');


end

