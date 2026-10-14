; Unidentified routine.
CODE_9C9981:
	rep #$30
	lda.w SoundLock
	and.w #$00FF
	bne CODE_9C99E4
	lda.w $1D68
	cmp.w #$0002
	beq CODE_9C99E4
	lda.w gmclock
	bne CODE_9C99A2
	lda.w MusicOn
	beq .t1
	bra CODE_9C99A2

.t1:
	stz.w $0CC3
CODE_9C99A2:
	lda.l $7E35E6
	beq CODE_9C99E4
	lda.l $7E35E8
	beq .t2
	jmp.w CODE_9C9A21

.t2:
	lda.l $7E35E6
	cmp.l $7E35EA
	beq .t1
.loop:
	jsl.l SPCCmd02
	cmp.w #$0015
	bcc CODE_9C99E5
.1:
	jsl.l SPCCmd04
	bra .loop

.t1:
	lda.l $7E35E6
	asl a
	tax
	lda.w #$7000
	sta.b $64
	lda.l DATA8_9C9A73-2,x
	jsl.l CODE_80A17D
	lda.w #$0003
	sta.l $7E35E8
CODE_9C99E4:
	rtl
