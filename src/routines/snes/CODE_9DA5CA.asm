; Unidentified routine.
CODE_9DA5CA:
	jsl.l FadeOut
	lda.w #$0001
	sta.l $7E3474
	lda.w #$0000
	sta.l $7E3478
	lda.w #$FFFF
	sta.l $7E346C
	sta.l $7E346E
	lda.w #$0001
	sta.l $7E3460
	sta.l $7E3458
	sta.l $7E3456
	lda.w #$0005
	sta.l $7E345E
	jsl.l forceblack
	jsl.l ClearTextMap
	jsl.l CODE_9DE074
	lda.l $7E34BE
	sta.w HomeTeam
	lda.l $7E34C0
	sta.w VisTeam
	jsl.l setteams
	lda.w VisTeam
	clc
	adc.w #$0021
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l SetupScreen
	sep #$20
	lda.b #$01
	sta.w BGMODE
	rep #$20
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #GameSetupTitle
	sta.b a1
	jsl.l PrintLetterSprites
	lda.w #$1D47
	sta.l $7F750A
	lda.w #$FFFF
	sta.l $7F750E
	lda.w #$14A5
	sta.l $7F7682
	lda.w #$6F7B
	sta.l $7F75C2
	jsl.l SendColours
	jsl.l SpriteFrameEnd
	jsl.l SendTextMap
	jsl.l ReadPads
	jsl.l CODE_9B8526
	lda.w #$0000
	sta.w $0CCB
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5A3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l InitSortObjects
	lda.w #$0028
	sta.w $0E43
	sta.w $0E4F
	lda.w #$FFFF
	sta.l $7E34CC
	lda.b a2
	pha
	lda.w #$0000
	sta.b a2
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9B9334
	pla
	sta.b a2
	stz.b d7
	stz.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jsr.w CODE_9DAA83
	jsl.l ReadPads
	jsl.l CODE_9DDFF6
	jsl.l ScreenOn
	lda.w #$0008
	ldx.w #$0040
	jsl.l CODE_9DCCF5
	jsl.l SendTextMap
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
.3:
	lda.w #$12C0
	sta.b d6
.2:
	jsl.l WaitFrame
	lda.w OAMReady
	bne .2
	inc.w $0792
	bne .1
	inc.w $0794
.1:
	jsl.l WaitFrame
	ldx.w $1A0E
	txa
	eor.b $AF
	bne .t5
	jmp.w .t6

.t5:
	stx.b $AF
	txa
	beq .t4
	bit.w #$0001
	bne .t1
	bit.w #$0002
	bne .t2
	bit.w #$0004
	bne .t3
	bra .t6

.t1:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DAFB2
	bra .t6

.t2:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DB005
	bra .t6

.t3:
	jsl.l CODE_9DAFAD
	jsl.l CODE_9DB058
	bra .t6

.t4:
	jsl.l Multi5Init
	jsl.l CODE_9DB0FD
	jsr.w CODE_9DA973
	stz.b d1
	jmp.w .6

.t6:
	lda.w $1A0E
	beq .t1x
	jmp.w .2

.t1x:
	jsl.l ReadPads
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	jsl.l CODE_9B84F5
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d1
	and.w #$FFF0
	sta.b d1
	beq .t2x
	jmp.w .6

.t2x:
	jsr.w CODE_9DAA83
	jsl.l QueueTextDMA
	dec.b d6
	dec.b d6
	bmi .t1xx
	jmp.w .2

.t1xx:
	lda.w #$001C
	jsl.l randoma8
	sta.l $7E34BE
	sta.w HomeTeam
.loop:
	lda.w #$001C
	jsl.l randoma8
	cmp.l $7E34BE
	beq .loop
	sta.l $7E34C0
	sta.w VisTeam
	lda.w #$0000
	sta.l $7E34CC
	lda.w #$0000
	sta.l $7E34BC
	sta.l $7E34CA
.5:
	lda.w #$009A
	sta.b $0E
	lda.w #DATA8_9AB610
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4EF4
	sta.b $10
	jsl.l Decompress
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	stx.b $00
	jsl.l LinearToPlanar
	lda.w #$0000
	sta.l $7E3474
	lda.l $7E34BC
	cmp.w #$0002
	beq .1x
	cmp.w #$0003
	bne .2x
.1x:
	jsl.l NewPO
.2x:
	lda.w #$0001
	sta.l $7E34CA
	lda.l $7E34BC
	cmp.w #$0001
	bcc .3x
	cmp.w #$0004
	bcs .3x
	lda.w #$0005
	sta.l $7E34CA
.3x:
	lda.l $7E34CA
	sec
	sbc.w #$0005
	sta.l $7E34CE
	lda.l $7E34BC
	cmp.w #$0001
	bne .4
	jsl.l PasswordScreen
.4:
	lda.w #$0080
	ora.l PassWord
	sta.l PassWord
	jsl.l maketree
	jmp.w CODE_9DA0D5
.6:
	lda.b d1
	bit.w #$1000
	beq .t2xx
	jmp.w .5

.t2xx:
	bit.w #$0400
	beq .t1xxx
	lda.w #$0002
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
	jmp.w .3

.t1xxx:
	bit.w #$0800
	beq .2xx
	lda.w #$FFFE
	sta.b d0
	jsr.w CODE_9DAC4F
	jsr.w CODE_9DA973
.1xx:
	jmp.w .3
.2xx:
	lda.w #$0001
	sta.b d2
	lda.b d1
	bit.w #$0100
	bne .1xxx
	bit.w #$0200
	beq .1xx
	lda.w #$FFFF
	sta.b d2
.1xxx:
	jsr.w CODE_9DA8B8
	jsr.w CODE_9DA973
	jmp.w .3
