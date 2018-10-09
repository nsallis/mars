IMAGE=~/.tmp/i3lock.png
SCREENSHOT="scrot $IMAGE" # 0.46s
BLURTYPE="0x7"
$SCREENSHOT
convert $IMAGE -blur $BLURTYPE $IMAGE
i3lock -i $IMAGE
rm $IMAGE
