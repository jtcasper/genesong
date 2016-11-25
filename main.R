#source script for DNA music project
#
rm(list=ls())
setwd("C:/Users/Jacob/Desktop/Ovipository/genesong")

#required packages
library(tuneR)
library("Biostrings")

#define constants

#octave multipler. 0 = start at a3, 1 = start at a4, ...
octave = 1

#pitches
pitches <- list(220.000*(2^octave), 233.082*(2^octave), 246.942*(2^octave), 261.626*(2^octave),
                277.183*(2^octave), 293.665*(2^octave), 311.127*(2^octave), 329.628*(2^octave),
                349.228*(2^octave), 369.994*(2^octave), 391.995*(2^octave), 415.305*(2^octave),
                440.000*(2^octave), 0, 0, 0)
names(pitches) <- c("AA", "AT", "AC", "AG", "TA", "TT", "TC", "GG",
                    "CA", "CT", "CC", "CG", "GA", "GT", "GC", "GG")

#sample rate
rate = 8000

#bpm 1 = 60 bpm 2 = 120 bpm, ...
bpm = 4

#sixteen beat
t_sixteenth = seq(0, 0.5/bpm, 1/rate)

#quarter beat
t_quarter = seq(0, 1/bpm, 1/rate)

#half beat
t_half = seq(0, 2/bpm, 1/rate)

#whole beat
t_whole = seq(0, 4/bpm, 1/rate)

beats <- list(t_sixteenth, t_quarter, t_half, t_whole)
names(beats) <- c("A", "T", "C", "G")

#chords

chords <- list(0, 1, 2, 3)
names(chords) <- c("A", "T", "C", "G")

parsePitch <- function(sequence){
#  charseq <- as.character(sequence)
  note <- substr(sequence, start= 1, stop= 2)
  length <- substr(sequence, start= 3, stop= 3)
  chord <- substr(sequence, start= 4, stop=4)
  pitch <- pitches[[note]]
  beat <- beats[[length]]
  chord_type <- chords[[chord]]
  
  
  wave <- Wave((2^15-1)*sin(2*pi*pitch*beat), samp.rate = rate, bit=16)
  if(chord_type > 0){
    #major third
    pitch2 <- 0
    pitch3 <- 0
    if(chord_type == 1){
      pitch2 <- wave * (5/4)
    }
    #minor third
    else if(chord_type == 2){
      pitch2 <- wave * (6/5)
      
    }
    #major chord == 3
    else {
      pitch2 <- wave * (5/4)
      pitch3 <- wave * (3/2)
    }
    wave <- wave + pitch2 + pitch3
    wave <- normalize(wave, unit = "16")
  }
  return(wave)
}

#u = (2^15-1)*sin(2*pi*440*t_whole) #440 Hz sine wave that lasts t length seconds (here, 3 seconds) 
#rswavew = Wave(u, samp.rate = rate, bit=16)
#sound = bind(rswavew)
#play(sound) #play the wave data by the default player


s <- readDNAStringSet("./sequence.fasta")
len <- width(s)
s_str <- as.character(s)
sub <- substr(s_str, start = 1, stop = 4)
song <- parsePitch(sub)
for(i in seq(from=5, to=len-3, by=4)){
  sub <- substr(s_str, start=i, stop=i+3)
  song = bind(song, parsePitch(sub))
  print(i)
  print(i/(len-3))
}
writeWave(song, "out3.wav")
#play(song)
