; A block for the sound CPU: sound RAM address, length, then the bytes.

DATA8_90E08C:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $1D,$52
	db $1D,$52
	incbin "DATA8_90E08C.spc":4..7510
