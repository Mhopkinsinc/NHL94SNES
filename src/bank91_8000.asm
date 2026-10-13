; Bank $91, first 4 KB: blocks for the sound CPU (SPCUploadBlock) from the sound upload lists in bank80_E000, from
; data assets cut from the ROM; they continue in the following files.

org $918000
DATA8_918000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $19,$CE
	db $19,$CE
	incbin "data/sound/DATA8_918000.spc":4..4096
