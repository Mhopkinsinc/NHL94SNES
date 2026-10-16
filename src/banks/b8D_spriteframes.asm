; Bank $8D: sprite frames, then CenterIceTilesCGY. Files in ROM order.

org $8D8000
incsrc "../data/gfx/SpriteFrames8D.asm"
incsrc "../data/gfx/CenterIceTilesCGY.asm"
FreeSpace8D:
	%PadTo($8E8000)
