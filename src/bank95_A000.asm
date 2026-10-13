; Bank $95, third 4 KB: the end of DATA8_959E48, then the start of SmallLetterSprites, a sprite set of small letters
; and digits.

org $95A000
	incbin "data/sound/DATA8_959E48.spc":440..2479
SmallLetterSprites:	; the letters A to Z, the digits 0 to 9 and a full stop as a DrawSprite sprite set, not packed;
			;   a text routine in bank $9C draws words with it, one frame per character
	incbin "data/gfx/SmallLetterSprites.spr":0..2057
