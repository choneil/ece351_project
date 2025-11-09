%all_freq_conv.m
%loads the character encoding struct, reads the sound file, uses wavelet
%convolution function to see if any of the frequencies mapped to the
%characters are present in the sound file, plots results

%load character to frequency encoding scheme
load('chars.mat');

%data and Fs are returned by audioread. Fs is sampling rate.
[data, Fs] = audioread('soundFreqsEmbedded.wav');

%to access the struct
fnames = fieldnames(chars);

%num elements in fnames
n = numel(fnames);

%charMap has uppercase letters and lowercase letters but the frequencies
%are the same for 'A' and 'a'
n = n/2;

%create an array of [length of audio sample data x number of frequecies]
y_decode = zeros(length(data):n);
for i = 1:n

   %y_decode is all data elements for sample length of column i
   y_decode(:,i) = data;
   
   %freq is the frequency denoted by the character[i]
   freq = chars.(fnames{i});

   %call wavelet convolution and update current column with the return
   y_decode(:,i)= waveletConv(freq,Fs,y_decode(:,i));

   %check your variance
  if(var(y_decode(:,i))>1)

      %if variance is above 1, format plot to show the frequency and
      %corresponding letter, and plot the real values of y_decode
      displayname = string(freq) + "Hz " + fnames(i);
      plot(real(y_decode(:,i)),'DisplayName',displayname);

      %keep the plotted data plotted
      hold on;
  end

end
legend show

