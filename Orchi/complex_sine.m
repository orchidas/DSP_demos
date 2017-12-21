t = 0:0.001:100;
y = exp(t*1i*pi/6);

y_real = real(y);
y_imag = imag(y);

figure(1);
subplot(2,1,1);plot(t, y_real);
xlabel('Time in seconds');ylabel('real(y)');
subplot(2,1,2);plot(t, y_imag);
xlabel('Time in seconds');ylabel('imag(y)');

figure(2);
plot3(t, y_real, y_imag);xlabel('Time');ylabel('real');zlabel('imaginary');
