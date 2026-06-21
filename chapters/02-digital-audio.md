# Chapter 2 — From Air to Numbers: Sample Rate & Bit Depth

In Chapter 1 we turned a pressure wave into a continuous electrical voltage. To
get that into a computer we have to turn the smooth, continuous signal into a
list of numbers. That conversion — done by the **A/D converter** (analog-to-
digital) in your audio interface — is defined by two settings you'll choose
every time you start a project: **sample rate** and **bit depth**. This chapter
explains exactly what they mean, the famous **44.1 kHz**, and what to actually
set them to.

## 2.1 Sampling: measuring the wave many times per second

A computer can't store a smooth curve; it stores numbers. So the converter
*measures* the incoming voltage at regular intervals and writes down each value.
Each measurement is a **sample**. The **sample rate** is how many measurements
it takes per second, in hertz.

- **44.1 kHz** means the signal's amplitude is measured **44,100 times every
  second**.
- **48 kHz** means 48,000 times per second.

Play those samples back fast enough through a D/A converter (digital-to-analog,
on the way out to your speakers) and your ear can't tell the staircase of values
from the original smooth wave. This whole scheme is called **PCM** — Pulse Code
Modulation — and it's the foundation of WAV files, CDs, and virtually all
uncompressed digital audio (Chapter 3).

## 2.2 The Nyquist theorem — why 44.1 kHz and not less

How many samples per second do you actually *need*? The answer is one of the
cornerstones of digital audio: the **Nyquist–Shannon sampling theorem** (1940s).

> To perfectly capture a signal, you must sample at **more than twice** the
> highest frequency present in that signal.

The highest frequency a given sample rate can represent is half the sample rate,
called the **Nyquist frequency**.

Now connect it to Chapter 1: human hearing tops out around **20 kHz**. To
capture everything we can hear, we need a sample rate just above 2 × 20 kHz =
**40 kHz**. That's why **44.1 kHz** exists — 40 kHz of audio plus a little extra
room above 20 kHz for the anti-aliasing filter to do its work. At 44.1 kHz the
Nyquist frequency is **22.05 kHz**, comfortably above the limit of hearing.

(The oddly specific *.1* is a historical artifact of how early digital audio was
stored on video tape, but the practical takeaway is simple: 44.1 kHz captures
the full audible band.)

## 2.3 Aliasing — what happens when you don't sample fast enough

If a frequency in the signal is *higher* than the Nyquist frequency, the
converter can't represent it correctly. Instead it gets misread as a *different,
lower* frequency — a false "alias" that wasn't in the original sound. This is
**aliasing**, and it's the digital equivalent of wagon wheels appearing to spin
backwards in old films.

Aliasing sounds bad — inharmonic, metallic, ugly — because the false
frequencies have no musical relationship to the real ones. To prevent it,
converters put an **anti-aliasing filter** (a steep low-pass filter) right
before sampling, removing anything above the Nyquist frequency so it can never
fold back. This is also why you should think about sample rate inside plugins
that generate harmonics (distortion, saturation): they can create frequencies
above Nyquist and alias, which is why such plugins often **oversample**
internally.

## 2.4 Bit depth — how precisely each sample is measured

Sample rate is *how often* we measure. **Bit depth** is *how precisely* we
record each measurement — how many distinct amplitude values are available to
describe the loudness of each sample.

- **16-bit** gives 2¹⁶ = **65,536** possible levels per sample.
- **24-bit** gives 2²⁴ = **16,777,216** possible levels per sample.
- **32-bit float** uses a different scheme (a floating-point number) that gives
  effectively gigantic range — more on that below.

Think of bit depth as the number of "rungs" on the ladder the converter uses to
describe amplitude. More rungs = a finer, more accurate description of quiet
detail. Too few rungs and the smooth wave gets forced onto coarse steps,
introducing **quantization error** — heard as a gritty distortion on quiet
passages.

### Bit depth = dynamic range, not "warmth"

The thing bit depth actually controls is **dynamic range**: the distance between
the loudest possible sample (0 dBFS, the ceiling) and the noise floor.

- 16-bit ≈ **96 dB** of dynamic range.
- 24-bit ≈ **144 dB** of dynamic range (in theory; in practice limited by analog
  noise, but well beyond any room or converter).

A useful rule of thumb: **each bit adds ~6 dB of dynamic range.** More bit depth
does *not* make the sound "higher resolution" in pitch or add detail you can
hear directly — it lowers the noise floor and gives you room to record at safe,
conservative levels without losing quiet detail.

## 2.5 dBFS, headroom and why you record quieter than you think

Digital level is measured in **dBFS** — decibels below Full Scale. **0 dBFS is
the absolute ceiling.** Go above it and samples get **clipped** (flattened at
the maximum), producing harsh digital distortion that is *not* the musical kind
from Chapter 5 — it's just broken.

So when recording you leave **headroom**: aim peaks around **-12 to -18 dBFS**.
This sounds quiet, and beginners instinctively push levels near 0 "to be loud,"
but:

- Loudness is set later, in mixing/mastering — not at the converter.
- 24-bit gives you so much dynamic range that recording at -18 dBFS still leaves
  the noise floor inaudibly low.
- Headroom protects against an unexpectedly loud peak clipping and ruining a
  take.

This is the single most important practical takeaway of the chapter: **record
with healthy headroom.** 24-bit is what makes that free.

## 2.6 32-bit float: the "can't clip" format

Many modern interfaces and field recorders now offer **32-bit float**. Because
of how floating-point numbers work, the usable dynamic range is enormous — so
large that, in practice, you effectively *cannot clip* a 32-bit float recording.
If a peak goes "over 0," the information is still there in the file and you can
simply pull the level back down afterwards with no damage. It's a genuine
convenience for tracking unpredictable sources, at the cost of larger files. For
DAW *processing*, audio is internally handled in 32-bit (or 64-bit) float
anyway, which is why turning a plugin's gain down after a loud one doesn't
destroy the signal.

## 2.7 Dither — the friendly noise

When you *reduce* bit depth (e.g., exporting a 24-bit mix to a 16-bit file for
CD/streaming), the quantization error can become an audible, correlated
distortion on fade-outs and quiet tails. **Dither** is a tiny amount of
carefully shaped random noise added during that bit-depth reduction. It
"randomizes" the error, trading nasty distortion for a far less noticeable,
constant low-level hiss. Rule: **apply dither only once, at the final export to
a lower bit depth.** Don't dither at every step.

## 2.8 So what should I actually set?

| Scenario | Sample rate | Bit depth |
|----------|-------------|-----------|
| Music-only project (most home studios) | **44.1 kHz** | **24-bit** |
| Audio for video / film / broadcast | **48 kHz** | **24-bit** |
| Tracking unpredictable live sources | 44.1 or 48 kHz | **32-bit float** (if available) |
| Final export for streaming/CD | 44.1 kHz | 16-bit (with dither) |
| "Hi-res" / heavy pitch-shifting work | 88.2 / 96 kHz | 24-bit |

Practical guidance:

- **24-bit is non-negotiable for recording.** The extra headroom it buys is the
  real benefit, and storage is cheap.
- **44.1 kHz is plenty for music.** Use **48 kHz** if your project will sync to
  video (it's the video-world standard).
- **Higher sample rates (88.2/96 kHz) have real but modest benefits** — mainly
  more room above the audible band for distortion/oversampling plugins and
  extreme time-stretching. They double your file sizes and CPU load. Most great
  records were and are made at 44.1/48 kHz.
- **Pick one sample rate per project and stay there.** Mixing files of different
  rates forces sample-rate conversion, which is best avoided.

## Summary

- Digital audio = measuring the wave's amplitude many times per second
  (**sample rate**) at some precision (**bit depth**). This is **PCM**.
- **Nyquist:** the highest capturable frequency is half the sample rate. Human
  hearing ends near 20 kHz, so **44.1 kHz** (Nyquist 22.05 kHz) captures it all.
- Sampling too slowly causes **aliasing** — false lower frequencies; an
  **anti-aliasing filter** prevents it.
- **Bit depth = dynamic range** (~6 dB per bit). 16-bit ≈ 96 dB, 24-bit ≈ 144 dB.
- Stay below **0 dBFS**; record with **headroom** around -12 to -18 dBFS.
- **32-bit float** is effectively unclippable; **dither** is added only at the
  final reduction to a lower bit depth.
- Defaults: **44.1 kHz / 24-bit** for music, **48 kHz / 24-bit** for video.

---

> **Try this.** In your DAW, record the same phrase twice: once peaking near 0
> dBFS and once peaking around -18 dBFS. Then normalize both to the same loudness
> and compare. On a 24-bit project they'll sound essentially identical — proof
> that you gain nothing by recording hot, and everything by keeping headroom.

[← Chapter 1](01-what-is-sound.md) | [Back to Index](../README.md) | [Next: Chapter 3 — Audio Formats & Compression →](03-audio-formats.md)
