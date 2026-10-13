; Unidentified routine.
CODE_9F9811:
	lda.b $A5
	bit.w #$1000
	bne CODE_9F97FE
	lda.b $A5
	sta.b $A9
	and.w #$0FFF
	sta.b $A5
	jsl.l PushTime
	jsl.l CODE_9EC7BE
	lda.w #$0004
	sta.b $A5
	lda.w #$4000
	trb.b $A9
	beq CODE_9F983A
	lda.w #$0005
	sta.b $A5
CODE_9F983A:
	lda.w #$009F
	sta.b $8F
	lda.w #StatusTextTbl
	sta.b $8D
	jml.l CODE_9ECFC6
