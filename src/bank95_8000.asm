; Bank $95, first 4 KB: DATA8_958000, a block for the sound CPU (upload lists DATA8_80E6C1 and DATA8_80E6FD), then the
; start of DATA8_958ABD, a block for the sound CPU (upload list DATA8_80DD16).

org $958000
DATA8_958000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0A,$B9
	db $0A,$B9
	incbin "../Extracted/data/DATA8_958000.spc":4..2749
DATA8_958ABD:		; for SPCUploadBlock, as DATA8_958000
	db $09,$CF
	db $09,$CF
	incbin "../Extracted/data/DATA8_958ABD.spc":4..1347
