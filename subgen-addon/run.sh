#!/bin/bash

OPTIONS_FILE="/data/options.json"

if [ -f "$OPTIONS_FILE" ]; then
    echo "[SubGen] Reading configuration from HA addon options..."

    export WHISPER_MODEL=$(jq -r '.WHISPER_MODEL // "medium"' "$OPTIONS_FILE")
    export TRANSCRIBE_DEVICE=$(jq -r '.TRANSCRIBE_DEVICE // "cpu"' "$OPTIONS_FILE")
    export CONCURRENT_TRANSCRIPTIONS=$(jq -r '.CONCURRENT_TRANSCRIPTIONS // "1"' "$OPTIONS_FILE")
    export WHISPER_THREADS=$(jq -r '.WHISPER_THREADS // "4"' "$OPTIONS_FILE")
    export TRANSCRIBE_OR_TRANSLATE=$(jq -r '.TRANSCRIBE_OR_TRANSLATE // "translate"' "$OPTIONS_FILE")
    export DEBUG=$(jq -r '.DEBUG // "false"' "$OPTIONS_FILE")
    export WEBHOOKPORT=$(jq -r '.WEBHOOKPORT // "9000"' "$OPTIONS_FILE")
else
    echo "[SubGen] No options.json found, using defaults..."
    export WHISPER_MODEL="medium"
    export TRANSCRIBE_DEVICE="cpu"
    export CONCURRENT_TRANSCRIPTIONS="1"
    export WHISPER_THREADS="4"
    export TRANSCRIBE_OR_TRANSLATE="translate"
    export DEBUG="false"
    export WEBHOOKPORT="9000"

fi

# Fixed settings
export PROCADDEDMEDIA="false"
export PROCMEDIAONPLAY="false"
export USE_PATH_MAPPING="false"
export MODEL_PATH="/data/models"

echo "[SubGen] Starting with:"
echo "  Model:                  $WHISPER_MODEL"
echo "  Device:                 $TRANSCRIBE_DEVICE"
echo "  Threads:                $WHISPER_THREADS"
echo "  Concurrent:             $CONCURRENT_TRANSCRIPTIONS"
echo "  Mode:                   $TRANSCRIBE_OR_TRANSLATE"
echo "  Model storage path:     $MODEL_PATH"
echo "  Port:                   $WEBHOOKPORT"
# Start SubGen
exec python3 /subgen/subgen.py
