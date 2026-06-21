# Appendix B — Glossary

Quick definitions of the key terms used in this book. Chapter references point to
where each is explained in depth.

**A/D converter (ADC)** — Analog-to-digital converter; turns the analog voltage
from a mic/instrument into digital samples. (Ch. 2)

**AAC** — Advanced Audio Coding; a lossy format with better quality than MP3 at
the same bitrate; standard on Apple Music/YouTube. (Ch. 3)

**Aliasing** — False, lower frequencies created when a signal contains content
above the Nyquist frequency; prevented by an anti-aliasing filter. (Ch. 2)

**Amplitude** — The size of a sound wave's pressure swing; perceived as loudness.
(Ch. 1)

**Bit depth** — How precisely each sample's amplitude is measured; determines
dynamic range (~6 dB per bit). 16-bit ≈ 96 dB, 24-bit ≈ 144 dB. (Ch. 2)

**Bitrate** — Data per second (kbps) in a lossy file; higher = better quality &
bigger files. (Ch. 3)

**Bus** — A track other tracks feed into, for processing a group together (e.g.,
a drum bus). In REAPER, often a track folder's parent. (Ch. 10, 12)

**Cabinet (cab)** — The speaker + enclosure that filters and colors an amp's
output; a strong, characterful, **linear** filter. (Ch. 6)

**Clipping** — Flattening a wave's peaks past a system's limit; mathematically
identical to adding harmonics (= distortion). Digital clipping above 0 dBFS is
harsh/broken. (Ch. 2, 5)

**Compression (data)** — Making a file smaller; lossless (reversible) or lossy
(discards data). (Ch. 3)

**Compression (dynamics)** — An effect that reduces the level difference between
loud and quiet parts. (Ch. 10)

**Convolution** — The math operation that applies an IR to a signal, "stamping"
the captured system's character onto it. (Ch. 7)

**dBFS** — Decibels relative to Full Scale; digital level where **0 = the
ceiling** and values count down (negative). (Ch. 2)

**Decibel (dB)** — A logarithmic ratio unit for level/loudness. (Ch. 1)

**De-esser** — A frequency-targeted compressor that ducks sibilance (~5–9 kHz).
(Ch. 10)

**Delay** — An effect that repeats the signal after a set time; adds echo/width.
(Ch. 10)

**Dither** — Tiny shaped noise added when reducing bit depth, to avoid
quantization distortion; applied **once** at final export. (Ch. 2)

**Dynamic range** — The span between the quietest and loudest a system handles;
set by bit depth in digital. (Ch. 2)

**Envelope** — How a sound's loudness evolves over time: attack, decay, sustain,
release. (Ch. 1)

**EQ (equalization)** — Boosting/cutting bands of frequencies; a **linear**
process. (Ch. 9)

**FLAC** — Free Lossless Audio Codec; lossless compression to ~half of WAV size.
(Ch. 3)

**Frequency** — Cycles per second (Hz); perceived as pitch. Human hearing ≈
20 Hz–20 kHz. (Ch. 1)

**Fundamental** — The lowest frequency of a note, which sets its perceived pitch.
(Ch. 1)

**Gain staging** — Setting levels through a chain; in amps, cascading multiple
gain stages to build controllable distortion. (Ch. 5)

**Gate (noise gate)** — Silences/attenuates signal below a threshold; kills
high-gain noise and bleed. (Ch. 10)

**Haas effect** — A copy delayed under ~40 ms is heard as width/thickness, not a
separate echo. (Ch. 10)

**Harmonics (overtones)** — Frequencies above the fundamental (near-integer
multiples); their balance is **timbre**. Distortion *adds* harmonics. (Ch. 1, 5)

**Headroom** — The gap between your signal's peaks and 0 dBFS; record with
~12–18 dB of it. (Ch. 2)

**High-pass filter (HPF) / low-cut** — Removes frequencies below a chosen point;
the most-used mixing move. (Ch. 9)

**Impulse Response (IR)** — A recording of a **linear** system's response to an
impulse; an acoustic fingerprint of a cab+mic+room. Applied via convolution.
(Ch. 7)

**Insert** — An effect placed directly in a channel (whole signal passes
through); vs. a send. (Ch. 10)

**Latency** — Delay through the recording system; reduced with smaller buffer
sizes. (Ch. 12)

**Limiter** — A compressor with very high ratio/fast attack that caps peaks at a
ceiling. (Ch. 10)

**Linear / Nonlinear** — Linear = changes level/frequency balance, adds no new
frequencies (EQ, cabinets). Nonlinear = creates new harmonics (distortion,
preamps). Determines IR vs. NAM. (Ch. 5, 7)

**Lossless / Lossy** — Lossless keeps all audio data (WAV/FLAC); lossy discards
some permanently (MP3/AAC/Opus). (Ch. 3)

**Low-pass filter (LPF) / high-cut** — Removes frequencies above a chosen point;
tames fizz/harshness. (Ch. 9)

**LUFS** — Loudness Units Full Scale; the loudness measure streaming platforms
normalize to (~ -14 LUFS). (Ch. 3)

**MIDI** — Note/performance data (not audio) that drives virtual instruments;
fully editable after recording. (Ch. 12)

**Modulation effects** — Chorus, flanger, phaser, tremolo, vibrato; use an LFO
for movement/width. (Ch. 10)

**MP3** — The original mass-market lossy format; universally compatible. (Ch. 3)

**NAM (Neural Amp Modeler)** — Free, open-source tool that captures **nonlinear**
amps/pedals/chains by training a neural network on input→output audio. (Ch. 8)

**Nyquist frequency** — Half the sample rate; the highest frequency a given rate
can capture. (Ch. 2)

**Nyquist–Shannon theorem** — You must sample at >2× the highest frequency to
capture it; basis of the 44.1 kHz standard. (Ch. 2)

**Opus** — Modern open lossy codec; best quality at low/mid bitrates; common for
voice/streaming. (Ch. 3)

**PCM (Pulse Code Modulation)** — The basic scheme of storing audio as a stream
of sampled amplitude values; underlies WAV/AIFF/CDs. (Ch. 2, 3)

**Phase** — The timing alignment of waves; aligned waves reinforce, opposed waves
cancel. (Ch. 1)

**Preamp** — First amplification stage; boosts and tone-shapes, and (driven)
adds the amp's distortion character. (Ch. 5)

**Pre-delay** — The gap before a reverb's tail starts; keeps the dry source
clear. (Ch. 10)

**Profiling** — Capturing a real amp's sound by analysis (NAM; commercially,
Kemper). (Ch. 8)

**Q** — A bell filter's bandwidth; low Q = wide, high Q = narrow. (Ch. 9)

**Quantization error** — Rounding error from limited bit depth; heard as
distortion on quiet passages; mitigated by dither. (Ch. 2)

**Reverb** — Simulates a space's reflections; adds depth/ambience. (Ch. 10)

**Sample / Sample rate** — A single amplitude measurement / how many per second
(Hz). 44.1 kHz = 44,100/sec. (Ch. 2)

**Saturation** — Gentle harmonic distortion for warmth/density/translation.
(Ch. 10)

**Send (aux)** — A copy of a channel routed to a separate FX track (e.g., shared
reverb). (Ch. 10, 12)

**Shelf filter** — Boosts/cuts everything above (high shelf) or below (low shelf)
a frequency. (Ch. 9)

**Sibilance** — Harsh "s"/"sh" energy (~5–9 kHz); tamed with a de-esser. (Ch.
9, 10)

**Sine wave** — A single pure frequency; the building block of all sound; sounds
"electronic." (Ch. 1)

**Slapback** — A single short echo (~80–120 ms) for thickening. (Ch. 10)

**Timbre** — Tone color; determined by the harmonic recipe and envelope. (Ch. 1)

**Threshold** — The level at which a dynamics processor (comp/gate) starts
acting. (Ch. 10)

**WAV / AIFF** — Uncompressed PCM containers; the working/master format. (Ch. 3)

[← Appendix A](appendix-a-frequency-chart.md) | [Back to Index](../README.md) | [Next: Appendix C — Sources →](appendix-c-sources.md)
