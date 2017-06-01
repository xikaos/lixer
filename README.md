# Lixer
Hightlights tcpdump packet time, source/destination and TCP flags on the fly. It does filter output and can be kind of buggy, so use it only to impress your parents.

## Instalation

`git clone https://github.com/xikaos/lixer && cd lixer`

## Usage

`sudo tcpdump -i wlan0 | elixir lib/lixer.exs`

Please *do not* use this for serious purposes, I just like some nice colors in terminal.
