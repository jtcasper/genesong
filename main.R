#source script for DNA music project
#
rm(list=ls())
setwd("C:/Users/Jacob Casper/Desktop/genesong/")

#required packages
library(tuneR)
library("Biostrings")

#define constants

#sample rate
rate = 8000

#sixteen note
t_sixteenth = seq(0, 0.5, 1/rate)

#quarter note
t_quarter = seq(0, 1, 1/rate)

#half note
t_half = seq(0, 2, 1/rate)

#whole note
t_whole = seq(0, 4, 1/rate)

#pitches
#A3 notes
a3s = (2^15-1)*sin(2*pi*220*t_sixteenth) 
a3q = (2^15-1)*sin(2*pi*220*t_quarter) 
a3h = (2^15-1)*sin(2*pi*220*t_half) 
a3w = (2^15-1)*sin(2*pi*220*t_whole) 
#A Sharp 3 notes
asharp3s = (2^15-1)*sin(2*pi*233.082*t_sixteenth) 
asharp3q = (2^15-1)*sin(2*pi*233.082*t_quarter) 
asharp3h = (2^15-1)*sin(2*pi*233.082*t_half) 
asharp3w = (2^15-1)*sin(2*pi*233.082*t_whole) 
#B3 notes
b3s = (2^15-1)*sin(2*pi*246.942*t_sixteenth) 
b3q = (2^15-1)*sin(2*pi*246.942*t_quarter) 
b3h = (2^15-1)*sin(2*pi*246.942*t_half) 
b3w = (2^15-1)*sin(2*pi*246.942*t_whole) 
#C4 notes
c4s = (2^15-1)*sin(2*pi*261.626*t_sixteenth)
c4q = (2^15-1)*sin(2*pi*261.626*t_quarter)
c4h = (2^15-1)*sin(2*pi*261.626*t_half)
c4w = (2^15-1)*sin(2*pi*261.626*t_whole)
#C Sharp 4 notes
csharp4s = (2^15-1)*sin(2*pi*277.183*t_sixteenth) 
csharp4q = (2^15-1)*sin(2*pi*277.183*t_quarter) 
csharp4h = (2^15-1)*sin(2*pi*277.183*t_half) 
csharp4w = (2^15-1)*sin(2*pi*277.183*t_whole) 

#D4 notes
d4s = (2^15-1)*sin(2*pi*293.665*t_sixteenth)
d4q = (2^15-1)*sin(2*pi*293.665*t_quarter)
d4h = (2^15-1)*sin(2*pi*293.665*t_half)
d4w = (2^15-1)*sin(2*pi*293.665*t_whole)

#D Sharp 4 notes
dsharp4s = (2^15-1)*sin(2*pi*311.127*t_sixteenth) 
dsharp4q = (2^15-1)*sin(2*pi*311.127*t_quarter) 
dsharp4h = (2^15-1)*sin(2*pi*311.127*t_half) 
dsharp4w = (2^15-1)*sin(2*pi*311.127*t_whole) 

#E4 Notes
e4s = (2^15-1)*sin(2*pi*329.628*t_sixteenth)
e4q = (2^15-1)*sin(2*pi*329.628*t_quarter)
e4h = (2^15-1)*sin(2*pi*329.628*t_half)
e4w = (2^15-1)*sin(2*pi*329.628*t_whole)

#F4 Notes
f4s = (2^15-1)*sin(2*pi*349.228*t_sixteenth)
f4q = (2^15-1)*sin(2*pi*349.228*t_quarter)
f4h = (2^15-1)*sin(2*pi*349.228*t_half)
f4w = (2^15-1)*sin(2*pi*349.228*t_whole)

#F Sharp 4 Notes
fsharp4s = (2^15-1)*sin(2*pi*369.994*t_sixteenth) 
fsharp4q = (2^15-1)*sin(2*pi*369.994*t_quarter) 
fsharp4h = (2^15-1)*sin(2*pi*369.994*t_half) 
fsharp4w = (2^15-1)*sin(2*pi*369.994*t_whole) 

#G4 Notes
g4s = (2^15-1)*sin(2*pi*391.995*t_sixteenth)
g4q = (2^15-1)*sin(2*pi*391.995*t_quarter)
g4h = (2^15-1)*sin(2*pi*391.995*t_half)
g4w = (2^15-1)*sin(2*pi*391.995*t_whole)

#G Sharp 4 Notes
gsharp4s = (2^15-1)*sin(2*pi*415.305*t_sixteenth) 
gsharp4q = (2^15-1)*sin(2*pi*415.305*t_quarter) 
gsharp4h = (2^15-1)*sin(2*pi*415.305*t_half) 
gsharp4w = (2^15-1)*sin(2*pi*415.305*t_whole) 

#A4 Notes
a4s = (2^15-1)*sin(2*pi*440.000*t_sixteenth)
a4q = (2^15-1)*sin(2*pi*440.000*t_quarter)
a4h = (2^15-1)*sin(2*pi*440.000*t_half)
a4w = (2^15-1)*sin(2*pi*440.000*t_whole)

#Rest Notes

rss = (2^15-1)*sin(2*pi*0*t_sixteenth)
rsq = (2^15-1)*sin(2*pi*0*t_quarter)
rsh = (2^15-1)*sin(2*pi*0*t_half)
rsw = (2^15-1)*sin(2*pi*0*t_whole)


#waves

#a 3
a3waves = Wave(a3s, samp.rate = rate, bit=16)
a3waveq = Wave(a3q, samp.rate = rate, bit=16)
a3waveh = Wave(a3h, samp.rate = rate, bit=16)
a3wavew = Wave(a3w, samp.rate = rate, bit=16)
#a sharp 3
as3waves = Wave(asharp3s, samp.rate = rate, bit=16)
as3waveq = Wave(asharp3q, samp.rate = rate, bit=16)
as3waveh = Wave(asharp3h, samp.rate = rate, bit=16)
as3wavew = Wave(asharp3w, samp.rate = rate, bit=16)
#b 3
b3waves = Wave(b3s, samp.rate = rate, bit=16)
b3waveq = Wave(b3q, samp.rate = rate, bit=16)
b3waveh = Wave(b3h, samp.rate = rate, bit=16)
b3wavew = Wave(b3w, samp.rate = rate, bit=16)
#c 4
c4waves = Wave(c4s, samp.rate = rate, bit=16)
c4waveq = Wave(c4q, samp.rate = rate, bit=16)
c4waveh = Wave(c4h, samp.rate = rate, bit=16)
c4wavew = Wave(c4w, samp.rate = rate, bit=16)
#c sharp 4
cs3waves = Wave(csharp4s, samp.rate = rate, bit=16)
cs3waveq = Wave(csharp4q, samp.rate = rate, bit=16)
cs3waveh = Wave(csharp4h, samp.rate = rate, bit=16)
cs3wavew = Wave(csharp4w, samp.rate = rate, bit=16)
#d
d3waves = Wave(d4s, samp.rate = rate, bit=16)
d3waveq = Wave(d4q, samp.rate = rate, bit=16)
d3waveh = Wave(d4h, samp.rate = rate, bit=16)
d3wavew = Wave(d4w, samp.rate = rate, bit=16)
#d sharp 4
ds4waves = Wave(dsharp4s, samp.rate = rate, bit=16)
ds4waveq = Wave(dsharp4q, samp.rate = rate, bit=16)
ds4waveh = Wave(dsharp4h, samp.rate = rate, bit=16)
ds4wavew = Wave(dsharp4w, samp.rate = rate, bit=16)
#e4
e4waves = Wave(e4s, samp.rate = rate, bit=16)
e4waveq = Wave(e4q, samp.rate = rate, bit=16)
e4waveh = Wave(e4h, samp.rate = rate, bit=16)
e4wavew = Wave(e4w, samp.rate = rate, bit=16)
#f4
f4waves = Wave(f4s, samp.rate = rate, bit=16)
f4waveq = Wave(f4q, samp.rate = rate, bit=16)
f4waveh = Wave(f4h, samp.rate = rate, bit=16)
f4wavew = Wave(f4w, samp.rate = rate, bit=16)
#f sharp 4
fs4waves = Wave(fsharp4s, samp.rate = rate, bit=16)
fs4waveq = Wave(fsharp4q, samp.rate = rate, bit=16)
fs4waveh = Wave(fsharp4h, samp.rate = rate, bit=16)
fs4wavew = Wave(fsharp4w, samp.rate = rate, bit=16)
#g
g4waves = Wave(g4s, samp.rate = rate, bit=16)
g4waveq = Wave(g4q, samp.rate = rate, bit=16)
g4waveh = Wave(g4h, samp.rate = rate, bit=16)
g4wavew = Wave(g4w, samp.rate = rate, bit=16)
#g sharp 4
as3waves = Wave(gsharp4s, samp.rate = rate, bit=16)
as3waveq = Wave(gsharp4q, samp.rate = rate, bit=16)
as3waveh = Wave(gsharp4h, samp.rate = rate, bit=16)
as3wavew = Wave(gsharp4w, samp.rate = rate, bit=16)
#a 4
a4waves = Wave(a4s, samp.rate = rate, bit=16)
a4waveq = Wave(a4q, samp.rate = rate, bit=16)
a4waveh = Wave(a4h, samp.rate = rate, bit=16)
a4wavew = Wave(a4w, samp.rate = rate, bit=16)

#rest
rswaves = Wave(rss, samp.rate = rate, bit=16)
rswaveq = Wave(rsq, samp.rate = rate, bit=16)
rswaveh = Wave(rsh, samp.rate = rate, bit=16)
rswavew = Wave(rsw, samp.rate = rate, bit=16)



sound = bind(rswavew)
play(sound) #play the wave data by the default player
s <- readDNAStringSet("./sequence.fasta")
subseq(s, start = 18956, end = 18959)

#TODO build dictionaries for all
a4wave <- list(a4waves, a4waveq, a4waveh, a4wavew)
names(a4wave) <- c("a", "t", "c", "g")
string <- "at"
waves <- list(a4wave)
names(waves) <- c("at")
waves[[string]]
set <- waves[[string]]

play(set[["a"]])
