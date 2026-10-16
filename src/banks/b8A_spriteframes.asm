; Bank $8A: sprite frames, then LicenceNHLMap. Files in ROM order.

org $8A8000
incsrc "../data/gfx/SpriteFrames8A.asm"
incsrc "../data/gfx/LicenceNHLMap.asm"
FreeSpace8A:
	%PadTo($8B8000)
