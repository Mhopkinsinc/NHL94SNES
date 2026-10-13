; Bank $90, first 4 KB: the start of a run of SNES 4bpp tiles, not packed, that the play code in bank $9B copies to VRAM
; as animation frames (the first ones are crowd graphics). From data/gfx/DATA8_908000.chr; it continues in the
; following files.

org $908000
DATA8_908000:		; tiles, 32 bytes each
	incbin "data/gfx/DATA8_908000.chr":0..4096
