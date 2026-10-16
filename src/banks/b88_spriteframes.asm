; Bank $88: sprite frames, then CenterIceMapNHL. Files in ROM order.

org $888000
incsrc "../data/gfx/SpriteFrames88.asm"
incsrc "../data/gfx/CenterIceMapNHL.asm"
FreeSpace88:
	%PadTo($898000)
