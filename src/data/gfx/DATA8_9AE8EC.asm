; Graphics.

DATA8_9AE8EC:		; an 18 x 3 map packed for DecompressRLE (width, height, , then the map words)
			;   read in bank $9B; not identified yet
	incbin "../../../Extracted/data/gfx/DATA8_9AE8EC.map.rle":0..45
