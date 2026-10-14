; Unidentified routine.
CODE_9C9981:
	rep #$30
	lda.w SoundLock
	and.w #$00FF
	bne .3
	lda.w $1D68
	cmp.w #$0002
	beq .3
	lda.w gmclock
	bne .2
	lda.w MusicOn
	beq .t1
	bra .2

.t1:
	stz.w $0CC3
.2:
	lda.l $7E35E6
	beq .3
	lda.l $7E35E8
	beq .t2
	jmp.w .6

.t2:
	lda.l $7E35E6
	cmp.l $7E35EA
	beq .t1x
.loop:
	jsl.l SPCCmd02
	cmp.w #$0015
	bcc .4
.1:
	jsl.l SPCCmd04
	bra .loop

.t1x:
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l QueueSound
	lda.w #$0003
	sta.l $7E35E8
.3:
	rtl
.4:
	lda.l $7E35E6
	sta.l $7E35EA
	asl a
	asl a
	tax
	lda.l DATA8_9C9A5B-4,x
	sta.b $3E
	lda.l DATA8_9C9A5B-2,x
	sta.b $40
	ldy.w #$0000
	lda.b [$3E],y
	xba
	sta.b $42
	ldy.w #$0002
	lda.b [$3E],y
	xba
	tax
	ldy.b $42
	lda.b $3E
	clc
	adc.w #$0004
	sta.b $3E
	jsl.l SPCStreamStart
	lda.w #$0001
	sta.l $7E35E8
.5:
	rtl
.6:
	cmp.w #$0003
	beq .1x
	jsl.l SPCStreamNext
	cmp.w #$0000
	beq .t1xx
	lda.l $7E35E8
	cmp.w #$0001
	bne .5
	lda.w #$0002
	sta.l $7E35E8
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l QueueSound
	rtl

.t1xx:
	lda.w #$0003
	sta.l $7E35E8
.1x:
	rtl
