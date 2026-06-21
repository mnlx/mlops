# Chapter 8 — Neural Amp Modeler (NAM) & Profiling

We've now built the two halves of digital tone. Chapter 7 captured the **linear**
cabinet with an IR. This chapter captures the **nonlinear** amp — the preamp and
power amp whose distortion and "feel" (Chapter 5) an IR fundamentally cannot
reproduce. The tool is **Neural Amp Modeler (NAM)**, a free, open-source project
that uses deep learning to clone real amps with state-of-the-art accuracy. It's
arguably the biggest shift in guitar recording of the last several years.

## 8.1 The problem NAM solves

Recall the linear/nonlinear split (Chapters 5–7):

- A cabinet is **linear** → fully captured by an IR.
- An amp's distortion is **nonlinear** → its response *changes with how hard you
  play*, so there is no single fixed "response" to convolve. An IR can't do it.

For decades, the only way to reproduce an amp in software was **circuit modeling
(physical/component modeling):** engineers study the actual electronic circuit
and write equations that simulate every tube, resistor and capacitor. This works,
but it's labor-intensive, model-specific, and only as good as the engineers'
approximations of a messy analog reality.

NAM takes a completely different, almost cheeky approach.

## 8.2 How NAM works: learning by listening

Instead of modeling the *circuit*, NAM **models the behavior**. It treats the
amp as a black box and asks a neural network to *learn* the relationship between
what goes in and what comes out:

1. Play a known **input signal** (a clean DI guitar / test signal) into the real
   amp.
2. **Record the amp's output** (the "wet" signal) simultaneously.
3. Train a **neural network** to transform the input into the output — i.e., to
   produce the same output the real amp did, for that input.
4. After training on a wide range of input dynamics, the network has learned the
   amp's **complete nonlinear behavior** — its gain staging, its EQ curve, *and*
   crucially its **touch sensitivity** (how it distorts more on hard hits and
   cleans up on soft ones).

The trained result is a small file — a **NAM capture** (also called a NAM
profile, model, or `.nam` file) — that, loaded into the free NAM plugin, behaves
like the original amp, dynamics and all. The makers describe the result as
"virtually indistinguishable from the real thing."

Because it learns *behavior from audio* rather than approximating a circuit, NAM
can capture not just amps but **pedals, preamps, and even entire signal chains**
— anything you can play a signal through and record.

> **The key distinction.** Traditional sims try to recreate what gear *should*
> sound like from its circuit. NAM **listens to the real gear and trains a
> network to behave exactly like it.** It's data-driven cloning, not physics
> simulation.

## 8.3 NAM vs. IR vs. "profiling" — keeping terms straight

These get muddled constantly:

| Term | Captures | Method | Linear? |
|------|----------|--------|---------|
| **IR** | Cabinet + mic + room | Convolution of an impulse response | **Linear** |
| **NAM** | Amp / preamp / pedal / chain | Neural network trained on input→output audio | **Nonlinear** |
| **Kemper / "Profiling"** | Amp (commercial hardware) | Proprietary profiling (a different, older commercial take on the same goal) | Nonlinear |

NAM and the older commercial "profilers" (like Kemper) share the *goal* —
capture a real amp by analyzing its sound — but NAM is **free, open-source, runs
as a plugin in your DAW, and uses modern neural networks**, which is a large part
of why it spread so fast.

A complete digital rig is therefore: **NAM (the amp) → IR (the cab).** NAM
provides the nonlinear distortion and feel; the IR provides the linear cab/mic
filtering (Chapter 7). Many NAM captures are made *amp-only* (taken from the
amp's DI/line out before any speaker), so you add your own IR afterward — giving
you free choice of cabinet. Some captures are "full rig" (amp + cab baked in), in
which case you don't add an IR.

## 8.4 Making your own NAM capture

You can profile your own gear for free. The two common methods:

1. **Sine-sweep / reamp method.** A standardized input file is played through
   your gear and the output recorded, then uploaded for training.
2. **Dry/Wet (DI) method.** Split your guitar with a DI box and record the dry
   signal *and* the processed (amped) signal simultaneously, so the trainer has a
   perfectly aligned input/output pair.

You then **train** the model. Training runs a machine-learning optimization,
which needs a GPU. You have options:

- **Train locally** with the open-source NAM trainer (needs a capable GPU).
- **Train in the cloud.** Services such as **TONE3000** train your captures on
  cloud GPUs (e.g., RTX 4090s) with no coding or local setup — you upload your
  recordings and download a finished `.nam` file. (Per their docs.)

The output is an open `.nam` file compatible with the free NAM plugin in any DAW.

> **What "training" means here.** Profiling an amp is genuinely a small machine-
> learning task: you're fitting a neural network's parameters so its output
> matches recorded target audio — the same shape as any supervised-learning
> problem. The "model" you download is those learned weights.

## 8.5 The NAM ecosystem

- **The plugin** is free and open-source, available in standard formats (VST3,
  AU, etc.) for all major DAWs, plus standalone. Load a `.nam` capture and play.
- **Captures are abundant and mostly free.** Communities and libraries —
  **TONE3000** (thousands of captures and IRs), plus Discord/forum/Facebook
  groups — host models of everything from a Fender Reverb to a Marshall JCM800,
  Vox AC30, Roland JC-120 and countless boutique amps and pedals. (Counts and
  catalogs grow constantly.)
- **Hardware support.** Because the format is open, NAM models now run on some
  hardware floor units and modelers too, not just in the DAW.

## 8.6 Practical tips for using NAM

- **Match the input level.** NAM captures are nonlinear, so they care about how
  hard you drive them. Most NAM plugins show input/output level controls and a
  target; set your DI level so it matches what the capture was trained at, or the
  gain/feel will be off. (This is the digital echo of Chapter 5's point that
  distortion depends on input level.)
- **Amp-only capture → add an IR.** If the model is amp-only, insert an IR loader
  after it (Chapter 7). If it's a full-rig capture, don't.
- **Feed it a clean DI.** NAM expects a dry guitar signal, just like a real amp's
  input. Don't feed it an already-distorted or already-cabbed signal.
- **CPU.** Bigger/"hi-fi" capture architectures sound marginally better but cost
  more CPU than "standard"/"lite" ones; pick to taste and track count.

## Summary

- NAM captures the **nonlinear** amp (preamp/power amp/pedal/chain) that an IR
  cannot — including distortion and **touch-sensitive feel**.
- It works by **training a neural network on input→output audio** from real gear,
  modeling *behavior* rather than simulating the *circuit*.
- A complete in-the-box rig is **NAM (amp) → IR (cab)**; amp-only captures let
  you choose your own IR, full-rig captures bake the cab in.
- You can **make your own** captures (sweep or dry/wet DI methods) and **train**
  them locally or via cloud GPU services like **TONE3000**; the output is an open
  `.nam` file for the free plugin.
- The ecosystem is **free, open-source, and huge**, with thousands of community
  captures of classic and boutique gear.

---

> **Try this.** Download the free NAM plugin and a couple of free captures
> (e.g., a clean Fender-style and a high-gain Marshall-style). On one DI guitar,
> A/B them, then add an IR after each. Pay attention to dynamics: dig in hard,
> then play softly and roll your guitar volume back — hear the capture distort and
> then clean up. That responsiveness is the nonlinear behavior the network
> learned, and it's exactly what an IR alone could never give you.

[← Chapter 7](07-impulse-responses.md) | [Back to Index](../README.md) | [Next: Chapter 9 — EQ: Carving the Frequency Spectrum →](09-eq.md)
