; Bank $92, first 4 KB: blocks for the sound CPU (SPCUploadBlock) from the sound upload list DATA8_80DD16 in
; bank80_D000, from data assets cut from the ROM; they continue in the following files.

org $928000
DATA8_928000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $00,$12
	db $13,$EF
	incbin "data/sound/DATA8_928000.spc":4..4096
