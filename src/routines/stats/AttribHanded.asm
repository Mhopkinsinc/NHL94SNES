; Roster column: left or right handed
AttribHanded:
	lda.b d0
	and.w #$0001
	eor.w #$0001
	sta.b d0
	lda.w #$009F
	sta.b $8F
	lda.w #HandedTextTbl
	sta.b a1
	jml.l PrintStringFromList
