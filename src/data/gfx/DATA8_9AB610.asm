; Graphics.

DATA8_9AB610:		; packed for DecompressHuffman, unpacked into a RAM buffer by screen setups; not identified yet
	db $30,$FB
	db $00,$06,$40
	incbin "DATA8_9AB610.huf":5..401
