%script to call AM

%mod_ind = 2;
mod_ind = 0.01:0.2:1;
fm = 10;
%fm = 2:10:100;

for i = 1:length(mod_ind)
    am = AM(mod_ind(i),fm);
    sound(am,44100);
    pause
end