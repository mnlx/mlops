# Chapter 4 — Anatomy of a Guitar Tone

People say "I want a Marshall tone" or "that's a Fender sound," as if tone comes
from one box. It doesn't. The sound that reaches a listener is the result of a
**chain** of stages, each one shaping the signal — and each one is responsible
for a recognizable part of the final tone. This short chapter maps the whole
chain so the next four chapters (preamps, cabinets, IRs, NAM) have a place to
hang. Even if you play bass or keys, this is the model for thinking about *any*
amplified or processed signal.

## 4.1 The chain, end to end

Here is the classic electric-guitar signal path, in order:

```
 Guitar  →  Pedals  →  Preamp  →  Power amp  →  Cabinet  →  Microphone  →  Audio interface
(strings  (drive,    (gain &     (push &       (speaker   (captures      (A/D → your
 & pickups) EQ, FX)   tone-      "feel")        + box,     the moving     DAW)
                       shaping)                 a filter)  air)
```

Each arrow is a transformation. Let's walk it.

### 1. The instrument: strings and pickups

The string vibrates (Chapter 1: fundamental + harmonics), and magnetic
**pickups** convert that vibration into a weak electrical signal. Pickup type
(single-coil vs. humbucker), position (neck = warm, bridge = bright), and even
the wood and the player's hands set the *raw material* every later stage works
on. Garbage in, garbage out: tone starts at the fingers.

### 2. Pedals / effects

Optional stomp-boxes between guitar and amp: **overdrive/distortion** (add
harmonics and sustain), **EQ/boost**, **wah**, **compressor**, and time/
modulation effects. Where an effect sits in the chain matters — we cover the
"why" of each effect type in Chapters 10–11.

### 3. The preamp

The first amplification stage. It boosts the tiny pickup signal and, crucially,
**shapes the tone and adds the gain/distortion character** you associate with a
particular amp. This is where "the sound of the amp" largely lives. **Chapter 5
is entirely about why the preamp changes the sound.**

### 4. The power amp

Takes the preamp's line-level signal and boosts it to the high power needed to
physically move a speaker. At high volumes the power amp adds its own
compression and "sag" and feel — part of why a cranked amp feels alive. (In
modeling, power-amp behavior is often folded into the captured model.)

### 5. The cabinet (speaker + box)

The speaker turns electricity back into moving air — but it's a *terrible,
beautiful* filter. A guitar speaker can't reproduce the full 20 Hz–20 kHz range;
it rolls off the harsh highs and shapes the mids, and the wooden box adds its
own resonance. **The cabinet is responsible for a huge part of the final tone —
Chapter 6.**

### 6. The microphone (and the room)

A mic in front of the cabinet captures the moving air. Mic *choice* and
*placement* dramatically change what's recorded — moving a mic an inch changes
the tone more than most EQ moves. The room adds reflections and ambience.

### 7. The audio interface

The mic's analog voltage hits the interface's **mic preamp** (different from the
guitar amp's preamp — this one just brings the level up cleanly) and then the
**A/D converter** (Chapter 2), which turns it into the digital samples your DAW
records.

## 4.2 The digital revolution: collapsing the chain

Everything above can be done with physical gear in a room. But two technologies
let you reproduce most of that chain *in the box*, and they map directly onto the
stages above — which is why they get their own chapters:

- **Impulse Responses (IR)** capture the **cabinet + mic + room** stage — the
  *linear* part of the chain — as a small file you can apply with a convolution
  plugin. (**Chapter 7**)
- **Neural Amp Modeler (NAM)** captures the **preamp + power amp** stage — the
  *nonlinear*, distortion-generating part — using a neural network. (**Chapter
  8**)

Put a NAM model (the amp) in front of an IR (the cab) and you've rebuilt the
whole "amp → cab → mic" chain digitally, from a clean DI'd guitar signal. This
amp-then-cab order is the key to understanding both technologies, and it's why we
split them into "nonlinear" (NAM) and "linear" (IR) — a distinction we'll define
precisely in Chapters 7 and 8.

## 4.3 Why "where it happens" matters

Two reasons this map is worth internalizing:

1. **Diagnosing tone problems.** "It's too harsh" — is that the pickup, the
   preamp gain, the cab/IR, or the mic position? Knowing the chain tells you
   where to reach. Fizzy high-end is usually a cab/IR or mic issue, not a
   preamp-gain issue, for instance.
2. **Order is non-commutative.** Running distortion *into* an EQ sounds different
   from EQ *into* distortion, because distortion adds harmonics based on whatever
   it's fed. The same logic explains why amp-before-cab is the only order that
   makes physical sense.

## Summary

- Guitar tone is a **chain**: instrument → pedals → preamp → power amp → cabinet
  → mic → interface. Each stage owns a recognizable slice of the sound.
- The **preamp** contributes most of the amp's gain/tone character (Chapter 5);
  the **cabinet+mic** shapes and tames the result (Chapter 6).
- Digitally, **NAM** captures the nonlinear **amp** stage (Chapter 8) and **IR**
  captures the linear **cab+mic** stage (Chapter 7); chained amp→cab, they
  rebuild the whole rig in the box.
- Signal-chain **order matters**, because each stage transforms what the next one
  receives.

---

> **Try this.** Record a clean DI (direct) guitar signal once. Then audition it
> through (a) just a NAM amp model with no cab, (b) just an IR cab with no amp,
> and (c) amp → cab together. Hearing each stage in isolation makes the chain
> concrete: the amp brings the drive and feel, the cab brings the "in the room"
> filtering, and only together do they sound like a record.

[← Chapter 3](03-audio-formats.md) | [Back to Index](../README.md) | [Next: Chapter 5 — Why Preamps Change the Sound →](05-preamps.md)
