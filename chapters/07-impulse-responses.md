# Chapter 7 — Impulse Responses (IR)

In Chapter 6 we established that the cabinet + speaker + mic + room is a
**linear filter** — it shapes frequencies but doesn't create new harmonics.
This chapter explains the technology that captures that filter perfectly in a
tiny file: the **Impulse Response (IR)**, applied through **convolution**. IRs
are how you get a real, mic'd-cabinet sound from a digital amp, and they're one
of the most useful and CPU-cheap tools in modern production.

## 7.1 What an IR is

An **Impulse Response** is a recording of how a system responds to a single,
instantaneous burst of sound — an "impulse." Think of it as an **acoustic
fingerprint** or a photograph of a space/device's sonic character.

The idea: if you could feed a *perfect* impulse (an infinitely short, full-
spectrum click containing every frequency at once) into a linear system and
record what comes out the other side, that recording would contain **everything
about how that system colors sound** — every frequency boost and cut, every
resonance, every reflection. That output recording *is* the impulse response.

For a guitar cabinet, the IR captures the whole linear chain at once:

> **the speaker's frequency response + the cabinet's resonance + the
> microphone's character + the mic placement + (optionally) the room.**

A typical cabinet IR is only a **few milliseconds long** and a few kilobytes in
size, yet it contains all of that information.

## 7.2 Why this works: linearity (and why amps don't qualify)

The reason an impulse response *completely* describes a system rests on one
property from Chapter 5: **linearity.**

A linear system has a magic property — its behavior is **fully described by how
it responds to a single impulse.** Once you know the impulse response, you can
predict the system's output for *any* input whatsoever. Speaker cabinets, rooms,
and many time-based effects are (approximately) linear, so a single IR captures
them entirely.

This is also precisely **why an IR cannot capture a preamp/amp's distortion.** A
distorting amp is **nonlinear** — its response *depends on how hard you hit it*
(Chapter 5's touch sensitivity), so there's no single fixed "response" to
capture. Hence the division of labor:

| Captured by | System | Behavior |
|-------------|--------|----------|
| **IR** (this chapter) | Cabinet, mic, room, reverb | **Linear** |
| **NAM** (next chapter) | Preamp, power amp, distortion | **Nonlinear** |

## 7.3 Convolution: applying the fingerprint

How do you *use* an IR? Through a mathematical operation called **convolution**,
performed by a **convolution plugin** or **IR loader.**

Conceptually, convolution **"stamps" the IR's character onto your dry signal.**
The IR loader takes your incoming (dry, un-cabbed) signal and the IR file, and
combines them so the output sounds exactly as if your signal had physically
passed through the original cabinet + mic + room.

Mechanically (you don't need the math, but the intuition is useful): convolution
slides the IR along your signal, and for every sample of input it adds in a
tiny, scaled, delayed copy of the entire IR, summing them all up. Because the IR
encodes the system's complete frequency-and-time response, this sum reproduces
exactly what the real system would have output. Every sample of your guitar gets
"painted" with the cabinet's fingerprint.

Two happy consequences of the cabinet being linear:

- **IR files are tiny** (milliseconds) and **convolution is very CPU-efficient**
  — far cheaper than physically modeling a speaker.
- The result is **extremely faithful** — for a linear system, convolution with
  its IR is essentially *perfect* reproduction, not an approximation.

## 7.4 How IRs are captured

You can make your own, and understanding how demystifies them. There are two
common methods:

1. **Sine sweep method (most common, highest quality).** Play a smooth tone that
   sweeps from low to high frequency ("a sweep") through the mic'd cabinet and
   record the result. Special software then mathematically *deconvolves* the
   recording against the known sweep to extract the impulse response. Sweeps give
   a cleaner, higher signal-to-noise IR than a raw impulse.
2. **Direct impulse method.** Feed an actual short burst/click through the system
   and record it. Simpler, but noisier and less precise — rarely used for
   commercial cab IRs.

Either way, the captured IR bakes in *every* choice you made: that specific
speaker, that mic, that exact placement, that room. Want a different mic
position? Capture a new IR. This is why IR libraries ship dozens of variations of
one cabinet (SM57 on-axis, ribbon off-axis, blended pairs, etc.).

## 7.5 Using an IR loader in practice

The workflow in any DAW:

1. Get a **dry amp signal** — either a re-amped DI through a real amp head with
   no cab, or (more commonly today) a **NAM amp model with the cab/IR turned
   off** (Chapter 8). The golden rule: **the IR replaces the cabinet, so the
   signal feeding it must not already contain a cab.**
2. Insert an **IR loader / convolution plugin** (e.g., the free *NadIR*,
   *Cab*, *LeCab*, the loader built into many amp sims, or a generic convolution
   reverb) after the amp.
3. **Load an IR file** (`.wav` is the usual container; some loaders use
   proprietary formats).
4. **Audition and blend.** Try different IRs; many loaders let you load two IRs
   and blend them (mimicking two-mic setups), adjust phase/distance, and
   high-/low-pass the result to taste.

Order in the chain: **amp/distortion first, then IR** — exactly mirroring the
physical reality of amp → cabinet (Chapter 4). Putting an IR *before* distortion
would be like distorting the *speaker's* output, which isn't how a real rig
works.

## 7.6 IRs aren't just for cabs

Because *any* linear system has an impulse response, the same technology powers:

- **Convolution reverb** — IRs of real concert halls, churches, plates and
  rooms, letting you place a sound in a real acoustic space.
- **Acoustic instrument body IRs** — capturing the resonant body of an acoustic
  guitar so a piezo-pickup signal sounds like a mic'd guitar.
- **Hardware/outboard "fingerprints"** of EQs and other linear processors.

Same principle every time: capture a linear system's impulse response, convolve
it onto your signal.

## Summary

- An **IR** is a recording of a **linear** system's response to an impulse — an
  acoustic "fingerprint" of a cabinet + speaker + mic + room, only milliseconds
  long.
- It works because **linear systems are fully described by their impulse
  response** — so one IR can predict the output for any input. (Nonlinear amps
  can't be captured this way — that's NAM's job.)
- **Convolution** applies the IR to your dry signal, "stamping" the cabinet's
  character onto it — faithfully and very CPU-efficiently.
- IRs are captured via **sine sweeps** (or direct impulses); each one bakes in a
  specific mic and placement.
- Use an IR **after** the amp/distortion, fed a **cab-less** signal; the same
  tech also powers **convolution reverb** and acoustic-body simulation.

---

> **Try this.** On a distorted DI guitar, first listen with **no cab** — harsh,
> fizzy, unusable (that's the unfiltered high-order distortion from Chapter 5).
> Now insert an IR loader and load any cab IR. The fizz vanishes and it sounds
> like a record. You just heard the linear cabinet filter do its job — and you
> did it with a few-kilobyte file.

[← Chapter 6](06-cabinets.md) | [Back to Index](../README.md) | [Next: Chapter 8 — Neural Amp Modeler (NAM) →](08-nam.md)
