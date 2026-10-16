; Bank $87: sprite frames, then LicenceNHLPAMap. Files in ROM order.

org $878000
incsrc "../data/gfx/SpriteFrames87.asm"
incsrc "../data/gfx/LicenceNHLPAMap.asm"
FreeSpace87:
	%PadTo($888000)
