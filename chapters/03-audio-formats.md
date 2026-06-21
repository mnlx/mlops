# Chapter 3 — Audio Formats & Compression

You now know that digital audio is a stream of PCM numbers (Chapter 2). A raw
stream of those numbers is large — about **10 MB per minute** for CD-quality
stereo. **File formats** are the different ways we package and shrink that data.
The big divide is between formats that keep *every* number (**lossless**) and
formats that throw some away to save space (**lossy**). This chapter explains
how each works and which to use when.

## 3.1 The two kinds of compression

The word "compression" is overloaded in audio. There are two completely
different meanings:

1. **Data compression** (this chapter): making the *file* smaller. Splits into
   **lossless** (perfectly reversible) and **lossy** (permanently discards
   data).
2. **Dynamic-range compression** (Chapter 10): an *effect* that reduces the
   volume difference between loud and quiet parts of a sound.

They are unrelated. Here we mean file size.

Within data compression:

- **Uncompressed:** every PCM sample stored verbatim (WAV, AIFF).
- **Lossless compression:** repacked smaller but bit-for-bit identical when
  decoded — like ZIP for audio (FLAC, ALAC). No quality loss.
- **Lossy compression:** permanently deletes audio data the ear is least likely
  to notice, for dramatically smaller files (MP3, AAC, Ogg Vorbis, Opus). Once
  gone, it can't be recovered.

## 3.2 Uncompressed: WAV and AIFF

Both **WAV** (Microsoft/IBM) and **AIFF** (Apple) are containers for raw PCM.
They are functionally equivalent in quality — they store exactly the samples
your converter produced, no more, no less.

- **Quality:** perfect (it *is* the original data).
- **Size:** large. ~10 MB/min stereo at 44.1 kHz/16-bit; more at 24-bit/higher
  rates.
- **Use them for:** recording, editing, mixing, and archiving masters. This is
  your **working format** — never edit or master from a lossy file.
- WAV is the universal interchange format; AIFF is its Apple-flavored twin. A
  practical caveat: standard WAV files have a 4 GB size limit (fine for songs,
  a problem for very long recordings), where formats like RF64/BWF extend it.

## 3.3 Lossless compression: FLAC and ALAC

These shrink the file *without losing anything* — decode them and you get the
exact original PCM back. They do it by encoding the data more cleverly
(predicting samples and storing only the differences, then entropy-coding the
result), much like a ZIP archive.

- **FLAC** (Free Lossless Audio Codec): open, royalty-free, widely supported.
  Typically compresses to **~50–60%** of the WAV size. The standard for lossless
  distribution and archiving.
- **ALAC** (Apple Lossless): Apple's equivalent, for the Apple/iTunes ecosystem.
  Similar performance.

- **Quality:** perfect — identical to WAV on decode.
- **Size:** roughly half of WAV.
- **Use them for:** archiving libraries, distributing high-quality downloads,
  and high-resolution streaming tiers where you want full fidelity at a smaller
  size.

## 3.4 Lossy compression: MP3, AAC, Ogg Vorbis, Opus

This is where most everyday listening happens. Lossy codecs exploit
**psychoacoustics** — the science of what the ear can and can't perceive — to
decide what to delete:

- **Frequency masking:** a loud tone hides a nearby quieter tone, so the quiet
  one can be discarded.
- **Temporal masking:** a loud sound hides quiet sounds immediately before and
  after it.
- **Hearing limits:** content near/above 20 kHz can be reduced or removed.

The encoder spends its limited data budget on what you *can* hear and throws
away the rest. How big that budget is, is set by the **bitrate**.

### Bitrate: the quality dial for lossy files

**Bitrate** = how many kilobits of data per second (**kbps**) the file uses.
Higher bitrate = more data kept = better quality and bigger files.

| Bitrate (MP3/AAC) | Rough quality |
|-------------------|---------------|
| 128 kbps | Acceptable; artifacts audible to trained ears, esp. on cymbals/reverb |
| 192 kbps | Good for casual listening |
| 256 kbps | Very good; the iTunes/AAC standard |
| 320 kbps | Highest standard MP3; near-transparent for most listeners |

Bitrate can be **constant (CBR)** or **variable (VBR)**. VBR spends more bits on
complex passages and fewer on simple ones, giving better quality per megabyte —
prefer VBR when the option exists.

### The codecs

- **MP3** — the original mass-market format. Universally compatible; plays
  *everywhere*. At 320 kbps it's hard to distinguish from lossless in casual
  listening. Slightly dated, but unbeatable for compatibility.
- **AAC** (Advanced Audio Coding) — MP3's successor; **better quality than MP3
  at the same bitrate**. The default for Apple Music, YouTube, and most modern
  streaming/video. Files often carry the `.m4a` extension.
- **Ogg Vorbis** — open, patent-free, quality competitive with AAC. Famously
  used by Spotify (up to 320 kbps) and in games.
- **Opus** — the modern open standard; **the best low-to-mid-bitrate quality
  available**, excellent for both music and voice, and the default for many
  modern streaming, voice-chat and web (WebRTC) applications. If you control
  both ends, Opus is technically the strongest choice.

### The golden rule of lossy: never re-encode

Each lossy encode discards data. Encoding an MP3 *from* another MP3
("transcoding") compounds the damage — artifacts stack. Always make lossy files
**once, from your lossless master.** Keep WAV/FLAC as the source of truth.

## 3.5 Which format for which job?

| Job | Best choice | Why |
|-----|-------------|-----|
| Recording / editing / mixing | **WAV** (or AIFF) | Lossless, universal, the working master |
| Archiving your library/masters | **FLAC** | Lossless, ~half the size of WAV |
| High-quality download / hi-res streaming | **FLAC / ALAC** | Full fidelity, smaller |
| Everyday portable listening | **AAC 256 kbps** or **MP3 320 kbps** | Tiny files, transparent enough |
| Maximum compatibility (old gear, any player) | **MP3** | Plays on literally everything |
| Voice, podcasts, low-bandwidth streaming | **Opus** | Best quality per kbps |
| Sending a quick demo for feedback | MP3 256–320 kbps | Small, emails/uploads fast |
| Delivering a final master to a client/label | **WAV 24-bit** | They need the full-quality source |

## 3.6 A note on streaming and "loudness normalization"

Streaming platforms (Spotify, Apple Music, YouTube) deliver lossy streams
(commonly AAC or Ogg/Opus at various tiers) and additionally apply **loudness
normalization** — they turn everything to a common loudness target (measured in
**LUFS**) on playback. The practical consequence for you as a producer: making a
master *brick-wall loud* gains you nothing on streaming (it gets turned down
anyway) and costs you dynamics. Master to the platform's target (commonly
around **-14 LUFS**), and let the dynamics breathe.

## Summary

- A file format is how PCM audio is packaged; the key split is **lossless** vs.
  **lossy**.
- **WAV/AIFF** = uncompressed, perfect, large — your **working/master** format.
- **FLAC/ALAC** = lossless compression, ~half size, perfect quality — archiving
  and hi-fi distribution.
- **MP3/AAC/Ogg/Opus** = lossy, much smaller, quality set by **bitrate**; they
  use **psychoacoustic masking** to discard inaudible data. AAC beats MP3 at
  equal bitrate; Opus is best per kilobit; MP3 wins on compatibility.
- **Never master from, or re-encode, a lossy file.** Keep lossless as the source.
- For streaming, master to a **LUFS target**, not maximum loudness.

---

> **Try this.** Take one WAV file and export it as MP3 at 128, 192 and 320 kbps,
> plus a FLAC. Compare file sizes, then A/B them on good headphones — focus on
> cymbals, vocal sibilance and reverb tails, where lossy artifacts hide. Notice
> how hard 320 kbps is to tell from the FLAC, and how 128 kbps "smears" the
> highs. That's psychoacoustic compression at work.

[← Chapter 2](02-digital-audio.md) | [Back to Index](../README.md) | [Next: Chapter 4 — Anatomy of a Guitar Tone →](04-signal-chain.md)
