#!/bin/sh
set -e

TAG="arduino-nano-33-ble-builder"
docker build -t $TAG .
docker run -t -v $(pwd):/app $TAG -- "cargo build --target thumbv7em-none-eabihf --release"
docker run -t -v $(pwd):/app $TAG -- "arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/embassy-arduino-nano-33-blink target/blink.bin"
docker run --device /dev/ttyACM0 -t -v $(pwd):/app $TAG -- "arduino-cli upload -v -b arduino:mbed_nano:nano33ble -p /dev/ttyACM0 -i target/blink.bin"
