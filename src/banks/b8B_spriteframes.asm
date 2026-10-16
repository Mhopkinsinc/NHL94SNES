; Bank $8B: sprite frames, then SongCharge. Files in ROM order.

org $8B8000
incsrc "../data/gfx/SpriteFrames8B.asm"
incsrc "../data/sound/SongCharge.asm"
FreeSpace8B:
	%PadTo($8C8000)
