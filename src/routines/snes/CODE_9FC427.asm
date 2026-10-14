; Unidentified routine.
CODE_9FC427:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b a2
	pha
	lda.b $93
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	jsl.l GetPlayerRecord
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b [a1]
	inc.b a1
	inc.b a1
	lda.b [a0]
	sta.b d0
	clc
	adc.b a0
	sta.b a2
	lda.b $8B
	sta.b $93
	inc.b a0
	inc.b a0
	lda.b [a0]
	inc.b a0
	sta.b [a1]
	inc.b a1
	lda.w #$002E
	sta.b [a1]
	inc.b a1
.loop:
	lda.b [a0]
	inc.b a0
	and.w #$00FF
	cmp.w #$0020
	bne .loop
.loop2:
	lda.b [a0]
	inc.b a0
	sta.b [a1]
	inc.b a1
	lda.b a0
	cmp.b a2
	bne .loop2
	jsl.l MesAreaDone
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $93
	pla
	sta.b a2
	pla
	sta.b $A7
	pla
	sta.b d0
	rtl
