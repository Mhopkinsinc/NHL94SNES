; Bank $82: sprite frames, then CenterIceTilesHFD. Files in ROM order.

org $828000
incsrc "../data/gfx/SpriteFrames82.asm"
incsrc "../data/gfx/CenterIceTilesHFD.asm"
FreeSpace82:
	%PadTo($838000)
