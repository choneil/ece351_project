%waveletConv.m
%inputs: freq- the frequency we are searching for, Fs- sampling rate, data-
%the sound file data

%outputs: y- the result of the convolution between the wavelet and the data

%reference for the wavelet creation: https://www.youtube.com/watch?v=LMqTM7EYlqY&t=183s

function y = waveletConv(freq, Fs, data)
    %full-width at half maximum of the gaussian envelope used to define the
    %wavelet. this is set to the width of the burst length of the embedded
    %frequency as that seemed to acheive the best results
    fwhm = .05;

    %duration of the wavelet to be used is set to slightly longer than the
    %fwhm
    dur = .075;
    
    %sample length is the duration times the sampling rate
    len = dur*Fs;

    %time length defined for the gaussian and wavelet
    len_t = (0:len-1)/Fs;

    %gaussian defined by the reference youtube video
    gaussian = exp(-(4*log(2)*len_t.^2)/fwhm^2);

    %wavelet defined by the reference youtube video
    wavelet = exp(1i*2*pi*freq*len_t).*real(gaussian);  

    %convolution of data and wavelet of the 'same' size as data.
    %the wavelet is not flipped as it is symmetric and it is the function
    %which is slid across the stationary function in convolution.
    c = conv(data, wavelet, 'same');

    %return the convolution
    y=c;
    
end
