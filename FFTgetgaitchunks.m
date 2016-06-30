function out = FFTgetgaitchunks(dats_sig,fact)

out = struct('min1',{},'min2',{},'min3',{},'min4',{},'min5',{},'min6',{});

Fs = 30;

% Chnage time, if minute-minute extraction not required
strt_tym(1) = 1001;
strt_tym(2) = 2001;
strt_tym(3) = 3601;
strt_tym(4) = 5401;
strt_tym(5) = 7201;
strt_tym(6) = 9501;

end_tym(1) = 2000;
end_tym(2) = 3600;
end_tym(3) = 5400;
end_tym(4) = 7200;
end_tym(5) = 9000;
end_tym(6) = 10500;


k_sig = dats_sig(:,1).^2 + dats_sig(:,2).^2 + dats_sig(:,3).^2;
n = 1024;

w =[0.07 0.2];
[b,a] = butter(10,w,'bandpass');

mk_sig = filtfilt(b,a,k_sig);

fft_sig = abs(fft(mk_sig,n));
fft_sig = fft_sig(1:n/2);

loc = find(fft_sig == max(fft_sig), 1 );

freq = loc*Fs/(2*n);
Ts = 1/Fs;

sampls = 1/(Ts*freq);

chnk_size = fact*sampls;


temp_1 = dats_sig(strt_tym(1):end_tym(1),:);
temp_2 = dats_sig(strt_tym(2):end_tym(2),:);
temp_3 = dats_sig(strt_tym(3):end_tym(3),:);
temp_4 = dats_sig(strt_tym(4):end_tym(4),:);
temp_5 = dats_sig(strt_tym(5):end_tym(5),:);
temp_6 = dats_sig(strt_tym(6):end_tym(6),:);

segs_1 = getchunks(temp_1,chnk_size);
segs_2 = getchunks(temp_2,chnk_size);
segs_3 = getchunks(temp_3,chnk_size);
segs_4 = getchunks(temp_4,chnk_size);
segs_5 = getchunks(temp_5,chnk_size);
segs_6 = getchunks(temp_6,chnk_size);

out = struct('min1',{segs_1},'min2',{segs_2},'min3',{segs_3},'min4',{segs_4},'min5',{segs_5},'min6',{segs_6});