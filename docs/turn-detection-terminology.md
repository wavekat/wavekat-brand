# Turn Detection Terminology

> Reference for wavekat-turn naming decisions. Researched March 2026.

## No standard abbreviation

Unlike VAD, ASR, and TTS, turn detection has no universally agreed 3-letter acronym.

| Term | Meaning | Used by |
|------|---------|---------|
| **Turn detection** | Semantic: "is the user done speaking?" | OpenAI, LiveKit, Pipecat, Speechmatics |
| **Endpointing / EPD** | Silence-based cutoff (audio-only) | Deepgram, Google, Azure |
| **EOU** (End of Utterance) | When a speech segment ends | LiveKit model, Pipecat internals, Deepgram |
| **EOT** (End of Turn) | Dialogue-level turn boundary | Academic papers |
| **Semantic VAD** | Model-based turn detection | OpenAI Realtime API |

## Endpointing vs turn detection

- **Endpointing** = silence timeout (milliseconds of no speech)
- **Turn detection** = semantic understanding (considers context, pauses, filler words)
- OpenAI Realtime API separates these as `server_vad` (silence) vs `semantic_vad` (model-based)

## Platform specifics

- **OpenAI Realtime API**: `turn_detection` config with `server_vad` and `semantic_vad` types
- **LiveKit**: `TurnDetector` class, 135M param model (SmolLM v2), text-based, <500MB RAM
- **Pipecat**: Smart Turn model (audio-based, 8MB ONNX), "end of turn" terminology
- **Deepgram**: `endpointing` (silence VAD) + `UtteranceEnd` (word timing gaps)
- **Speechmatics**: Decoupled turn detection from transcription, `ForceEndOfUtterance` API

## wavekat-turn naming decision

- Crate name: `wavekat-turn` (not `wavekat-eou`)
- Banner description: "TURN DETECTION"
- "Turn" matches the OpenAI/LiveKit/Pipecat/Speechmatics consensus
- "Turn" covers future scope: barge-in, wait state, backchannel prediction

## Sources

- https://docs.pipecat.ai/guides/learn/speech-input
- https://docs.livekit.io/agents/build/turns/turn-detector/
- https://blog.livekit.io/using-a-transformer-to-improve-end-of-turn-detection/
- https://developers.openai.com/api/docs/guides/realtime-vad
- https://developers.deepgram.com/docs/understanding-end-of-speech-detection
- https://docs.speechmatics.com/speech-to-text/realtime/turn-detection
- https://deepgram.com/learn/evaluating-end-of-turn-detection-models
