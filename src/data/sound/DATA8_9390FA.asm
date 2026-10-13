; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_9390FA:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $0D,$9B
	db $10,$8F
	incbin "DATA8_9390FA.spc":4..4243
