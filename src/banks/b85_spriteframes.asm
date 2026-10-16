; Bank $85: sprite frames, then PhotoPaletteBOS. Files in ROM order.

org $858000
incsrc "../data/gfx/SpriteFrames85.asm"
incsrc "../data/gfx/PhotoPaletteBOS.asm"
FreeSpace85:
	%PadTo($868000)
