%embedTone.m
%inputs: y-data from audio, Fs-audio sampling rate, tonFreq-the frequency
%of the tone to be embedded, toneAmp-the amplitude of the tone to be
%embedded, time- the start time of the embedding.

%outputs y_out
function y_out = embedTone(y, Fs, toneFreq, toneAmp, time)
    
    startTime = time;

    %duration of the embedded tone
    dur = 0.05;
    
    %number of samples in y
    N = length(y);

    %time is the the number of samples/sampling frequency
    t = (0:N-1)/Fs;

    %allocate for the tone: [number of samples x 1]
    tone = zeros(N,1);
    
    %index is between start time and start time + duration
    idx = (t>= startTime) & (t < startTime + dur);

    %tb is t only within the boundaries denoted by idx
    tb = t(idx);

    %the values of tone within the boundaries are set to the sine given by
    %the provided amplitude and frequency.
    tone(idx) = toneAmp * sin(2*pi*toneFreq.*tb);

    %add the created tone to the existing sound and return the result
    y_out = y + tone;

end
