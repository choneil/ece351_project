function y = waveletConv(freq, Fs, data)
    fwhm = .1;
    dur = 0.1;
    len = round(dur*Fs);
    len_t = (0:len-1)/Fs;
    gaussian = exp(-(4*log(2)*len_t.^2)/fwhm^2);
    wavelet = exp(1i*2*pi*freq*len_t).*real(gaussian);   
    c = conv(data, flipud(wavelet), 'same');
    y=c;
    
end
