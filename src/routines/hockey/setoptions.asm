; The game setup screen: up and down pick a line, left and right change it, Start goes on
setoptions:
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
	jsl.l ReadAnyPad
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
	jsr.w .12
	jsr.w .10
	jsr.w .11
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
	jsr.w .10
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
	jsl.l Readjoy1
	dec.w $0AC4
	jsl.l ProcessInputWithRepeat
	lda.b d1
	and.w #$FFF0
	sta.b d1
	beq .t2x
	jmp.w .6

.t2x:
	jsr.w .11
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
	jsr.w .12
	jsr.w .10
	jmp.w .3

.t1xxx:
	bit.w #$0800
	beq .2xx
	lda.w #$FFFE
	sta.b d0
	jsr.w .12
	jsr.w .10
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
	jsr.w .7
	jsr.w .10
	jmp.w .3
.7:
	lda.b d7
	cmp.w #$0000
	beq .1xxxx
	cmp.w #$0002
	beq .1xxxx
	cmp.w #$0004
	bne .2xxx
.1xxxx:
	lda.b d2
	beq .2xxx
	lda.w #$0005
	sta.l $7E345E
	lda.w #$0001
	sta.l $7E3456
	sta.l $7E3458
.2xxx:
	lda.w #$007E
	sta.b $93
	lda.w #$34BC
	sta.b a2
	lda.w #$009D
	sta.b $97
	lda.w #.14
	sta.b a3
	stz.b d5
	ldy.b d7
	lda.b [a3],y
	sta.b d4
	lda.b [a2],y
	sta.b d3
	lda.l $7E34BC
	cmp.w #$0002
	bcc .3xx
	cmp.w #$0004
	beq .3xx
	cpy.w #$0002
	bne .3xx
	lda.w #$001A
	sta.b d4
.3xx:
	jsr.w .9
	lda.b d3
	sta.b [a2],y
	lda.b d2
.8:
	rts
.9:
	lda.b d3
	clc
	adc.b d2
	sta.b d3
	sec
	sbc.b d5
	bmi .t1xxxx
	bvs .1xxxxx
	bra .2xxxx

.t1xxxx:
	bvs .2xxxx
.1xxxxx:
	lda.b d4
	dec a
	sta.b d3
.2xxxx:
	lda.b d3
	sec
	sbc.b d4
	bmi .t1xxxxx
	bvc .3xxx
	bra .8

.t1xxxxx:
	bvc .8
.3xxx:
	lda.b d5
	sta.b d3
	rts

.t1xxxxxx:
	lda.b d3
	clc
	adc.b d2
	cmp.w #$0000
	beq .5x
	cmp.w #$0003
	beq .5x
	cmp.w #$0005
	beq .5x
.4x:
	sta.b d3
	lda.b d3
	sta.b [a2],y
	bra .8
.5x:
	inc a
	cmp.w #$0005
	bcc .4x
	lda.w #$0001
	sta.b d3
	bra .4x
.10:
	lda.l $7E3456
	beq .1xxxxxx
	lda.l $7E34BE
	sta.w HomeTeam
	lda.l $7E34C0
	sta.w VisTeam
	jsl.l setteams
	lda.w #$0000
	sta.l $7E3456
.1xxxxxx:
	lda.l $7E35D0
	sta.b d2
	lda.w #$0020
	sta.b d0
	lda.w #$000E
	sta.b d1
	lda.w #$000E
	sta.w printy
	stz.w printx
	jsl.l eraser
	lda.b d7
	sta.b d6
	lda.w #$000E
	sta.w printy
	stz.b d2
	ldx.w #$0000
.4xx:
	lda.w #$3800
	sta.w $0D0D
	lda.w #$009D
	sta.b $8F
	lda.w #GameSetupNames
	sta.b a1
	stx.b d0
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b d0
	tax
	lda.l .13,x
	ldx.b d0
	cmp.w #$0000
	beq .6x
	bpl .2xxxxx
	lda.w #$009D
	sta.b $8F
	lda.w #PlayoffSetupNames
	sta.b a1
.2xxxxx:
	lda.w #$0003
	sta.w printx
	txa
	lsr a
	sta.b d0
	jsl.l PrintStringFromList
	lda.w #$0011
	sta.w printx
	stx.b d7
	jsr.w .7
	txy
	lda.w #$007E
	sta.b $8B
	lda.w #$34BC
	sta.b a0
	lda.b [a0],y
	sta.b d3
	lda.w #$009D
	sta.b $8B
	lda.w #.15
	sta.b a0
	clc
	adc.b [a0],y
	sta.b a0
.loopx:
	lda.b $8B
	sta.b $8F
	lda.b a0
	sta.b a1
	clc
	adc.b [a0]
	sta.b a0
	dec.b d3
	bpl .loopx
	cpx.b d6
	bne .3xxxx
	lda.w #$2000
	sta.w $0D0D
.3xxxx:
	stx.b d7
	cpx.w #$0002
	beq .7x
	cpx.w #$0004
	beq .7x
	jsl.l print
.5xx:
	inc.w printy
	inc.w printy
.6x:
	inx
	inx
	cpx.w #$000E
	bcs .t1xxxxxxx
	jmp.w .4xx

.t1xxxxxxx:
	lda.b d6
	sta.b d7
	rts
.7x:
	ldy.b d7
	lda.w #$007E
	sta.b $8F
	lda.w #$34BC
	sta.b a1
	lda.b [a1],y
	sta.b d3
	jsl.l CODE_9BC5AB
	jsl.l print
	bra .5xx
.11:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.w #$0004
	tax
	lda.l .13,x
	bne .t1xxxxxxxx
	lda.w #$001C
	sta.l $7E3454
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra .1xxxxxxx

.t1xxxxxxxx:
	lda.w VisTeam
	sta.l $7E3454
.1xxxxxxx:
	dex
	dex
	lda.l .13,x
	bne .t1xxxxxxxxx
	lda.w #$001D
	sta.l $7E3452
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w #$000A
	sta.b d0
	lda.w #$0002
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0001
	sta.l $7E3460
	bra .5xxx

.t1xxxxxxxxx:
	lda.w HomeTeam
	sta.l $7E3452
.5xxx:
	lda.l $7E3458
	dec a
	dec a
	sta.l $7E3458
	bmi .t1xxxxxxxxxx
	rts

.t1xxxxxxxxxx:
	jsl.l SpriteFrameStart
	jsr.w .t2xxx
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #GameSetupAlt
	sta.b a1
	jsl.l PrintLetterSprites
	lda.l $7E3454
	cmp.w #$001C
	bpl .1xxxxxxxx
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
.1xxxxxxxx:
	lda.l $7E3452
	cmp.w #$001C
	bpl .2xxxxxx
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
.2xxxxxx:
	lda.l $7E3452
	bpl .3xxxxx
	lda.w #$0000
	sta.b $8F
	lda.w #$0A5C
	sta.b a1
	stz.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
.3xxxxx:
	lda.l $7E3454
	bpl .4xxx
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
.4xxx:
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	rts

.t2xxx:
	lda.w #$0078
	sta.l $7E3458
	lda.l $7E345E
	inc a
	cmp.w #$0007
	bcc .1xxxxxxxxx
	lda.w #$0000
.1xxxxxxxxx:
	sta.l $7E345E
	cmp.w #$0006
	beq .rts
	lda.l $7E3452
	cmp.w #$001C
	bpl .2xxxxxxx
	lda.w #$FFFF
	sta.l $7E3452
	ldx.w #$0000
	jsr.w .t1xxxxxxxxxxx
.2xxxxxxx:
	lda.l $7E3454
	cmp.w #$001C
	bpl .3xxxxxx
	lda.w #$FFFF
	sta.l $7E3454
	ldx.w #$0002
	jsr.w .t1xxxxxxxxxxx
.3xxxxxx:
	stz.b a2
	lda.l $7E345E
	sta.l $7E345A
	lda.w #$0002
	sta.b a2
	lda.l $7E345E
	sta.l $7E345C
.rts:
	rts

.t1xxxxxxxxxxx:
	stx.b a2
	lda.l $7E345E
	jsl.l CODE_9DC973
	jsl.l PlayerShortName
	cpx.w #$0000
	bne .rtsx
	lda.b $8F
	sta.b $0E
	lda.b a1
	sta.b $0C
	lda.w #$0000
	sta.b $12
	lda.w #$0A5C
	sta.b $10
	ldx.w #$0031
	jsl.l MemCopy
.rtsx:
	rts
.12:
	phx
	lda.b d7
	sta.b d3
.2xxxxxxxx:
	lda.b d7
	clc
	adc.b d0
	sta.b d7
	bpl .1xxxxxxxxxx
	stz.b d7
.1xxxxxxxxxx:
	lda.b d7
	cmp.w #$000E
	bcc .t1xxxxxxxxxxxx
	lda.b d3
	sta.b d7
	bra .3xxxxxxx

.t1xxxxxxxxxxxx:
	lda.l $7E34BC
	asl a
	asl a
	asl a
	asl a
	adc.b d7
	tax
	lda.l .13,x
	beq .2xxxxxxxx
.3xxxxxxx:
	plx
	rts
.13:
	dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0000
	dw $0001,$0000,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$FFFF,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$FFFF,$0000,$0001,$0001,$0001,$0001,$0000
	dw $0001,$0001,$0001,$0000,$0000,$0000,$0001,$0000
	dw $0000
.14:
	dw $0005,$001C,$001C,$0003,$0003,$0003,$0002
.15:
	dw $000E,$005E,$005E,$005E,$009E,$00CE,$00FE
