#source script for DNA music project
#
rm(list=ls())
setwd("C:/Users/Jacob Casper/Desktop/csc530final/")

#required packages
library(tuneR)
library("Biostrings")
rate = 16000
#make a simple sine wave and play
t = seq(0, 3, 1/8000) #times in seconds if sample for 3 seconds at 8000Hz
a = (2^15-1)*sin(2*pi*440*t) #440 Hz sine wave that lasts t length seconds (here, 3 seconds)
c = (2^15-1)*sin(2*pi*261.626*t)
e = (2^15-1)*sin(2*pi*329.628*t)
g = (2^15-1)*sin(2*pi*391.995*t)
c5 = (2^15-1)*sin(2*pi*523.251*t)
awave = Wave(a, samp.rate = rate, bit=16) #make the wave variable
cwave = Wave(c, samp.rate = rate, bit=16)
ewave = Wave(e, samp.rate = rate, bit=16)
gwave = Wave(g, samp.rate = rate, bit=16)
c5wave = Wave(c5, samp.rate = rate, bit=16)
sound = bind(cwave, ewave, gwave, c5wave, gwave, ewave, cwave)
play(sound) #play the wave data by the default player
s <- readDNAStringSet("./sequence.fasta")
subseq(s, start = 18956, end = 18959)
