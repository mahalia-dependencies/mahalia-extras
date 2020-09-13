echo INPUT
echo =====
echo 'system:capture_1; Left BTE - Front Mic'
sudo i2cset -f -y 2 0x38 0x40 0x0a
sudo i2cget -f -y 2 0x38
sudo i2cset -f -y 2 0x38 0x40 0x0b
sudo i2cget -f -y 2 0x38
sudo i2cset -f -y 2 0x38 0x40 0x0e
sudo i2cget -f -y 2 0x38
echo 

echo 'system:capture_2; Right BTE - Front Mic'
sudo i2cset -f -y 2 0x38 0x40 0x0c
sudo i2cget -f -y 2 0x38
sudo i2cset -f -y 2 0x38 0x40 0x0d
sudo i2cget -f -y 2 0x38
sudo i2cset -f -y 2 0x38 0x40 0x0f
sudo i2cget -f -y 2 0x38
echo

echo 'system:capture_5; Left BTE - Rear Mic'
sudo i2cset -f -y 2 0x39 0x40 0x0a
sudo i2cget -f -y 2 0x39
sudo i2cset -f -y 2 0x39 0x40 0x0b
sudo i2cget -f -y 2 0x39
sudo i2cset -f -y 2 0x39 0x40 0x0e
sudo i2cget -f -y 2 0x39
echo

echo 'system:capture_6; Right BTE - Rear Mic'
sudo i2cset -f -y 2 0x39 0x40 0x0c
sudo i2cget -f -y 2 0x39
sudo i2cset -f -y 2 0x39 0x40 0x0d
sudo i2cget -f -y 2 0x39
sudo i2cset -f -y 2 0x39 0x40 0x0f
sudo i2cget -f -y 2 0x39
echo

echo 'system:capture_3; Left Headphone Mic'
sudo i2cset -f -y 2 0x3a 0x40 0x0a
sudo i2cget -f -y 2 0x3a
sudo i2cset -f -y 2 0x3a 0x40 0x0b
sudo i2cget -f -y 2 0x3a
sudo i2cset -f -y 2 0x3a 0x40 0x0e
sudo i2cget -f -y 2 0x3a
echo

echo 'system:capture_7; Right Headphone Mic'
sudo i2cset -f -y 2 0x3a 0x40 0x0c
sudo i2cget -f -y 2 0x3a
sudo i2cset -f -y 2 0x3a 0x40 0x0d
sudo i2cget -f -y 2 0x3a
sudo i2cset -f -y 2 0x3a 0x40 0x0f
sudo i2cget -f -y 2 0x3a
echo

echo OUTPUT
echo ======
echo 'system:playback_1; Left BTE speaker'
sudo i2cset -f -y 2 0x38 0x40 0x23
sudo i2cget -f -y 2 0x38
echo

echo 'system:playback_2; Right BTE Speaker'
sudo i2cset -f -y 2 0x39 0x40 0x23
sudo i2cget -f -y 2 0x39
echo

echo 'system:playback_3; Left Headphone Speaker'
sudo i2cset -f -y 2 0x3A 0x40 0x23
sudo i2cget -f -y 2 0x3A
echo

echo 'system:playback_5'
sudo i2cset -f -y 2 0x38 0x40 0x24
sudo i2cget -f -y 2 0x38
echo

echo 'system:playback_6'
sudo i2cset -f -y 2 0x39 0x40 0x24
sudo i2cget -f -y 2 0x39
echo

echo 'system:playback_7; Right Headphone Speaker'
sudo i2cset -f -y 2 0x3A 0x40 0x24
sudo i2cget -f -y 2 0x3A
