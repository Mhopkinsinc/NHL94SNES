; check for the multitap, then clear the multitap pads and state
Multi5Init:		; check for the multitap, then clear the multitap pads and state
	jsl.l Multi5ConnectCheck
	lda.w #$000F
	sta.w JoyPad+4
	sta.w JoyPad+6
	sta.w JoyPad+8
	stz.w $1A0C
	stz.w $1A0E
	stz.w $1A04
	stz.w $1A02
	lda.w $1A00
	and.w #$0080
	beq .t1
	lda.w #$0001
	tsb.w $1A0E
	bra .1

.t1:
	lda.w #$0001
	trb.w $1A0E
.1:
	lda.w $1A00
	and.w #$0040
	beq .t1x
	lda.w #$0001
	tsb.w $1A0C
	bra .2

.t1x:
	lda.w #$0001
	trb.w $1A0C
.2:
	rtl
	db "START OF MULTI5 CONNECT CHECK"
