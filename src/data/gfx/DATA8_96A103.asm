; Graphics.

DATA8_96A103:		; tiles packed for DecompressPairs that screen setups in banks $9D and $9F send to VRAM; not identified yet
	db $46,$FB
	db $00,$0D,$40
	incbin "DATA8_96A103.chr.pairs":5..1250
