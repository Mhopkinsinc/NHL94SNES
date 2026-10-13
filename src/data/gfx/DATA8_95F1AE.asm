; Graphics.

DATA8_95F1AE:		; tiles packed for DecompressLZ that screen setups send to VRAM; not identified yet
	db $10,$FB
	db $00,$0D,$00
	incbin "DATA8_95F1AE.chr.lz":5..1816
