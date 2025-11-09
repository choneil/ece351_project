function y_out = embedTone(y, Fs, toneFreq, toneAmp, time)
    startTime = time;
    dur = 0.05;
    y = y(:);
    N = length(y);
    t = (0:N-1)/Fs;
     tone = zeros(N,1);
    idx = (t>= startTime) & (t < startTime + dur);
    tb = t(idx);
    tone(idx) = toneAmp * sin(2*pi*toneFreq.*tb).';
    y_out = y + tone;

end
