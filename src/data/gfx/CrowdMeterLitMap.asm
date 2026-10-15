; The crowd meter bar, lit (18 x 3); ShowCrowdMeter pastes as many columns as the level

CrowdMeterLitMap:		; an 18 x 3 map packed for DecompressRLE (width, height, , then the map words)
			;   read in bank $9B
	incbin "../../../Extracted/data/gfx/DATA8_9AE8EC.map.rle":0..45
