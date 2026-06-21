# Chapter 12 — Getting Started with REAPER

Everything in this book happens *somewhere* — and for most home studios that
somewhere is a **DAW** (Digital Audio Workstation). This chapter introduces
**REAPER**, the lightweight, deeply customizable, and famously affordable DAW
that's become a favorite of home recordists and pros alike. We'll cover why it's
a great choice, the interface, and the core workflow: tracks, recording, FX,
routing/buses, MIDI, and a first mix.

## 12.1 Why REAPER

- **It's light and fast.** Tiny download, runs well on modest computers, starts
  instantly.
- **It's cheap and honest.** A fully-functional, time-unlimited evaluation, and a
  very affordable license (a discounted personal tier vs. a commercial tier) with
  no subscription — unusually fair pricing.
- **It's endlessly customizable.** Layouts, themes, actions, and scripts can be
  reshaped to fit how you work; you can even save multiple layouts for different
  tasks (tracking vs. mixing).
- **It supports everything.** All common plugin formats (VST/VST3, AU on Mac,
  etc.) and audio interfaces — so the free **NAM** plugin and your **IR loader**
  (Chapters 7–8) drop straight in.

The trade-off: REAPER ships fairly bare and expects you to set it up. That
flexibility is the point, but it means a little initial configuration.

## 12.2 First-time setup: tell REAPER about your hardware

Before anything, point REAPER at your audio interface:

1. **Options → Preferences → Audio → Device.**
2. Choose the right **audio system** (on Windows, prefer **ASIO** with your
   interface's driver for low latency; on Mac, Core Audio).
3. Select your interface as input and output device.
4. Set a **buffer size**: *smaller* (e.g., 128 samples) = lower latency for
   recording but more CPU; *larger* (e.g., 512–1024) = more stable for mixing.
   Many people track small and mix large.
5. Set the project **sample rate / bit depth** for recording in **Project
   Settings** (recall Chapter 2: 44.1 or 48 kHz, 24-bit).

## 12.3 The interface at a glance

The main REAPER window has a few key zones:

- **Transport bar** (bottom or top): the **play, stop, record** buttons, plus the
  playhead position, tempo, time signature and loop controls.
- **Track Control Panel (TCP)** — the left side of each track row. This is where
  you manage each track: its **name, volume, pan, mute (M), solo (S), record-arm
  (the red button), input selector, and FX button.**
- **Arrange / timeline area** — the large central area where recorded audio and
  MIDI appear as **items** (clips) on a timeline you arrange and edit.
- **Mixer (MCP)** — press **`Ctrl/Cmd+M`** to toggle a traditional vertical mixer
  view (faders, meters, FX, sends) — handy when mixing.
- **Master track** — the final output bus everything sums into before your
  speakers.

REAPER is heavily reconfigurable, so layouts vary — but those elements exist in
every setup.

## 12.4 Tracks

A **track** holds audio or MIDI and its processing. To work with them:

- **Add a track:** double-click empty space in the TCP, or press
  **`Ctrl/Cmd+T`**, or right-click → *Insert new track*.
- **Name it** (double-click the name) — stay organized from the start.
- Each track has its **volume, pan, mute, solo** right there in the TCP.
- Drag to **reorder**; use track **folders** to group related tracks (e.g., all
  drums, all guitars) — drag a track slightly under another to nest it.

## 12.5 Recording audio (e.g., a guitar or vocal)

1. **Create a track** and name it.
2. **Set the input.** Click the input dropdown on the track (the little
   input/monitor area in the TCP) and choose the interface input your mic/guitar
   is plugged into (mono input 1, for example).
3. **Record-arm** the track: click the round **red arm button** in the TCP. Its
   meter goes live — check you're getting signal with **headroom** (peaks around
   **-12 to -18 dBFS**, Chapter 2).
4. **Enable input monitoring** (the speaker/monitor icon) if you want to hear
   yourself through the DAW (and through any amp sim) while recording.
5. **Press Record** (the transport record button, or **`R`**). Play/sing.
6. **Press Stop** (or **`Spacebar`**). A new audio **item** appears on the track.
7. Records to your chosen project format (24-bit WAV, Chapter 3) in the project
   folder. Use takes/loop-recording to comp multiple passes.

> **Latency tip.** If monitoring through the DAW feels laggy, lower the buffer
> size (12.2). If your interface has *direct/hardware monitoring*, use that for
> zero-latency tracking and disable software input monitoring.

## 12.6 FX: putting plugins on a track

Everything from Chapters 5–11 lives in the **FX chain**:

1. Click the **FX** button on the track (in the TCP or MCP).
2. The FX browser opens — **double-click** a plugin (EQ, ReaComp, NAM, your IR
   loader, reverb…) to add it.
3. Plugins run **top to bottom** in the chain window — drag to reorder (remember
   the order logic from Chapter 10.6: gate → EQ → comp → … and amp/NAM **before**
   IR).
4. REAPER includes a full suite of stock plugins (the "**ReaPlugs**":
   **ReaEQ, ReaComp, ReaGate, ReaVerb** [a convolution reverb that loads IRs!],
   **ReaDelay**, etc.) — enough to mix an entire record before buying anything.

To build a guitar tone in the box: on a track with a recorded DI, add **NAM** →
then **ReaVerb or a dedicated IR loader** with a cab IR → then EQ/effects.

## 12.7 Routing and buses (sends)

This is where REAPER shines and where Chapter 10.5's send concept becomes real.

### Buses (submix groups)

A **bus** is just a track that other tracks feed into, so you can process them
together (e.g., a "Drum Bus" or "Guitar Bus" with one compressor gluing the
group). In REAPER, the easiest way is **track folders**: put all your guitars in
a folder, and the **folder's parent track acts as a bus** — add an EQ/compressor
there to process all guitars at once.

### Sends and receives (for reverb/delay)

To set up a shared reverb (Chapter 10.5):

1. Create a new track, name it "Reverb," and put a reverb plugin on it set to
   **100% wet**.
2. On a vocal/guitar track, click the **Routing button** (the "**I/O**" / route
   button in the TCP) and add a **Send** to the "Reverb" track.
3. Adjust the **send level** to taste. Do the same from other tracks — now they
   **share one reverb space**, and you can EQ/compress the Reverb track's return
   independently.

Everything ultimately routes to the **Master track**, which feeds your interface
outputs.

## 12.8 MIDI and virtual instruments (keys/synths)

For keyboard, synth and programmed parts (Chapter 11.4):

1. Insert a track and add a **virtual instrument** (a VSTi synth/piano) as the
   first item in its **FX chain** (or use *Insert → Virtual instrument on new
   track*).
2. **Record-arm** the track and set its input to your **MIDI keyboard**.
3. Record-enable and play — REAPER records **MIDI items** (note data, not audio),
   which you can edit freely in the **piano-roll MIDI editor** (double-click a
   MIDI item).
4. Because it's MIDI, you can change notes, timing, velocity, *and the
   instrument/sound itself* after the fact — total flexibility.

## 12.9 A first-mix workflow

Pulling the whole book together, a sane order of operations:

1. **Organize:** name and color tracks; folder them into groups (drums, guitars,
   vocals).
2. **Gain stage / balance:** rough fader levels so everything's audible with
   headroom on the master (no clipping — watch the master meter).
3. **Pan:** place instruments across the stereo field (lead vocal/bass/kick
   center; guitars and overheads out wide).
4. **EQ (subtractive):** HPF everything that isn't bass/kick; carve mud and
   clashes (Chapter 9).
5. **Compression:** control dynamics where needed (Chapter 10).
6. **Buses:** group with folders; glue groups with bus compression/EQ.
7. **Time/space effects on sends:** shared reverb and delay (Chapters 10–11).
8. **Automation:** ride levels and effect amounts over the song (volume
   envelopes, etc.).
9. **Master bus:** gentle bus processing and a **limiter**, mastering to a
   sensible **LUFS** target (Chapter 3), not maximum loudness.
10. **Export / Render:** *File → Render*. Render a **24-bit WAV master**
    (Chapter 3), and additionally an MP3/AAC for sharing — with **dither** when
    rendering to 16-bit.

## Summary

- **REAPER** is light, affordable, customizable, and supports all plugins
  (including free **NAM** and IR loaders) — a great home-studio DAW that needs a
  little setup.
- Configure your **audio device/driver and buffer size** first; set project
  **44.1/48 kHz, 24-bit**.
- Core layout: **transport, Track Control Panel (arm/input/vol/pan/mute/solo/FX),
  arrange timeline, mixer (`Ctrl/Cmd+M`), master track.**
- **Record:** name track → set input → red-arm → check headroom (-12 to -18
  dBFS) → monitor → `R` to record, `Space` to stop.
- **FX:** add plugins to a track's FX chain (top-to-bottom order); the stock
  **ReaPlugs** can mix a whole record; build tone with **NAM → IR**.
- **Routing:** **folders = buses** for group processing; **sends** to an FX
  track = shared reverb/delay; everything sums to the **Master**.
- **MIDI** tracks drive virtual instruments and are fully editable after
  recording.
- Mix in a sane **order** and **render** a 24-bit WAV master (plus lossy copies,
  with dither when down-converting).

---

> **Try this.** Make a tiny project: one MIDI track with a piano VSTi, one
> recorded guitar through NAM → an IR, and a shared reverb on a send that both
> feed. Balance, pan, add a touch of EQ, and render a WAV. You've just used every
> major concept in this book — digital audio, the signal chain, IR/NAM, EQ,
> effects, routing and export — in one pass.

[← Chapter 11](11-effects-recipes.md) | [Back to Index](../README.md) | [Appendices: A — Frequency Chart →](appendix-a-frequency-chart.md)
