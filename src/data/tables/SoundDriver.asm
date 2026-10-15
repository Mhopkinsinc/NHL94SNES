; The sound CPU (SPC700) program, uploaded at reset by SPCIPLUpload (Reset_Fast) to sound RAM $0400 and started there.
; It clears sound RAM above itself, sets up the DSP and then serves commands: the CPU writes a command number to port 0
; (data in ports 1-3), the handler replies on port 0 and the main loop waits for the CPU to clear it. Samples go in a
; directory at $0200 (start, loop point per sample) and in sound RAM from .samplearea up. The 65816 side is SPCCmd01-
; SPCCmd0E, SPCUploadBlock, SPCDownload and the stream routines.

; SPC700 I/O registers
SPC_CONTROL = $F1
SPC_DSPADDR = $F2
SPC_DSPDATA = $F3
SPC_PORT0 = $F4
SPC_PORT1 = $F5
SPC_PORT2 = $F6
SPC_PORT3 = $F7
SPC_T0TARGET = $FA
; DSP registers
DSP_MVOLL = $0C
DSP_MVOLR = $1C
DSP_EVOLL = $2C
DSP_EVOLR = $3C
DSP_KON = $4C
DSP_KOF = $5C
DSP_FLG = $6C
DSP_EFB = $0D
DSP_PMON = $2D
DSP_NON = $3D
DSP_EON = $4D
DSP_DIR = $5D
DSP_ESA = $6D
DSP_EDL = $7D
DSP_C0 = $0F
DSP_C1 = $1F
DSP_C2 = $2F
DSP_C3 = $3F
DSP_C4 = $4F
DSP_C5 = $5F
DSP_C6 = $6F
DSP_C7 = $7F
; driver variables (sound RAM direct page)
spcSampleCount = $00
spcFreePtr = $03
spcSendLen = $05
spcUploadSample = $07
spcUploadLoop = $09
spcSendPtr = $0B
spcFLG = $0D
spcClearPtr = $0E
spcClearPages = $10
spcClearBytes = $11

SoundDriver:		; the sound CPU program as SPCIPLUpload blocks: length, sound RAM address, bytes; length 0 ends it
		;   with the start address
	dw .end-.code,$0400
.code:
	arch spc700
	base $0400
.start:		; clear sound RAM from .samplearea up, set up the DSP (sample directory at $0200, echo off),
		;   timer 0, then wait for commands
	clrp
	mov x,#$FF
	mov sp,x
	mov a,#.samplearea&$FF
	mov.b spcClearPtr,a
	mov a,#.samplearea>>8
	mov.b spcClearPtr+1,a
	mov a,#$FF
	setc
	sbc.b a,spcClearPtr
	mov.b spcClearBytes,a
	mov a,#$FE
	setc
	sbc.b a,spcClearPtr+1
	mov.b spcClearPages,a
	mov.b x,spcClearBytes
	mov y,#$00
	mov a,#$00
.l0420:
	mov.b (spcClearPtr)+y,a
	inc y
	dec x
	bne .l0420
	inc.b spcClearPtr+1
	mov.b spcClearPtr,a
	mov y,#$00
	mov.b x,spcClearPages
.l042E:
	mov.b (spcClearPtr)+y,a
	inc y
	bne .l042E
	inc.b spcClearPtr+1
	dec x
	bne .l042E
	mov.b (spcClearPtr)+y,a
	mov y,#$BF
.l043C:
	mov.b (spcClearPtr)+y,a
	dec y
	bne .l043C
	mov a,#$20
	mov.b spcFLG,a
	mov y,#DSP_FLG
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov y,#DSP_MVOLL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_MVOLR
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$90
	mov.b SPC_CONTROL,a
	mov a,#$10
	mov.b SPC_T0TARGET,a
	mov a,#$81
	mov.b SPC_CONTROL,a
	mov a,#$00
	mov.b spcSampleCount,a
	mov a,#.samplearea&$FF
	mov.b spcFreePtr,a
	mov a,#.samplearea>>8
	mov.b spcFreePtr+1,a
	mov a,#$02
	mov y,#DSP_DIR
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$FF
	mov y,#DSP_KON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$FF
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov y,#DSP_EVOLL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_EVOLR
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_EFB
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$01
	mov y,#DSP_ESA
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_EDL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov y,#DSP_PMON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_NON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov y,#DSP_EON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov.b SPC_PORT1,a
	mov.b SPC_PORT2,a
	jmp .mainloop
.reply:		; A = the reply on port 0; wait until the CPU clears port 0
	mov.b SPC_PORT0,a
.l04D2:
	mov.b a,SPC_PORT0
	bne .l04D2
.mainloop:		; port 0 = 0, wait for a command number on port 0 (read twice), then jump to its handler
	mov a,#$00
	mov.b SPC_PORT0,a
.l04DA:
	mov.b a,SPC_PORT0
	beq .l04DA
	nop
	nop
	cmp.b a,SPC_PORT0
	bne .l04DA
	asl a
	mov x,a
	jmp (.cmdtable+x)
.bits:		; the bit of each voice (KON / KOF), 8 bytes
	db $01,$02,$04,$08,$10,$20
.cmdtable:		; jmp (.cmdtable+x) with x = command * 2, so its first word (the last two .bits) is no command
	db $40,$80
	dw .cmdReset,.cmdStatus,.cmdUpload,.cmdUnload,.cmdKeyOff,.cmdKeyOn,.cmdSetVoice,.cmdSetMaster,.cmdSetEcho,.cmdSetFIR,.cmdSetPitch,.cmdSetGain,.cmdKeyOffAll,.cmdSetVolume,.cmdStreamStart,.cmdStreamNext,.cmdDownload
.cmdReset:		; $01: empty the sample area (no samples, the free pointer at .samplearea) and key off every voice; reply $01
	mov a,#$00
	mov.b spcSampleCount,a
	mov a,#.samplearea&$FF
	mov.b spcFreePtr,a
	mov a,#.samplearea>>8
	mov.b spcFreePtr+1,a
	mov a,#$FF
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$01
	jmp .reply
.cmdStatus:		; $02: port 1 = the sample count, then ports 1-2 = the free pointer; reply $80
	mov.b a,spcSampleCount
	mov.b SPC_PORT1,a
	mov a,#$02
	mov.b SPC_PORT0,a
.l0534:
	cmp.b a,SPC_PORT0
	beq .l0534
	mov.b a,spcFreePtr
	mov.b SPC_PORT1,a
	mov.b a,spcFreePtr+1
	mov.b SPC_PORT2,a
	mov a,#$80
	jmp .reply
.cmdUpload:		; $03 (SPCUploadBlock): upload one sample into the next directory entry (start = the free pointer, loop = start + ports 2-3), the bytes
		;   by port 2 with port 1 counting; the end becomes the next entry's start; reply $FF if the directory is full
	mov.b a,spcSampleCount
	cmp a,#$60
	beq .l0596
	asl a
	asl a
	mov x,a
	mov.b a,spcFreePtr
	mov $0200+x,a
	clrc
	adc.b a,SPC_PORT2
	mov $0202+x,a
	mov.b a,spcFreePtr+1
	mov $0201+x,a
	adc.b a,SPC_PORT3
	mov $0203+x,a
	mov x,#$00
	mov y,#$00
	mov.b SPC_PORT1,x
	mov a,#$03
	mov.b SPC_PORT0,a
	inc x
.l056E:
	cmp.b x,SPC_PORT1
	bne .l057E
	mov.b a,SPC_PORT2
	mov.b (spcFreePtr)+y,a
	mov.b SPC_PORT1,x
	incw.b spcFreePtr
	inc x
	jmp .l056E
.l057E:
	mov.b a,SPC_PORT0
	bne .l056E
	mov.b a,spcSampleCount
	asl a
	asl a
	mov x,a
	mov.b a,spcFreePtr
	mov $0204+x,a
	mov.b a,spcFreePtr+1
	mov $0205+x,a
	inc.b spcSampleCount
	jmp .mainloop
.l0596:
	mov a,#$FF
	jmp .reply
.cmdUnload:		; $04: drop the last sample (the free pointer goes back to its start); reply $04, $FF if there is none
	mov.b a,spcSampleCount
	beq .l0596
	dec a
	mov.b spcSampleCount,a
	asl a
	asl a
	mov x,a
	mov a,$0200+x
	mov.b spcFreePtr,a
	mov a,$0201+x
	mov.b spcFreePtr+1,a
	mov a,#$04
	jmp .reply
.cmdKeyOff:		; $05: key off voice port 1; reply $05
	mov.b x,SPC_PORT1
	mov a,.bits+x
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$05
	jmp .reply
.cmdKeyOn:		; $06: voice port 1: pitch = ports 2-3, then key it on; reply $06
	mov.b a,SPC_PORT1
	asl a
	asl a
	asl a
	asl a
	mov y,a
	inc y
	inc y
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b x,SPC_PORT1
	mov a,.bits+x
	mov y,#DSP_KON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$06
	jmp .reply
.cmdSetVoice:		; $07: voice port 1: volume left / right = ports 2-3; then sample (SRCN), ADSR1, ADSR2 = ports 1-3, GAIN 0; reply $81
	mov.b a,SPC_PORT1
	asl a
	asl a
	asl a
	asl a
	mov y,a
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov a,#$07
	mov.b SPC_PORT0,a
.l060B:
	cmp.b a,SPC_PORT0
	beq .l060B
	inc y
	inc y
	mov.b a,SPC_PORT1
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov a,#$00
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$81
	jmp .reply
.cmdSetMaster:		; $08: main volume left / right, pitch modulation (PMON); then noise (NON), echo (EON), FLG = ports 1-3; reply $82
	mov.b a,SPC_PORT1
	mov y,#DSP_MVOLL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_MVOLR
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT3
	mov y,#DSP_PMON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$08
	mov.b SPC_PORT0,a
.l064D:
	cmp.b a,SPC_PORT0
	beq .l064D
	mov.b a,SPC_PORT1
	mov y,#DSP_NON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_EON
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT3
	or.b a,spcFLG
	mov y,#DSP_FLG
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$82
	jmp .reply
.cmdSetEcho:		; $09: echo volume left / right, echo feedback; then echo buffer (ESA), echo delay (EDL), FLG; reply $83
	mov.b a,SPC_PORT1
	mov y,#DSP_EVOLL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_EVOLR
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT3
	mov y,#DSP_EFB
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$09
	mov.b SPC_PORT0,a
.l068C:
	cmp.b a,SPC_PORT0
	beq .l068C
	mov.b a,SPC_PORT1
	mov y,#DSP_ESA
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_EDL
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$00
	mov.b spcFLG,a
	mov y,#DSP_FLG
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$83
	jmp .reply
.cmdSetFIR:		; $0A: the eight echo filter coefficients C0-C7, three at a time; reply $85
	mov.b a,SPC_PORT1
	mov y,#DSP_C0
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_C1
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT3
	mov y,#DSP_C2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$0A
	mov.b SPC_PORT0,a
.l06CB:
	cmp.b a,SPC_PORT0
	beq .l06CB
	mov.b a,SPC_PORT1
	mov y,#DSP_C3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_C4
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT3
	mov y,#DSP_C5
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$84
	mov.b SPC_PORT0,a
.l06EB:
	cmp.b a,SPC_PORT0
	beq .l06EB
	mov.b a,SPC_PORT1
	mov y,#DSP_C6
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov.b a,SPC_PORT2
	mov y,#DSP_C7
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$85
	jmp .reply
.cmdSetPitch:		; $0B: voice port 1: pitch = ports 2-3; reply $0B
	mov.b a,SPC_PORT1
	asl a
	asl a
	asl a
	asl a
	mov y,a
	inc y
	inc y
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$0B
	jmp .reply
.cmdSetGain:		; $0C: voice port 1: GAIN = port 2, ADSR1 = 0 (gain mode); reply $0C
	mov.b a,SPC_PORT1
	asl a
	asl a
	asl a
	asl a
	adc a,#$05
	mov y,a
	inc y
	inc y
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	dec y
	dec y
	mov a,#$00
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$0C
	jmp .reply
.cmdKeyOffAll:		; $0D: key off every voice; reply $0D
	mov a,#$FF
	mov y,#DSP_KOF
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$0D
	jmp .reply
.cmdSetVolume:		; $0E: voice port 1: volume left / right = ports 2-3; reply $0E
	mov.b a,SPC_PORT1
	asl a
	asl a
	asl a
	asl a
	mov y,a
	mov.b a,SPC_PORT2
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	inc y
	mov.b a,SPC_PORT3
	mov.b SPC_DSPADDR,y
	mov.b SPC_DSPDATA,a
	mov a,#$0E
	jmp .reply
.cmdStreamStart:		; $0F (SPCStreamStart): start a sample upload in chunks: the next directory entry (start, loop = start + ports 2-3), then the first
		;   chunk of bytes (port 2, port 1 counting); UploadSample keeps the entry for $10
	mov.b a,spcSampleCount
	cmp a,#$60
	beq .l07CE
	mov.b spcUploadSample,a
	asl a
	asl a
	mov x,a
	mov.b a,spcFreePtr
	mov $0200+x,a
	clrc
	adc.b a,SPC_PORT2
	mov $0202+x,a
	mov.b a,spcFreePtr+1
	mov $0201+x,a
	adc.b a,SPC_PORT3
	mov $0203+x,a
	mov.b a,SPC_PORT2
	mov.b spcUploadLoop,a
	mov.b a,SPC_PORT3
	mov.b spcUploadLoop+1,a
	mov x,#$00
	mov y,#$00
	mov.b SPC_PORT1,x
	mov a,#$0F
	mov.b SPC_PORT0,a
	inc x
.l0796:
	cmp.b x,SPC_PORT1
	bne .l07A5
	mov.b a,SPC_PORT2
	mov.b (spcFreePtr)+y,a
	mov.b SPC_PORT1,x
	inc y
	inc x
	jmp .l0796
.l07A5:
	mov.b a,SPC_PORT0
	bne .l0796
	mov a,y
	clrc
	adc.b a,spcFreePtr
	mov.b spcFreePtr,a
	mov.b a,spcFreePtr+1
	adc a,#$00
	mov.b spcFreePtr+1,a
	decw.b spcFreePtr
	dec x
	mov.b spcUploadLoop,x
	mov.b a,spcSampleCount
	asl a
	asl a
	mov x,a
	mov.b a,spcFreePtr
	mov $0204+x,a
	mov.b a,spcFreePtr+1
	mov $0205+x,a
	inc.b spcSampleCount
	jmp .mainloop
.l07CE:
	mov a,#$FF
	jmp .reply
.cmdStreamNext:		; $10 (SPCStreamNext): the next chunk of the sample started by $0F
	mov y,#$00
	mov.b SPC_PORT1,y
	mov a,#$10
	mov.b SPC_PORT0,a
	nop
	nop
	nop
	nop
.l07DF:
	inc y
	mov.b a,SPC_PORT2
	mov.b SPC_PORT1,y
	mov.b (spcFreePtr)+y,a
	mov.b a,SPC_PORT0
	bne .l07DF
	mov a,y
	clrc
	adc.b a,spcFreePtr
	mov.b spcFreePtr,a
	mov.b a,spcFreePtr+1
	adc a,#$00
	mov.b spcFreePtr+1,a
	dec x
	mov.b spcUploadLoop,x
	mov.b a,spcUploadSample
	asl a
	asl a
	mov x,a
	mov.b a,spcFreePtr
	mov $0204+x,a
	mov.b a,spcFreePtr+1
	mov $0205+x,a
	jmp .mainloop
.cmdDownload:		; $11 (SPCDownload): send sound RAM back: address = ports 2-3, then the length = ports 2-3; reply $86, then the bytes by port 2
	mov.b a,SPC_PORT2
	mov.b spcSendPtr,a
	mov.b a,SPC_PORT3
	mov.b spcSendPtr+1,a
	mov a,#$11
	mov.b SPC_PORT0,a
.l0817:
	cmp.b a,SPC_PORT0
	beq .l0817
	mov.b a,SPC_PORT2
	mov.b spcSendLen,a
	mov.b a,SPC_PORT3
	mov.b spcSendLen+1,a
	mov a,#$00
	mov.b SPC_PORT1,a
	mov a,#$86
	mov.b SPC_PORT0,a
.l082B:
	cmp.b a,SPC_PORT0
	beq .l082B
	mov x,#$00
	mov y,#$00
	mov.b SPC_PORT1,x
.l0835:
	cmp.b x,SPC_PORT1
	bne .l0835
	mov.b a,(spcSendPtr)+y
	mov.b SPC_PORT2,a
	inc x
	mov.b SPC_PORT1,x
	incw.b spcSendPtr
	decw.b spcSendLen
	bne .l0835
	jmp .mainloop
.samplearea:		; the end of the program: samples start here ($0849)
	base off
	arch 65816
.end:
	dw $0000,.start
