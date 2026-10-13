; Bank $93, second 4 KB: the end of DATA8_938000, then the start of DATA8_9390FA, a block for the sound CPU (upload
; list DATA8_80E6FD).

org $939000
	incbin "../Extracted/data/DATA8_938000.chr.huf":4096..4346
DATA8_9390FA:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0D,$9B
	db $10,$8F
	incbin "../Extracted/data/DATA8_9390FA.spc":4..3846
