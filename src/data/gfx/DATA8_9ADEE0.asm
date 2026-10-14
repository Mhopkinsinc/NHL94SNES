; Graphics.

DATA8_9ADEE0:		; a 12 x 12 map of bytes (width, height, , then a byte per entry) packed for
			;   DecompressRLE, read by a screen setup in bank $9D; not identified yet
	incbin "../../../Extracted/data/gfx/DATA8_9ADEE0.map.rle":0..121
