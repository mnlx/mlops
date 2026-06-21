# Chapter 1 — What Sound Actually Is

Before we talk about kilohertz, codecs or cabinets, we need a shared picture of
what sound *is*. Almost every concept in this book is a consequence of three
ideas: sound is a wave, the wave has a **frequency** and an **amplitude**, and
real instruments produce many frequencies at once. Get these straight and the
rest of the book falls into place.

## 1.1 Sound is moving air

When a guitar string vibrates, it pushes the air next to it, which pushes the
air next to *that*, and so on — a travelling pattern of tiny pressure changes
that eventually reaches your eardrum and pushes it in and out. Your brain
interprets that motion as sound.

A microphone does exactly what your eardrum does: it has a thin diaphragm that
moves with the air pressure, and it turns that motion into a fluctuating
electrical voltage. That voltage is the **analog audio signal** — a continuous
electrical "copy" of the air-pressure wave. Everything downstream (cables,
preamps, converters) is just handling that voltage.

> **Key idea:** audio gear never touches "sound." It handles an *electrical
> representation* of a pressure wave. Quality is about how faithfully each stage
> preserves or intentionally alters that representation.

## 1.2 Frequency — how fast it wiggles (pitch)

**Frequency** is how many times the pressure cycles back and forth per second,
measured in **hertz (Hz)**. One full compression-and-rarefaction per second is
1 Hz. A thousand cycles per second is one **kilohertz (kHz)**.

Frequency is what we perceive as **pitch**:

- Low frequency = low pitch (a bass note, a kick drum).
- High frequency = high pitch (a cymbal, a whistle).

Some anchors worth memorizing:

| Frequency | What it is |
|-----------|------------|
| 20 Hz | The lowest pitch most humans can hear (felt more than heard) |
| ~41 Hz | Low E on a 4-string bass |
| ~82 Hz | Low E on a guitar (open 6th string) |
| 440 Hz | "A above middle C" — the standard tuning reference (A4) |
| 1,000 Hz (1 kHz) | The ear's most sensitive region |
| ~4 kHz | "Presence" / clarity / consonants in speech |
| 20,000 Hz (20 kHz) | The top of human hearing (and it drops with age) |

That **20 Hz – 20 kHz** range is the headline number: it's the span of human
hearing, and it's the reason digital audio is built the way it is (Chapter 2).

Pitch is **logarithmic**, not linear. Every time you *double* the frequency, you
go up one **octave**. 110 Hz, 220 Hz, 440 Hz, 880 Hz are all the note "A," each
an octave apart. This is why audio frequency charts and EQ displays are spaced
logarithmically — equal *musical* steps take equal *visual* space.

## 1.3 Amplitude — how big it wiggles (loudness)

**Amplitude** is how far the pressure swings from rest — the *size* of the wave.
Bigger swings move your eardrum more and you perceive them as **louder**.

Loudness, like pitch, is roughly logarithmic, so we measure it in **decibels
(dB)** — a ratio scale, not an absolute one. A few practical facts:

- +6 dB ≈ "twice the voltage/amplitude."
- +10 dB ≈ "about twice as loud" to human perception.
- The decibel always describes a *ratio* between two levels. In digital audio
  we measure relative to the maximum possible level and call it **dBFS**
  (decibels relative to **F**ull **S**cale), so digital levels are negative
  numbers counting *down* from 0 (the ceiling). More on that in Chapter 2.

The difference between the quietest and loudest sound a system can handle is its
**dynamic range** — a concept that comes back when we discuss bit depth.

## 1.4 Why a piano and a guitar playing the same note sound different

Here's the most important idea in the chapter. Play A2 (110 Hz) on a bass, a
piano and a trumpet — same pitch, completely different sound. Why?

Because real instruments almost never produce a single, pure frequency. A pure
single-frequency tone is a **sine wave**, and it sounds sterile and electronic
(it's the "test tone" beep). Instead, a vibrating string or air column produces
a **fundamental** frequency *plus* a whole series of higher frequencies called
**harmonics** (or **overtones**).

### The harmonic series

The harmonics are (very nearly) integer multiples of the fundamental:

| Harmonic | Frequency (for 110 Hz fundamental) | Musical relationship |
|----------|-----------------------------------|----------------------|
| 1st (fundamental) | 110 Hz | the note itself |
| 2nd | 220 Hz | one octave up |
| 3rd | 330 Hz | octave + a fifth |
| 4th | 440 Hz | two octaves up |
| 5th | 550 Hz | two octaves + a major third |
| ... | ... | ... |

The *pitch* you hear is set by the fundamental. But the *relative loudness of
each harmonic* — which ones are strong, which are weak, how they fade over time
— is what your brain reads as **timbre** (tone color). That recipe of harmonics
is the instrument's sonic fingerprint.

This single idea explains an enormous amount of what's later in the book:

- **EQ** (Chapter 9) works by boosting or cutting *bands* of frequencies —
  it reshapes the harmonic balance.
- **Distortion** in a preamp (Chapter 5) sounds "warm" or "harsh" precisely
  because it *adds new harmonics* that weren't in the original signal.
- A **guitar cabinet** (Chapter 6) sounds the way it does because it *removes*
  certain harmonics — a speaker can't reproduce the very high ones.

## 1.5 The shape of a sound over time: the envelope

Two sounds can have the same pitch and the same harmonics and still differ,
because sound changes *over time*. The **envelope** describes how loudness
evolves from the moment a note starts:

- **Attack** — how fast it reaches full volume (a plucked string is instant; a
  bowed violin swells in).
- **Decay / Sustain** — how it settles and holds.
- **Release** — how it fades after you let go.

A piano has a sharp attack and a long decay; an organ has a slow attack and a
flat sustain. The envelope is why a piano note played backwards sounds nothing
like a piano. Compression (Chapter 10) is, at heart, a tool for *reshaping the
envelope*.

## 1.6 Phase — when waves combine

When two copies of a wave meet, they add together sample-by-sample. If their
peaks line up (**in phase**), they reinforce and get louder. If one's peak meets
the other's trough (**out of phase**), they cancel and get quieter — push it to
a perfect mirror image and they cancel to *silence*.

You don't need the math, but you need the instinct, because phase quietly
governs real situations:

- Two microphones on one guitar cabinet can partially cancel each other,
  thinning the tone, depending on their distance apart.
- A stereo mix collapsed to mono can lose elements that were relying on phase
  differences.
- Convolution and IRs (Chapter 7) are entirely an exercise in adding up
  delayed, phase-shifted copies of a signal.

## Summary

- Sound is a travelling pressure wave; audio gear works on an electrical copy
  of it.
- **Frequency (Hz)** = pitch; human hearing spans ~**20 Hz to 20 kHz**; pitch is
  logarithmic (double the frequency = up one octave).
- **Amplitude** = loudness, measured in **decibels (dB)**, a ratio scale.
- Real instruments produce a **fundamental + harmonics**; the harmonic recipe is
  **timbre**, and reshaping it is what EQ and distortion do.
- The **envelope** (attack/decay/sustain/release) shapes a sound over time.
- **Phase** governs how multiple copies of a wave combine — reinforcing or
  cancelling.

---

> **Try this.** Open any tone-generator app or your DAW's test-tone plugin.
> Play a 110 Hz sine — notice how thin and "electronic" it is. Now play a real
> bass note at the same pitch. The pitch matches, but the bass is rich and alive
> because of its harmonics. That difference *is* timbre, and it's the thing every
> later chapter is trying to capture, preserve, or shape.

[← Back to Index](../README.md) | [Next: Chapter 2 — From Air to Numbers →](02-digital-audio.md)
