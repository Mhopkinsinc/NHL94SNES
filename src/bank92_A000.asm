; Bank $92, third 4 KB: the end of DATA8_9293F3, then LetterSprites, a sprite set of the letters A to Z.

org $92A000
	incbin "data/sound/DATA8_9293F3.spc":3085..5062
LetterSprites:		; the letters A to Z as a DrawSprite sprite set, not packed: frame offsets, then the frames;
			;   a text routine in bank $9C draws words with it, one frame per letter
	incbin "data/gfx/LetterSprites.spr":0..2119
