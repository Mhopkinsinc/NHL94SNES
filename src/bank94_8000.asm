; Bank $94, first 4 KB: DATA8_948000, packed tiles of logo pieces, then the start of DATA8_948D6F, a block for the
; sound CPU (upload list DATA8_80DD16).

org $948000
DATA8_948000:		; tiles packed for DecompressLZ, unpacked by a screen setup in bank $9D: logo pieces with a (R) mark
	db $10,$FB
	db $00,$16,$E0
	incbin "data/gfx/DATA8_948000.chr.lz":5..3439
DATA8_948D6F:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0C,$8D
	db $0C,$8D
	incbin "data/sound/DATA8_948D6F.spc":4..657
