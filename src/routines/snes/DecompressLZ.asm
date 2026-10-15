; LZ data at [p0] (after its header) to WRAM
DecompressLZ:
	lda.b p1
	sta.b LZOutAddr
	lda.b p1+2
	sta.b LZCopySrc+2
	stz.b LZCmd
	stz.b LZCmdByte2
	stz.b LZCmdByte3
	stz.b LZLenLo
	sep #$20
	ldy.w #$0005
.2:
	lda.b [p0],y
	iny
	sta.b LZCmd
	and.b #$80
	beq .t1
	jmp.w .t3

.t1:
	lda.b [p0],y
	iny
	sta.b LZCmdByte2
	lda.b LZCmd
	rep #$20
	and.w #$0003
	beq .1
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
.loop:
	lda.b [p0],y
	iny
	sta.w WMDATA
	dex
	bne .loop
.1:
	rep #$20
	lda.b LZCmd
	and.w #$0060
	asl a
	asl a
	asl a
	clc
	adc.b LZCmdByte2
	sta.b LZDistance
	lda.b LZOutAddr
	clc
	sbc.b LZDistance
	sta.b LZCopySrc
	lda.b LZCmd
	and.w #$001C
	lsr a
	lsr a
	clc
	adc.w #$0003
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sty.b LZSrcIdx
	ldy.w #$0000
	sep #$20
.loop2:
	lda.b [LZCopySrc],y
	iny
	sta.w WMDATA
	dex
	bne .loop2
	ldy.b LZSrcIdx
	jmp.w .2

.t3:
	lda.b LZCmd
	and.b #$40
	beq .t1x
	jmp.w .t2

.t1x:
	lda.b [p0],y
	iny
	sta.b LZCmdByte2
	lda.b [p0],y
	iny
	sta.b LZCmdByte3
	rep #$20
	lda.b LZCmdByte2
	asl a
	asl a
	xba
	and.w #$0003
	beq .1x
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
.loopx:
	lda.b [p0],y
	iny
	sta.w WMDATA
	dex
	bne .loopx
.1x:
	rep #$20
	lda.b LZCmdByte2
	and.w #$003F
	xba
	clc
	adc.b LZCmdByte3
	sta.b LZDistance
	lda.b LZOutAddr
	clc
	sbc.b LZDistance
	sta.b LZCopySrc
	lda.b LZCmd
	and.w #$003F
	clc
	adc.w #$0004
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
	sty.b LZSrcIdx
	ldy.w #$0000
.loop2x:
	lda.b [LZCopySrc],y
	iny
	sta.w WMDATA
	dex
	bne .loop2x
	ldy.b LZSrcIdx
	jmp.w .2

.t2:
	lda.b LZCmd
	and.b #$20
	beq .t1xx
	jmp.w .4

.t1xx:
	lda.b LZCmd
	rep #$20
	and.w #$0003
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	lda.b [p0],y
	xba
	sta.b LZDistance
	iny
	iny
	sep #$20
	lda.b [p0],y
	iny
	sta.b LZLenLo
	txa
	beq .1xx
.loopxx:
	lda.b [p0],y
	iny
	sta.w WMDATA
	dex
	bne .loopxx
.1xx:
	rep #$20
	clc
	lda.b LZOutAddr
	sbc.b LZDistance
	sta.b LZCopySrc
	lda.b LZCmd
	and.w #$000C
	lsr a
	lsr a
	xba
	clc
	adc.b LZLenLo
	adc.w #$0005
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
	sty.b LZSrcIdx
	ldy.w #$0000
.3:
	lda.b [LZCopySrc],y
	iny
	sta.w WMDATA
	dex
	bne .3
	ldy.b LZSrcIdx
	jmp.w .2
.4:
	lda.b LZCmd
	and.b #$1F
	asl a
	asl a
	adc.b #$04
	cmp.b #$71
	bcs .t1xxx
	rep #$20
	and.w #$00FF
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
.loopxxx:
	lda.b [p0],y
	iny
	sta.w WMDATA
	dex
	bne .loopxxx
	jmp.w .2

.t1xxx:
	lda.b LZCmd
	rep #$20
	and.w #$0003
	beq .1xxx
	tax
	clc
	adc.b LZOutAddr
	sta.b LZOutAddr
	sep #$20
.loopxxxx:
	lda.b [p0],y
	iny
	sta.w WMDATA
	dex
	bne .loopxxxx
.1xxx:
	rep #$20
	rts
