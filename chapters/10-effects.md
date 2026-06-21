# Chapter 10 — Effects: The Mixing Toolkit

EQ (Chapter 9) shapes *frequency*. The rest of the mixing toolkit shapes
**dynamics, time and space, and harmonics**. This chapter explains each major
effect family — what it does, the controls that matter, and when to reach for it
— so that Chapter 11's per-instrument recipes make sense. Knowing *why* an effect
does what it does beats memorizing presets.

## 10.1 Dynamics: controlling loud and quiet

### Compression

A **compressor** automatically **turns down the loud parts** of a signal,
reducing the gap between loud and quiet (the **dynamic range**). After it
"squashes" the peaks, you turn the whole thing back up — so the *quiet* parts
end up louder relative to the peaks. The result: a more even, controlled,
"present," "glued" sound.

Why it matters: a raw vocal might swing wildly in level (some words loud, some
buried). Compression evens that out so every word sits in the mix.

The controls:

- **Threshold** — the level above which compression kicks in. Lower threshold =
  more of the signal gets compressed.
- **Ratio** — how *hard* it turns down what's above the threshold. 2:1 is gentle;
  4:1 is moderate; 8:1+ is heavy; ∞:1 is **limiting** (a brick wall).
- **Attack** — how *fast* it clamps down after a peak crosses the threshold.
  **Fast attack** catches transients (tames the pick/pluck/"snap"); **slow
  attack** lets the transient *through* first (keeps punch/attack) then
  compresses the body.
- **Release** — how fast it stops compressing after the signal drops back. Too
  fast = "pumping"/distortion; too slow = it never recovers.
- **Makeup gain** — turns the now-quieter signal back up to match.
- **Knee** — how gradually the ratio engages around the threshold (soft knee =
  smoother/transparent; hard knee = more obvious).

The attack/release interaction is really an **envelope** tool (Chapter 1): fast
attack softens the attack of a note; slow attack emphasizes it. That's how
compression adds "punch" *or* "smoothness" depending on settings.

Watch for **over-compression**: squash too hard and you kill the life/dynamics,
cause pumping, and raise the noise floor. A few dB of gain reduction is often
plenty.

### Limiter

A **limiter** is a compressor with a very high ratio and fast attack — it stops a
signal from ever exceeding a ceiling. Used on the **master bus** to maximize
loudness safely and prevent clipping (mind the LUFS point from Chapter 3 — don't
over-limit for streaming).

### Gate / Expander

A **noise gate** is the opposite of a compressor at the bottom end: it
**silences (or attenuates) a signal below a threshold.** Essential for high-gain
guitar (Chapter 5's cascaded gain is *noisy* — a gate kills the hiss/hum between
riffs) and for tightening drums or cutting bleed/mic spill.

### De-esser

A **de-esser** is a specialized, frequency-targeted compressor that ducks only
the **sibilance** range (~5–9 kHz, Chapter 9) and only *when* an "s"/"sh" hits —
fixing harsh vocals without dulling the whole voice the way a static EQ cut
would.

## 10.2 Time-based: depth and space

These create the sense of an instrument existing in a *place*.

### Reverb

**Reverb** simulates the countless reflections a sound makes in a physical space
— a room, hall, chamber, or metal plate. It adds **depth, size and ambience**,
and "glues" elements into a shared space. (Convolution reverb, Chapter 7, uses
IRs of real spaces; algorithmic reverb synthesizes the reflections.)

Key controls:

- **Type** — room (small, natural), hall (big, lush), plate (smooth, classic on
  vocals), spring (that surfy guitar-amp sound), chamber.
- **Decay / RT60** — how long the tail lasts. Short = intimate; long = epic.
- **Pre-delay** — the gap before the reverb starts. Longer pre-delay keeps the
  dry sound clear and *in front* of its own reverb (helps vocals stay
  intelligible).
- **Mix / wet-dry** — how much reverb. On a channel insert keep it low; better,
  use a **send** (see 10.5).
- **Size, diffusion, damping** — fine-tune the space and how bright the tail is.

Pro move (from the research): **EQ your reverb.** High-pass the reverb return
(~200–300 Hz) so it doesn't add mud, and roll off some highs to make it sit
warmer behind the dry signal.

### Delay (echo)

**Delay** repeats the signal one or more times after a set interval. Uses range
from obvious rhythmic echoes to subtle thickening.

- **Time** — usually synced to tempo (1/4, 1/8, dotted-1/8 — the classic
  "U2"/rhythmic guitar delay). Set in ms or note values.
- **Feedback** — how many repeats (how much output is fed back in). High feedback
  = many, trailing echoes.
- **Mix** — level of the repeats.
- **Slapback** — a single, very short (~80–120 ms) echo for rockabilly/vocal
  thickening.

Delay vs. reverb: **delay adds "wetness" and width without the wash of reverb**,
keeping things clearer — pros often combine a little of each. And the **Haas
effect**: a copy delayed under ~40 ms isn't heard as a separate echo but adds
**thickness and stereo width** — the basis of many widening tricks.

## 10.3 Modulation: movement and width

Modulation effects use a **low-frequency oscillator (LFO)** to *vary* something
over time (pitch, timing, or phase), creating motion, thickness and width.

- **Chorus.** Duplicates the signal, slightly **detunes and delays** the copies,
  and modulates them — creating the impression of several instruments playing
  together. Adds **width and shimmer** (lush on clean guitar, synths, backing
  vocals).
- **Flanger.** A short, modulated delay mixed with the original creates a sweeping
  "jet plane" comb-filter whoosh.
- **Phaser.** Sweeps a series of phase shifts for a softer, swirling sweep
  (classic on funk guitar, electric piano).
- **Tremolo.** Modulates *volume* up and down (that surf/vintage pulsing).
- **Vibrato.** Modulates *pitch* up and down.

Modulation is mostly about **flavor and width**. A common trick: a touch of
chorus on a doubled part to widen the stereo image.

## 10.4 Harmonic effects: saturation and distortion

Unlike everything above (mostly linear or time-based), these are **nonlinear**
(Chapter 5): they **add harmonics**.

- **Saturation / tape / tube emulation.** Gentle harmonic distortion that adds
  warmth, density, "analog" character and perceived loudness without obvious
  distortion. Great glue on buses, bass, and vocals.
- **Distortion / overdrive / fuzz.** The bigger-dose version — the guitar-tone
  mechanism of Chapter 5, now used as a mix color (e.g., grit on a synth or
  parallel-distorted drums).
- **Exciter / enhancer.** Generates new high-frequency harmonics to add "air" and
  sparkle beyond what EQ-boosting existing content can do.

## 10.5 How effects are applied: inserts vs. sends

This routing choice (you'll set it up in Chapter 12) is as important as the
effects themselves:

- **Insert.** The effect sits *in* the channel; 100% of the signal passes
  through it. Use for things that should process the *whole* signal: EQ,
  compression, gates, distortion, de-essing.
- **Send / aux / bus.** The channel sends a *copy* to a separate FX track holding
  the effect (set the FX to 100% wet). Use for **reverb and delay** so that:
  1. **Multiple instruments share one reverb** → they sound like they're in the
     *same room* (cohesion), and it saves CPU.
  2. You can **EQ and compress the effect return** independently (10.2's reverb
     tips, and "ducking" the reverb under the vocal so lyrics stay clear).

**Parallel processing** uses the same send idea: blend a heavily-processed copy
(e.g., crushed parallel compression, "New York" drums) under the natural dry
signal for power *and* dynamics.

### Signal-chain order (on a channel insert)

A common, sensible order: **Gate → EQ (subtractive) → Compression → EQ
(tone/additive) → Saturation → Modulation → (sends to Delay/Reverb).** Order
isn't sacred, but remember Chapter 5: anything nonlinear (compression,
saturation) reacts to what feeds it, so cleaning up *before* it usually helps.

## Summary

- **Dynamics:** **compression** evens loud/quiet (threshold/ratio/attack/release
  /makeup — attack & release shape the *envelope*); **limiters** cap peaks;
  **gates** silence below a threshold (kills high-gain noise); **de-essers** tame
  sibilance.
- **Time-based:** **reverb** = space/depth (type, decay, pre-delay; *EQ your
  reverb!*); **delay** = echoes/width (time, feedback; slapback; Haas widening).
- **Modulation** (chorus, flanger, phaser, tremolo, vibrato) uses an LFO for
  **movement and width**.
- **Saturation/distortion/exciters** are **nonlinear** — they **add harmonics**
  for warmth, density and air.
- Apply whole-signal processors as **inserts**; apply reverb/delay via **sends**
  so instruments share a space and the effect can be EQ'd/compressed. **Parallel
  processing** blends a processed copy under the dry.

---

> **Try this.** On a vocal, set up a reverb on a **send** (not an insert). First
> hear it with the reverb full-range — muddy. Now high-pass the reverb return at
> 250 Hz and roll off above 8 kHz. The vocal suddenly sits in a clean, warm space
> without clouding the mix. That's the difference between *using* an effect and
> *mixing* with one.

[← Chapter 9](09-eq.md) | [Back to Index](../README.md) | [Next: Chapter 11 — Effects Recipes by Instrument →](11-effects-recipes.md)
