# Chapter 6 — Why Cabinets Change the Sound

If the preamp (Chapter 5) is the heart of the amp's *character*, the cabinet is
the final, decisive shaper of the tone that actually reaches a microphone.
Players underestimate it constantly — but plug the same amp into two different
cabs, or move the mic two inches, and the change dwarfs almost any EQ move.
Here's why the cabinet is, by some estimates, *half your tone*.

## 6.1 A guitar speaker is a (wonderful) bad speaker

A hi-fi speaker is engineered to reproduce the full audible range (Chapter 1:
20 Hz–20 kHz) as flatly and accurately as possible. A **guitar speaker is the
opposite** — it's deliberately limited and colored, and that's the point.

A typical guitar speaker:

- **Rolls off the lows** below roughly **80–100 Hz** — it physically can't move
  enough air down there, which keeps the tone from being a muddy rumble.
- **Rolls off the highs** sharply above roughly **5–6 kHz**. This is the single
  most important thing a cab does. Remember from Chapter 5 that distortion adds
  lots of *high-order* harmonics — much of that energy lands as harsh, fizzy
  "buzz" up high. The speaker's high-frequency roll-off **filters that fizz
  away**, turning a raw, buzzy distortion into a smooth, musical tone.
- **Has bumps and dips through the mids** — resonant peaks (often a presence
  bump somewhere around 1–5 kHz and a body resonance down low) that give a
  speaker its recognizable "voice."

So the cabinet is essentially a **strong, characterful filter** (Chapter 9's EQ
is the same idea, applied deliberately). This is exactly why an unmic'd, "amp
sim with no cab" tone sounds unbearably harsh and fizzy — there's nothing
filtering the high-order distortion harmonics. **The cab tames the amp.**

## 6.2 The box matters too

A speaker doesn't hang in mid-air; it's mounted in a **cabinet**, and the box
shapes the sound further:

- **Open-back** cabs (common in combo amps) let sound radiate from the rear,
  giving a more open, airy, spacious tone with less low-end punch.
- **Closed-back** cabs (common 4×12 stacks) trap the rear wave, producing
  tighter, punchier, more focused low end — the classic rock/metal "thump."
- **Size, wood, and number of speakers** add resonances and interactions. Four
  speakers in a 4×12 couple together for a bigger low end than a single 1×12.

This is **linear** behavior (Chapter 5's distinction): the cabinet changes the
*frequency balance* and adds resonances, but it doesn't create brand-new
harmonics the way a clipping preamp does. That linearity is *exactly* what makes
the cabinet capturable as an Impulse Response — hold that thought for Chapter 7.

## 6.3 The microphone is part of the cabinet sound

When recording, you almost never hear "the cab" directly — you hear **the cab
through a microphone.** And the mic, plus where you put it, is a massive tone
control:

### Mic choice

Different mics have different frequency responses and characters. The legendary
**Shure SM57** dynamic mic is the studio default on guitar cabs — its built-in
presence bump flatters electric guitar. A ribbon mic sounds smoother and
darker; a condenser, more detailed and airy. The mic imposes its own "EQ curve"
on what's captured.

### Mic placement — the biggest free tone knob you have

Moving a single mic around the speaker changes the tone more than most EQ:

- **Center of the cone (on-axis, "dead center")** = brightest, most aggressive,
  most high-end and "bite."
- **Toward the edge of the cone / off-axis** = progressively warmer, darker,
  rounder, less fizz.
- **Distance from the grille** = closer is tighter with more proximity bass;
  pulling back adds room sound and air, and changes the low-end via the
  **proximity effect**.
- **Angle** relative to the speaker further tilts the high-frequency content.

A speaker's tone isn't uniform across its surface — the center radiates more
highs than the edge — so the mic is sampling a *specific spot* of a *specific
speaker*. That's why "move the mic an inch" is real advice, not folklore.

### The room

Finally, the room the cab sits in adds reflections, ambience and its own
resonances. A close mic captures mostly the cab; a room mic captures the
interaction of cab + space.

## 6.4 Putting it together: the cab is the linear half of the chain

Step back and look at the chain from Chapter 4. The tone-defining work splits
cleanly into two halves:

| Stage | Behavior | What it does | How it's modeled digitally |
|-------|----------|--------------|----------------------------|
| Preamp / power amp | **Nonlinear** | Adds harmonics (distortion, "warmth," feel) | **NAM** (Chapter 8) |
| **Cabinet + speaker + mic + room** | **Linear** | Filters/shapes frequencies, adds resonance, removes fizz | **IR** (Chapter 7) |

Because the cabinet+mic+room is a **linear filter**, its *entire* effect can be
captured as a single short recording — an **Impulse Response** — and re-applied
to any signal perfectly. That's the bridge to the next chapter, and the reason
IRs are so small, so CPU-cheap, and so faithful.

## Summary

- A guitar speaker is **deliberately band-limited**: it rolls off lows (~below
  80–100 Hz) and, crucially, **highs (~above 5–6 kHz)**, which **removes the
  harsh fizz** of distortion's high-order harmonics. It's a strong, characterful
  filter.
- The **cabinet box** (open vs. closed back, size, materials, speaker count)
  adds resonance and shapes the low end.
- You record the cab **through a mic**, so **mic choice and placement** (center
  vs. edge, distance, angle) are enormous tone controls — often bigger than EQ.
- All of this is **linear** behavior (frequency shaping, not new harmonics) —
  which is exactly why a cabinet+mic can be captured as an **Impulse Response**
  (Chapter 7), the linear counterpart to NAM's nonlinear amp capture.

---

> **Try this.** Load one IR loader on a distorted guitar and switch between an
> "on-axis/center" capture and an "off-axis/edge" capture of the *same* cabinet.
> Then try a 1×12 vs. a 4×12 IR. With the amp untouched, the tone transforms —
> proof that the cab and mic position are doing at least as much work as the amp.

[← Chapter 5](05-preamps.md) | [Back to Index](../README.md) | [Next: Chapter 7 — Impulse Responses (IR) →](07-impulse-responses.md)
