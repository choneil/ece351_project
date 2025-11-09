%embed_tones.m

load("chars.mat");
[data,Fs] = audioread("ece351_sound.wav");
size(data)
embed_chars = 'Hello World';
len = length(embed_chars);
y_embed = data;
for i = 1:len

    char = embed_chars(i);
    if(char == ' ')
        
    else
        freq = chars.(char);
        y_embed = embedTone(y_embed(:,1),Fs,freq,.01,i*.2);
    end
end
y_embed = y_embed./max(abs(y_embed));
audiowrite("embedded_hello.wav",y_embed(:,1),Fs);