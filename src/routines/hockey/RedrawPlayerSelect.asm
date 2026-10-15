; Clear the message rows and redraw the PlayerSelectAlt title and the team pictures
RedrawPlayerSelect:
	jsl.l ClearTextMapBottom
	jsl.l SpriteFrameStart
	ldx.w #$0047
	ldy.w #$0018
	lda.w #PlayerSelectAlt>>16
	sta.b a1+2
	lda.w #PlayerSelectAlt
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l DrawMatchupPictures
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
