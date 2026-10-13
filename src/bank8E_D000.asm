; Bank $8E, sixth 4 KB: the last frames of SpriteFrames (see bank82_8000), tiles from Extracted/data/SpriteFrames8E.bin.
; Then the start of a block for the sound CPU (sent by SPCUploadBlock from the upload lists in bank80_E000), from
; Extracted/data/DATA8_8ED897.spc; it continues in the following files.

org $8ED01C
SpriteFrame950:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame950
	db $34,$56,$34,$56
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":20544..20608
SpriteFrame951:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame951
	db $33,$51,$33,$51
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":20644..20708
SpriteFrame952:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame952
	db $36,$4C,$36,$4C
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":20744..20808
SpriteFrame953:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame953
	db $34,$47,$34,$47
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":20844..20908
SpriteFrame954:
	db $01,$00
	dw $0001
	dw 1,3,7,9
	dw $0020,$0000
	dw .tiles-SpriteFrame954
	db $34,$46,$34,$46
	dw 1,7,$0000 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":20937..20969
SpriteFrame955:
	db $02,$00
	dw $0002
	dw 0,7,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame955
	db $32,$7E,$32,$7E
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21005..21069
SpriteFrame956:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame956
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21105..21169
SpriteFrame957:
	db $02,$00
	dw $0002
	dw 0,3,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame957
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21205..21269
SpriteFrame958:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame958
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21305..21369
SpriteFrame959:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame959
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21405..21469
SpriteFrame960:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame960
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21505..21569
SpriteFrame961:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame961
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21605..21669
SpriteFrame962:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame962
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21705..21769
SpriteFrame963:
	db $02,$00
	dw $0002
	dw 0,5,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame963
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21805..21869
SpriteFrame964:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame964
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":21905..21969
SpriteFrame965:
	db $02,$00
	dw $0002
	dw 0,4,0,9
	dw $0040,$0000
	dw .tiles-SpriteFrame965
	db $FA,$FE,$FA,$FE
	dw 0,0,$0000 : db $00
	dw 0,8,$0001 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22005..22069
SpriteFrame966:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame966
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22098..22130
SpriteFrame967:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame967
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22159..22191
SpriteFrame968:
	db $01,$00
	dw $0001
	dw -2,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame968
	db $FB,$F8,$FB,$F8
	dw -2,-3,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22220..22252
SpriteFrame969:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame969
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22281..22313
SpriteFrame970:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame970
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22342..22374
SpriteFrame971:
	db $01,$00
	dw $0001
	dw -1,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame971
	db $FC,$F8,$FC,$F8
	dw -1,-3,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22403..22435
SpriteFrame972:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame972
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22464..22496
SpriteFrame973:
	db $01,$00
	dw $0001
	dw -2,3,-4,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame973
	db $FB,$F8,$FB,$F8
	dw -2,-4,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22525..22557
SpriteFrame974:
	db $01,$00
	dw $0001
	dw -2,2,-3,-1
	dw $0020,$0000
	dw .tiles-SpriteFrame974
	db $FB,$F8,$FB,$F8
	dw -2,-3,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22586..22618
SpriteFrame975:
	db $01,$00
	dw $0001
	dw -2,2,0,1
	dw $0020,$0000
	dw .tiles-SpriteFrame975
	db $FB,$FA,$FB,$FA
	dw -2,0,$0200 : db $00
.tiles:
	incbin "../Extracted/data/SpriteFrames8E.bin":22647..22679
DATA8_8ED897:		; for SPCUploadBlock: sound RAM address, length (big-endian words), then the bytes
	db $15,$45
	db $24,$90
	incbin "../Extracted/data/DATA8_8ED897.spc":4..1897
