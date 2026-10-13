; Bank $9A, first 4 KB: DATA8_9A8000, a block for the sound CPU (upload list DATA8_80E6FD), then DATA8_9A801F, a
; player photo, then DATA8_9A8225, a player photo, then DATA8_9A842A, a player photo, then DATA8_9A862E, a player
; photo, then DATA8_9A8832, a player photo, then DATA8_9A8A31, a player photo, then DATA8_9A8C2C, a player photo, then
; the start of DATA8_9A8E26, a player photo.

org $9A8000
DATA8_9A8000:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $00,$09
	db $00,$1B
	incbin "../Extracted/data/DATA8_9A8000.spc":4..31
DATA8_9A801F:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A801F.lin.huf":5..517
	db $00
DATA8_9A8225:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A8225.lin.huf":5..517
DATA8_9A842A:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A842A.lin.huf":5..516
DATA8_9A862E:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A862E.lin.huf":5..516
DATA8_9A8832:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A8832.lin.huf":5..510
	db $00
DATA8_9A8A31:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A8A31.lin.huf":5..507
DATA8_9A8C2C:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A8C2C.lin.huf":5..506
DATA8_9A8E26:		; a player photo: 6 x 6 linear 4bpp tiles packed for DecompressHuffman, one entry of the photo table
			;   in bank $9D
	db $30,$FB
	db $00,$04,$80
	incbin "../Extracted/data/DATA8_9A8E26.lin.huf":5..474
