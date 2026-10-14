; Unidentified routine.
assbench:
	lda.w temp1,x
	cmp.w #$0064
	bne .t2
	jmp.w CODE_9FD96E

.t2:
	jsl.l check4bench
	lda.w pflags,x
	bit.w #$4000
	beq .t1x
.1x:
	jml.l CODE_9E8BE6

.t1x:
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	lda.w #$0050
	sta.b d0
	lda.w pfteam,x
	bne .1xx
	lda.w #$FFB0
	sta.b d0
.1xx:
	lda.b d0
	sta.w temp4,x
	lda.w #$FF70
	sta.w temp3,x
	stz.w temp1,x
.2:
	lda.w newpnum,x
	cmp.w pnum,x
	bne .t3
.3:
	jmp.w CODE_9FD9C2

.t3:
	lda.w position,x
	bne .1x2
	lda.w $0B05,x
	ora.w #$0003
	sta.w $0B05,x
.1x2:
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bmi .t1x2
	jmp.w CODE_9FD99D

.t1x2:
	lda.w temp1,x
	adc.w #$0008
	sta.w temp1,x
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	bit.w #$8000
	beq .2x
.1xx2:
	eor.w #$FFFF
	inc a
.2x:
	cmp.w #$0029
	bcc .t2x
	jmp.w CODE_9FD99D

.t2x:
	lda.w Xpos,x
	sec
	sbc.w temp3,x
	sta.b d0
	sec
	sbc.w #$0020
	beq .t1xx
	bmi .t1xx
	jmp.w CODE_9FD99D

.t1xx:
	lda.w #SPAglide
	ldy.w position,x
	bne .1x2x
	lda.w #SPAgready
.1x2x:
	jsl.l SetSPAFromA
	lda.w #$0001
	sta.w pfnc,x
	lda.w facedir,x
	cmp.w #$0004
	beq .2xx
	inc a
	and.w #$0007
	sta.w facedir,x
.2xx:
	stz.w Yvel,x
	lda.w #$F800
	sta.w Xvel,x
	lda.b d0
	sec
	sbc.w #$0010
	beq .3x
	bpl CODE_9FD96D
.3x:
	stz.w Xvel,x
	lda.w facedir,x
	cmp.w #$0004
	bne CODE_9FD96D
	lda.w #$F800
	sta.w Xvel,x
	lda.w #$0002
	sta.w facedir,x
	lda.w #SPAwallleft
	ldy.w position,x
	bne .4
	lda.w #DATA8_9DE484
.4:
	jsl.l SetSPAFromA
	lda.w #$0064
	sta.w temp1,x
	sta.w pfalock,x
CODE_9FD96D:
	rtl
