; Graphics.

DATA8_95E304:		; tiles packed for DecompressLZ that screen setups send to VRAM; not identified yet
	db $10,$FB
	db $00,$0D,$00
	incbin "../../../Extracted/data/gfx/DATA8_95E304.chr.lz":5..1887
