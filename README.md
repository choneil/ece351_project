# ece351_project
## overview
This repo contains files to map letters to frequencies and embed a short message in an existing sound file using that encoding scheme. It also has files which use convolution to show where the range of frequencies used in encoding are in the sound file by plotting these convolutions to decode the message. Files which contain only a function are named using 'camel-case' and files used to do something by calling those functions are named using 'snake-case'.

## file descriptions
**ece351Sound.wav** - the sound file used in this repo </br>
**charMap.m** - use a struct to define how letters are mapped to frequency to be encoded. save this mapping to a chars.mat file </br>
**embedTone.m** - function to receive sound data and return sound data with the additional burst of frequency embedded</br>
**waveletConv.m** - function to receive sound data as well as a wavelet and return the convolution of these two</br>
**embed_tones.m** - use the character mapping and a user-defined set of chars. call embedTone for each char</br>
**all_freq_conv.m** - call the waveletConv function for each of the possible encoding frequencies. plot if variance is very high</br>
