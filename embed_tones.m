%embed_tones.m
%uses the character encoding scheme to embed frequencies representing the
%corresponding letters into the given sound file
load("chars.mat");

%define amplitude
amp = .02;

%define time step between embeddings
t_step = .2;

%data and sampling rate returned by audioread
[data,Fs] = audioread("ece351Sound.wav");

%the message to be embedded
embed_chars = 'Hello World';

%the length of the message
len = length(embed_chars);

%set the initial y_embed value to the original data
y_embed = data;
for i = 1:len
    
    %the character to be encoded
    char = embed_chars(i);

    %if the character is a space, do nothing
    if(char == ' ')
        
    else
        %set freq to the corresponding frequency for the character
        freq = chars.(char);

        %set y_embed to the return of embedTone
        %embedTone receives the y_embed(:,1), frequency, amplitude, and the
        %start time of the embedding. y_embed(:,1) is used as there are 2
        %channels in the .wav file and we just want to use one.
        y_embed = embedTone(y_embed(:,1),Fs,freq,amp,i*t_step);
    end
end
%normalize the data because it was clipping initially
y_embed = y_embed./max(abs(y_embed));

%audiowrite receives a filename, data, and sampling rate, then saves the
%audio file
audiowrite("soundFreqsEmbedded.wav",y_embed(:,1),Fs);
