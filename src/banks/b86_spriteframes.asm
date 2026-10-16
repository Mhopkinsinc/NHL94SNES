; Bank $86: sprite frames, then CenterIceTilesVAN. Files in ROM order.

org $868000
incsrc "../data/gfx/SpriteFrames86.asm"
incsrc "../data/gfx/CenterIceTilesVAN.asm"
FreeSpace86:
	%PadTo($878000)
