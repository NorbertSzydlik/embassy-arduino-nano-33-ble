# Rust on Arduino nano 33 BLE
This package is minimal example how to run program written in Rust on Arduino Nano 33 BLE using Embassy framework.
It uses Nordic nRF52480 processor, but it has different interface to flash new software than examples from `embassy-rs`.

# Compile and flash program to the device
To flash this example package, simply run `./build.sh`. You need to have Docker installed on your system.
You may need to change path to device from `/dev/ttyACM0` to something different in `build.sh` file.

## Compile and flash without docker
Using Docker is not strictly necessary and it exists to document what dependecies need to be installed on the system to use this example.
You can compile and flash it yourself using following commands:
* `cargo build --target thumbv7em-none-eabihf --release`
* `arm-none-eabi-objcopy -O binary target/thumbv7em-none-eabihf/release/embassy-arduino-nano-33-blink target/blink.bin`
* `arduino-cli upload -v -b arduino:mbed_nano:nano33ble -p /dev/ttyACM0 -i target/blink.bin`

# Why not use probe-rs?
As far as I know Arduino uses bossac to flash the device and probe-rs does not support it.

# Troubleshooting

## No device found on TTYACM0

* Check if device is connected with `lsusb`.
* Check if device is present on different tty, e.g: /dev/ttyACM1 with `ls /dev | grep ACM`
* Check if you have write permission `stty -F /dev/ttyACM0 1200`
