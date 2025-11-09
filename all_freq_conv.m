load('chars.mat');
[data, Fs] = audioread('soundFreqsEmbedded.wav');
fnames = fieldnames(chars);
n = numel(fnames);
n = n/2;
y_decode = zeros(length(data):n);
for i = 1:n
   y_decode(:,i) = data;
   freq = chars.(fnames{i});
   y_decode(:,i)= waveletConv(freq,Fs,y_decode(:,i));
   var(y_decode(:,i));
  if(var(y_decode(:,i))>1)
      displayname = string(freq) + "Hz " + fnames(i);
      plot(real(y_decode(:,i)),'DisplayName',displayname);
      hold on;
  end

end
legend show
% y = wavelet_conv(20700, Fs, data);
% var(y)

% plot(real(y))
