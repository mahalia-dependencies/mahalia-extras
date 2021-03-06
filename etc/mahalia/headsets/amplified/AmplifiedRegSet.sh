# AMPLIFIED Headset (PGA = 0 dB)

INPUT

# system:capture_1; Left BTE - Front Mic
sudo i2cset -f -y 2 0x38 0x40 0x0a 0x0B i
sudo i2cset -f -y 2 0x38 0x40 0x0b 0x00 i
sudo i2cset -f -y 2 0x38 0x40 0x0e 0x00 i

# system:capture_2; Right BTE - Front Mic
sudo i2cset -f -y 2 0x39 0x40 0x0a 0x0B i
sudo i2cset -f -y 2 0x39 0x40 0x0b 0x00 i
sudo i2cset -f -y 2 0x39 0x40 0x0e 0x00 i

# system:capture_5; Left BTE - Rear Mic
sudo i2cset -f -y 2 0x38 0x40 0x0c 0x0B i
sudo i2cset -f -y 2 0x38 0x40 0x0d 0x00 i
sudo i2cset -f -y 2 0x38 0x40 0x0f 0x00 i

# system:capture_6; Right BTE - Rear Mic
sudo i2cset -f -y 2 0x39 0x40 0x0c 0x0B i
sudo i2cset -f -y 2 0x39 0x40 0x0d 0x00 i
sudo i2cset -f -y 2 0x39 0x40 0x0f 0x00 i

# system:capture_3; Left Headphone Mic
sudo i2cset -f -y 2 0x3a 0x40 0x0a 0x01 i
sudo i2cset -f -y 2 0x3a 0x40 0x0b 0x08 i
sudo i2cset -f -y 2 0x3a 0x40 0x0e 0x97 i

# system:capture_7; Right Headphone Mic
sudo i2cset -f -y 2 0x3a 0x40 0x0c 0x01 i
sudo i2cset -f -y 2 0x3a 0x40 0x0d 0x08 i
sudo i2cset -f -y 2 0x3a 0x40 0x0f 0x97 i


#OUTPUT

# system:playback_1; Left BTE speaker
sudo i2cset -f -y 2 0x38 0x40 0x23 0xE7 i
# system:playback_2; Right BTE Speaker
sudo i2cset -f -y 2 0x39 0x40 0x23 0xE7 i
# system:playback_3; Left Headphone Speaker
sudo i2cset -f -y 2 0x3A 0x40 0x23 0xE7 i
# system:playback_5
sudo i2cset -f -y 2 0x38 0x40 0x24 0xE7 i
# system:playback_6
sudo i2cset -f -y 2 0x39 0x40 0x24 0xE7 i
# system:playback_7; Right Headphone Speaker
sudo i2cset -f -y 2 0x3A 0x40 0x24 0xE7 i

