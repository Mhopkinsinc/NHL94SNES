; SpriteFrames, the main sprite set DrawSprite uses: skaters, goalies, the nets, the puck,
; markers, the crowd and a sprite font. The offset table (one 4-byte offset per frame; the
; first offset ends the table) is followed by this bank's frames. A frame is the piece count,
; flags (bit 7: 16x16 tiles), tile count, four words not traced, the two transfer sizes, the
; tile offset, four bytes not traced, the pieces, then the tiles.

SpriteFrames:		; frame offsets
	dd $00000F40,$0000108B,$00001224,$00001348
	dd $0000146C,$00001590,$0000173B,$00001934
	dd $00001A7F,$00001C2A,$00001D75,$00001EE7
	dd $00002092,$0000223D,$0000240F,$000025BA
	dd $0000272C,$00002877,$000029E9,$00002BBB
	dd $00002D66,$00002EB1,$0000304A,$000031BC
	dd $0000332E,$00003479,$000035C4,$0000376F
	dd $000038E1,$00003A8C,$00003BFE,$00003D70
	dd $00003F1B,$000040C6,$00004271,$000043E3
	dd $00004555,$000046C7,$00004872,$00004A1D
	dd $00004BC8,$00004D3A,$00004EAC,$0000501E
	dd $00005190,$00005302,$00005426,$0000554A
	dd $0000566E,$00005792,$000058B6,$00005A01
	dd $00005B4C,$00005CBE,$00005E57,$00005FA2
	dd $000060ED,$00006238,$00006383,$0000652E
	dd $00006679,$000067C4,$000068D6,$00006A21
	dd $00006B6C,$00006C90,$00006DB4,$00006F26
	dd $0000704A,$0000716E,$00007292,$00007404
	dd $000075C4,$00007736,$0000792F,$00007A7A
	dd $00007BEC,$00007D37,$00010000,$000101C0
	dd $00010332,$000104A4,$00010616,$000107C1
	dd $0001096C,$00010ADE,$00010C29,$00010DD4
	dd $00010F7F,$000110A3,$0001124E,$000113E7
	dd $00011559,$000116F2,$000118EB,$00011A96
	dd $00011C08,$00011DA1,$00011F13,$000120BE
	dd $000121E2,$00012354,$0001254D,$000126F8
	dd $000128A3,$000129C7,$00012B12,$00012CBD
	dd $00012EB6,$00013061,$000131AC,$000132F7
	dd $00013469,$0001363B,$0001380D,$000139B8
	dd $00013B03,$00013CAE,$00013E20,$00013F92
	dd $0001413D,$00014336,$000144F6,$000146B6
	dd $00014801,$00014973,$00014B5A,$00014CCC
	dd $00014E77,$00014FC2,$0001515B,$00015354
	dd $000155D4,$000156F8,$00015843,$0001598E
	dd $00015B39,$00015D6B,$00015F64,$000160D6
	dd $00016248,$000163F3,$0001659E,$000166E9
	dd $00016834,$00016958,$00016A7C,$00016C27
	dd $00016DD2,$00016FCB,$000171C4,$0001736F
	dd $0001751A,$00017665,$000177B0,$000178FB
	dd $00017A46,$00017BF1,$00017D9C,$00020000
	dd $000201AB,$000202CF,$00020441,$0002058C
	dd $00020737,$00020882,$000209F4,$00020B9F
	dd $00020D98,$00020F6A,$000210DC,$0002124E
	dd $0002140E,$000215B9,$00021764,$00021924
	dd $00021AF6,$00021C8F,$00021DDA,$00021F85
	dd $00022157,$00022302,$00022474,$0002261F
	dd $00022791,$0002298A,$00022B98,$00022DB8
	dd $00022FB1,$000231AA,$000233A3,$000235B1
	dd $000237AA,$000239F1,$00023C86,$00023E58
	dd $0002408A,$00024283,$00024443,$000245DC
	dd $0002479C,$00024995,$00024B07,$00024CA0
	dd $00024E99,$000250B9,$000252B2,$00025499
	dd $00025692,$00025879,$000259EB,$00025C32
	dd $00025E79,$00025FEB,$0002620B,$000263CB
	dd $00026576,$0002676F,$000268E1,$00026A1A
	dd $00026B8C,$00026D4C,$00026F0C,$00027045
	dd $000271B7,$000272A2,$0002733F,$000273DC
	dd $00027479,$0002753D,$000275DA,$0002763E
	dd $000276DB,$000278D4,$00027A94,$00027C2D
	dd $00027DC6,$00030000,$00030172,$0003036B
	dd $0003053D,$00030736,$00030881,$00030A6F
	dd $00030C68,$00030DDA,$00030EFE,$000310A9
	dd $000312A2,$0003143B,$00031694,$000318ED
	dd $00031B34,$00031CA6,$00031EC6,$0003211F
	dd $0003239F,$00032598,$000327CA,$0003299C
	dd $00032BCE,$00032DC7,$00032F39,$000330F9
	dd $000332A4,$000333C8,$00033588,$00033733
	dd $00033905,$00033AD7,$00033CAC,$00033EA5
	dd $000340EC,$000342AC,$00034445,$0003463E
	dd $000347FE,$00034A30,$00034C65,$00034E5E
	dd $00034FF7,$00035109,$00035302,$00035570
	dd $000356E2,$000358A2,$00035A74,$00035D42
	dd $00035F02,$000360C2,$000362BB,$00036502
	dd $000366C2,$00036882,$00036A54,$00036CFB
	dd $00036E94,$000370B4,$0003730D,$0003758D
	dd $00037726,$0003791F,$00037B9F,$00037E1F
	dd $00040000,$000401D2,$00040419,$00040660
	dd $00040820,$00040992,$00040C12,$00040E59
	dd $00040FE0,$00041152,$000412EB,$000414BD
	dd $00041608,$00041801,$00041A5A,$00041C7A
	dd $00041E25,$0004207E,$0004234C,$000425A5
	dd $000427C5,$00042A1E,$00042CC5,$00042F1E
	dd $000430F0,$00043262,$00043482,$00043669
	dd $0004383B,$00043A94,$00043D02,$00043F49
	dd $0004411B,$0004434D,$0004461B,$0004489B
	dd $00044ABB,$00044CED,$00044F0D,$000451B4
	dd $000453AD,$00045534,$0004572D,$00045926
	dd $00045B1F,$00045D06,$00045EFF,$000460AA
	dd $00046243,$000463DC,$000465AE,$0004676E
	dd $000468B9,$00046A52,$00046BC4,$00046D84
	dd $00046F7D,$00047164,$0004730F,$00047481
	dd $000475F3,$0004779E,$00047937,$00047A49
	dd $00047B5B,$00047C7F,$00050000,$00050232
	dd $000503DD,$000505D6,$000506A1,$00050801
	dd $000508D3,$0005099E,$00050AFE,$00050BD0
	dd $00050C9B,$00050DFB,$00050ECD,$00050F98
	dd $000510F8,$000511CA,$00051295,$000513F5
	dd $000514C7,$0005156B,$0005160F,$000516B3
	dd $00051757,$000517FB,$0005189F,$00051911
	dd $0005194E,$0005198B,$000519C8,$00051A05
	dd $00051A42,$00051A7F,$00051ABC,$00051AF9
	dd $00051B36,$00051B73,$00051BB0,$00051D37
	dd $00051F77,$00051FDB,$00052078,$00052115
	dd $000521E7,$00052284,$00052321,$00052385
	dd $00052470,$0005255B,$00052646,$0005270A
	dd $000527F5,$000528E0,$00052992,$00052CAE
	dd $00053063,$0005343F,$00053806,$00053BE2
	dd $00053FD0,$00054142,$00054314,$0005455B
	dd $00054754,$00054791,$000547CE,$0005480B
	dd $00054848,$00054885,$000548C2,$000548FF
	dd $0005493C,$00054979,$000549B6,$000549F3
	dd $00054A30,$00054A6D,$00054AAA,$00054AE7
	dd $00055334,$000555DB,$000557D4,$00055A8D
	dd $00055CAD,$00055E1F,$00056078,$000562F8
	dd $0005659F,$00056786,$000569A6,$00056B66
	dd $00056D38,$00056F0A,$0005718A,$000573BC
	dd $00057603,$00057883,$00057AA3,$00057D23
	dd $00060000,$00060259,$000604B2,$000606AB
	dd $000608F2,$00060B4B,$00060E07,$00061039
	dd $00061247,$000614A3,$00061663,$00061823
	dd $00061A1C,$00061B67,$00061CD9,$00061E84
	dd $00061FCF,$0006217A,$00062373,$0006251E
	dd $000626C9,$00062814,$0006295F,$00062B0A
	dd $00062CDC,$00062E87,$000630B9,$00063279
	dd $000633EB,$0006355D,$000636CF,$000637F3
	dd $0006393E,$00063A89,$00063BD4,$00063DA6
	dd $00063F51,$0006409C,$000641C0,$00064332
	dd $000644A4,$00064664,$000647AF,$00064921
	dd $00064A93,$00064B7E,$00064DB0,$00065030
	dd $00065262,$00065494,$000656ED,$0006590D
	dd $00065AA6,$00065C78,$00065DC3,$00065F5C
	dd $00066155,$00066315,$0006656E,$000667C7
	dd $000669C0,$00066BB9,$00066D04,$00066EFD
	dd $00067096,$0006728F,$00067461,$00067621
	dd $00067853,$0006799E,$00067B10,$00067D09
	dd $00067E7B,$00070000,$00070199,$00070359
	dd $0007052B,$0007075D,$0007092F,$00070AEF
	dd $00070D21,$00070EE1,$0007107A,$0007123A
	dd $0007135E,$000714D0,$000716C9,$00071889
	dd $00071A22,$00071BCD,$00071D18,$00071E8A
	dd $00072035,$0007228E,$00072487,$00072632
	dd $000727DD,$0007294F,$00072B6F,$00072DB6
	dd $00072F4F,$0007316F,$00073341,$00073513
	dd $000736BE,$0007387E,$00073A3E,$00073BFE
	dd $00073DA9,$00073F90,$00074129,$00074322
	dd $0007451B,$000746B4,$00074886,$00074A58
	dd $00074BCA,$00074D75,$00074EE7,$000750E0
	dd $00075252,$00075424,$000755CF,$000757DD
	dd $00075A0F,$00075C68,$00075E3A,$00076033
	dd $00076205,$000763EC,$0007655E,$0007671E
	dd $000768C9,$00076A89,$00076C82,$00076E2D
	dd $00076FC6,$000771BF,$000773B8,$00077563
	dd $0007775C,$0007798E,$00077BD5,$00077DCE
	dd $00080000,$000801F9,$00080392,$000804DD
	dd $0008069D,$00080836,$000809E1,$00080B53
	dd $00080CFE,$00080EA9,$000810A2,$00081214
	dd $000813E6,$00081591,$0008172A,$0008189C
	dd $000819E7,$00081B59,$00081D19,$00081F00
	dd $00082099,$00082280,$00082479,$0008264B
	dd $00082892,$00082A64,$00082C0F,$00082DBA
	dd $00082FDA,$00083185,$000833B7,$00083529
	dd $00083722,$0008391B,$00083AED,$00083CE6
	dd $00083E31,$00083F7C,$000840EE,$00084260
	dd $00084420,$000845B9,$000847B2,$000849AB
	dd $00084B44,$00084D04,$00084E28,$00084F4C
	dd $000850E5,$0008527E,$00085477,$00085685
	dd $00085845,$00085A77,$00085CD0,$00085EA2
	dd $000860FB,$0008632D,$0008654D,$00086746
	dd $0008699F,$00086BE6,$00086E3F,$00087011
	dd $0008720A,$00087463,$000875D5,$000876F9
	dd $0008786B,$00087A64,$00087C0F,$00087E08
	dd $00090000,$000901D2,$000903CB,$000905EB
	dd $0009081D,$00090AC4,$00090BD6,$00090DCF
	dd $00090FA1,$000911D3,$0009136C,$000914DE
	dd $00091629,$00091822,$00091994,$00091ADF
	dd $00091C51,$00091DC3,$00091F35,$0009212E
	dd $000922C7,$00092499,$00092692,$00092804
	dd $00092976,$00092B48,$00092D08,$00092EA1
	dd $00093013,$00093185,$000932F7,$00093529
	dd $0009369B,$00093846,$000939B8,$00093B2A
	dd $00093C4E,$00093E47,$00093FF2,$00094116
	dd $00094288,$0009439A,$000944AC,$000946DE
	dd $000948D7,$00094A49,$00094CA2,$00094E14
	dd $00094F86,$000951B8,$00095378,$000954C3
	dd $00095635,$000957CE,$000958F2,$00095AEB
	dd $00095D1D,$00095E41,$00096028,$0009626F
	dd $00096456,$000965C8,$0009673A,$000968AC
	dd $00096A1E,$00096B90,$00096D02,$00096F49
	dd $00097142,$0009733B,$00097594,$00097814
	dd $00097A34,$00097C8D,$000A0000,$000A0280
	dd $000A0440,$000A0600,$000A0859,$000A09F2
	dd $000A0B8B,$000A0D4B,$000A0F7D,$000A113D
	dd $000A12E8,$000A1493,$000A15DE,$000A17C5
	dd $000A18E9,$000A1A5B,$000A1C06,$000A1E5F
	dd $000A201F,$000A2218,$000A2471,$000A2631
	dd $000A2803,$000A29FC,$000A2BBC,$000A2DDC
	dd $000A2F4E,$000A3039,$000A31E4,$000A3356
	dd $000A34EF,$000A3688,$000A38A8,$000A3A68
	dd $000A3C4F,$000A3DE8,$000A3FA8,$000A4168
	dd $000A434F,$000A44E8,$000A4741,$000A4973
	dd $000A4B45,$000A4D2C,$000A4EFE,$000A50F7
	dd $000A5290,$000A5489,$000A5649,$000A5830
	dd $000A5A17,$000A5B89,$000A5DF7,$000A603E
	dd $000A625E,$000A63D0,$000A6542,$000A66A2
	dd $000A6802,$000A699B,$000A6B6D,$000A6CDF
	dd $000A6E51,$000A6FEA,$000A7171,$000A7331
	dd $000A747C,$000A75B5,$000A7727,$000A7872
	dd $000A79E4,$000A7B2F,$000A7C7A,$000B0000
	dd $000B0247,$000B0419,$000B05D9,$000B0799
	dd $000B096B,$000B0B64,$000B0D4B,$000B0F1D
	dd $000B113D,$000B136F,$000B14E1,$000B1653
	dd $000B1813,$000B1A0C,$000B1C53,$000B1E4C
	dd $000B1FBE,$000B2109,$000B227B,$000B249B
	dd $000B2634,$000B28DB,$000B2AD4,$000B2CCD
	dd $000B2EC6,$000B3038,$000B326A,$000B3403
	dd $000B359C,$000B375C,$000B38CE,$000B3B4E
	dd $000B3D6E,$000B3F07,$000B3FF2,$000B41B2
	dd $000B446B,$000B4712,$000B490B,$000B4A7D
	dd $000B4CD6,$000B4F2F,$000B5161,$000B5348
	dd $000B5628,$000B58BD,$000B5B16,$000B5CD6
	dd $000B5E48,$000B601A,$000B6213,$000B63E5
	dd $000B6557,$000B66C9,$000B6802,$000B69FB
	dd $000B6BBB,$000B6D2D,$000B6E3F,$000B7071
	dd $000B721C,$000B74FC,$000B76F5,$000B78EE
	dd $000B7AAE,$000B7C20,$000B7DF2,$000C0000
	dd $000C0160,$000C0284,$000C041D,$000C05B6
	dd $000C0728,$000C0888,$000C0A21,$000C0BBA
	dd $000C0DDA,$000C0FAC,$000C10E5,$000C1257
	dd $000C13A2,$000C1514,$000C165F,$000C17BF
	dd $000C18E3,$000C1C71,$000C1FFF,$000C23DB
	dd $000C2790,$000C2BBA,$000C2F21,$000C32AF
	dd $000C366B,$000C3B5F,$000C3F97,$000C43A1
	dd $000C4784,$000C47E8,$000C484C,$000C48B0
	dd $000C4914,$000C4978,$000C49DC,$000C4A40
	dd $000C4AA4,$000C4B08,$000C4B6C,$000C4BD0
	dd $000C4C34,$000C4C98,$000C4CFC,$000C4D60
	dd $000C4DC4,$000C4E28,$000C4E8C,$000C4EF0
	dd $000C4F54,$000C4FB8,$000C501C,$000C5080
	dd $000C50E4,$000C5148,$000C51AC,$000C51E9
	dd $000C524D,$000C52B1,$000C5315,$000C5379
	dd $000C53DD,$000C5441,$000C54A5,$000C5509
	dd $000C556D,$000C55D1,$000C5635,$000C5672
	dd $000C56AF,$000C56EC,$000C5729,$000C5766
	dd $000C57A3,$000C57E0,$000C581D,$000C585A
SpriteFrame0:
	db $03,$80
	dw $0009
	dw -6,7,-30,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame0
	db $02,$E4,$00,$00
	dw -6,-30,$0800 : db $FF
	dw -6,-14,$0802 : db $FF
	dw -2,2,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":43..331

SpriteFrame1:
	db $05,$80
	dw $000B
	dw -9,9,-29,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame1
	db $01,$E5,$00,$00
	dw -3,-29,$0800 : db $FF
	dw -9,-13,$0802 : db $FF
	dw 7,-5,$0804 : db $00
	dw -8,3,$0805 : db $00
	dw 0,3,$0814 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":388..740
SpriteFrame2:
	db $02,$80
	dw $0008
	dw -5,6,-27,4
	dw $0080,$0080
	dw .tiles-SpriteFrame2
	db $02,$E7,$00,$00
	dw -5,-27,$0800 : db $FF
	dw -5,-11,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":776..1032
SpriteFrame3:
	db $02,$80
	dw $0008
	dw -6,9,-26,5
	dw $0080,$0080
	dw .tiles-SpriteFrame3
	db $00,$E7,$00,$00
	dw -6,-26,$0800 : db $FF
	dw -4,-10,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":1068..1324
SpriteFrame4:
	db $02,$80
	dw $0008
	dw -5,8,-26,4
	dw $0080,$0080
	dw .tiles-SpriteFrame4
	db $02,$E7,$00,$00
	dw -4,-26,$0800 : db $FF
	dw -5,-10,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":1360..1616
SpriteFrame5:
	db $03,$80
	dw $000C
	dw -7,18,-21,7
	dw $00C0,$00C0
	dw .tiles-SpriteFrame5
	db $11,$FA,$00,$00
	dw -7,-21,$0800 : db $FF
	dw -7,-5,$0802 : db $FF
	dw 9,-10,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":1659..2043
SpriteFrame6:
	db $05,$80
	dw $000E
	dw -10,19,-25,3
	dw $0100,$00C0
	dw .tiles-SpriteFrame6
	db $0F,$F5,$00,$00
	dw -5,-25,$0800 : db $FF
	dw -10,-9,$0802 : db $FF
	dw 6,-9,$0804 : db $FF
	dw 11,-17,$0806 : db $00
	dw 19,-17,$0807 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":2100..2548
SpriteFrame7:
	db $03,$80
	dw $0009
	dw -6,17,-26,2
	dw $00A0,$0080
	dw .tiles-SpriteFrame7
	db $0D,$F6,$00,$00
	dw -6,-13,$0800 : db $FF
	dw -2,-29,$0802 : db $FF
	dw 10,-13,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":2591..2879
SpriteFrame8:
	db $03,$80
	dw $000C
	dw -8,16,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame8
	db $10,$F8,$00,$00
	dw -8,-25,$0800 : db $FF
	dw -8,-9,$0802 : db $FF
	dw 8,-12,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":2922..3306
SpriteFrame9:
	db $03,$80
	dw $0009
	dw -6,15,-24,4
	dw $00A0,$0080
	dw .tiles-SpriteFrame9
	db $10,$F9,$00,$00
	dw -6,-11,$0800 : db $FF
	dw -6,-27,$0802 : db $FF
	dw 10,-11,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":3349..3637
SpriteFrame10:
	db $04,$80
	dw $000A
	dw -2,21,-23,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame10
	db $12,$00,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -2,-7,$0802 : db $FF
	dw 14,-7,$0804 : db $00
	dw 14,1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":3687..4007
SpriteFrame11:
	db $03,$80
	dw $000C
	dw -5,23,-23,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame11
	db $14,$03,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw 11,-7,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":4050..4434

SpriteFrame12:
	db $03,$80
	dw $000C
	dw -5,21,-23,6
	dw $00C0,$00C0
	dw .tiles-SpriteFrame12
	db $12,$03,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw 11,-7,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":4477..4861
SpriteFrame13:
	db $04,$80
	dw $000D
	dw -11,22,-25,3
	dw $00E0,$00C0
	dw .tiles-SpriteFrame13
	db $14,$FF,$00,$00
	dw -5,-25,$0800 : db $FF
	dw -11,-9,$0802 : db $FF
	dw 5,-9,$0804 : db $FF
	dw 21,-1,$0806 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":4911..5327
SpriteFrame14:
	db $03,$80
	dw $000C
	dw -9,19,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame14
	db $10,$03,$00,$00
	dw -5,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-8,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":5370..5754
SpriteFrame15:
	db $04,$80
	dw $000A
	dw -9,16,-25,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame15
	db $0B,$06,$00,$00
	dw -6,-25,$0800 : db $FF
	dw -9,-9,$0802 : db $FF
	dw 7,-1,$0804 : db $00
	dw 15,-1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":5804..6124
SpriteFrame16:
	db $03,$80
	dw $0009
	dw -6,16,-23,11
	dw $00A0,$0080
	dw .tiles-SpriteFrame16
	db $0F,$08,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -6,-7,$0802 : db $FF
	dw 10,6,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":6167..6455
SpriteFrame17:
	db $04,$80
	dw $000A
	dw -6,18,-24,9
	dw $00C0,$0080
	dw .tiles-SpriteFrame17
	db $0D,$0A,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -6,-8,$0802 : db $FF
	dw 10,3,$0804 : db $00
	dw 18,3,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":6505..6825
SpriteFrame18:
	db $04,$80
	dw $000D
	dw -12,19,-24,9
	dw $00E0,$00C0
	dw .tiles-SpriteFrame18
	db $11,$06,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -12,-8,$0802 : db $FF
	dw 4,-8,$0804 : db $FF
	dw 13,8,$0806 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":6875..7291
SpriteFrame19:
	db $03,$80
	dw $000C
	dw -9,19,-24,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame19
	db $10,$06,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 7,-2,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":7334..7718
SpriteFrame20:
	db $03,$80
	dw $0009
	dw -7,7,-23,16
	dw $00A0,$0080
	dw .tiles-SpriteFrame20
	db $FE,$0D,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 0,9,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":7761..8049
SpriteFrame21:
	db $05,$80
	dw $000B
	dw -7,9,-23,18
	dw $00C0,$00A0
	dw .tiles-SpriteFrame21
	db $01,$0E,$00,$00
	dw -7,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 9,-7,$0804 : db $00
	dw -1,9,$0805 : db $00
	dw -1,17,$0814 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":8106..8458

SpriteFrame22:
	db $04,$80
	dw $000A
	dw -7,6,-23,17
	dw $00C0,$0080
	dw .tiles-SpriteFrame22
	db $FF,$0E,$00,$00
	dw -7,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 0,9,$0804 : db $00
	dw 0,17,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":8508..8828
SpriteFrame23:
	db $04,$80
	dw $000A
	dw -8,7,-24,19
	dw $00C0,$0080
	dw .tiles-SpriteFrame23
	db $04,$0E,$00,$00
	dw -6,-24,$0800 : db $FF
	dw -8,-8,$0802 : db $FF
	dw 0,8,$0804 : db $00
	dw 0,16,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":8878..9198
SpriteFrame24:
	db $03,$80
	dw $0009
	dw -6,5,-23,16
	dw $00A0,$0080
	dw .tiles-SpriteFrame24
	db $00,$0E,$00,$00
	dw -6,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw -3,9,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":9241..9529
SpriteFrame25:
	db $03,$80
	dw $0009
	dw -12,8,-24,8
	dw $00A0,$0080
	dw .tiles-SpriteFrame25
	db $F5,$03,$00,$00
	dw -7,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw -15,4,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":9572..9860
SpriteFrame26:
	db $03,$80
	dw $000C
	dw -14,14,-22,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame26
	db $F3,$05,$00,$00
	dw -5,-22,$0800 : db $FF
	dw -14,-6,$0802 : db $FF
	dw 2,-6,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":9903..10287
SpriteFrame27:
	db $04,$80
	dw $000A
	dw -12,11,-24,9
	dw $00C0,$0080
	dw .tiles-SpriteFrame27
	db $F5,$06,$00,$00
	dw -4,-24,$0800 : db $FF
	dw -4,-8,$0802 : db $FF
	dw -12,0,$0804 : db $00
	dw -12,8,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":10337..10657
SpriteFrame28:
	db $03,$80
	dw $000C
	dw -14,10,-23,9
	dw $00C0,$00C0
	dw .tiles-SpriteFrame28
	db $F3,$04,$00,$00
	dw -5,-23,$0800 : db $FF
	dw -5,-7,$0802 : db $FF
	dw -21,-2,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":10700..11084
SpriteFrame29:
	db $04,$80
	dw $000A
	dw -13,9,-23,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame29
	db $F7,$08,$00,$00
	dw -4,-23,$0800 : db $FF
	dw -13,-7,$0802 : db $FF
	dw 3,-7,$0804 : db $00
	dw 3,1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":11134..11454
SpriteFrame30:
	db $04,$80
	dw $000A
	dw -16,6,-23,8
	dw $00C0,$0080
	dw .tiles-SpriteFrame30
	db $F2,$04,$00,$00
	dw -8,-23,$0800 : db $FF
	dw -16,-7,$0802 : db $FF
	dw 0,-7,$0804 : db $00
	dw 0,1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":11504..11824
SpriteFrame31:
	db $03,$80
	dw $000C
	dw -20,11,-26,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame31
	db $EF,$02,$00,$00
	dw -7,-26,$0800 : db $FF
	dw -20,-10,$0802 : db $FF
	dw -4,-10,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":11867..12251
SpriteFrame32:
	db $03,$80
	dw $000C
	dw -17,7,-25,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame32
	db $F0,$03,$00,$00
	dw -7,-25,$0800 : db $FF
	dw -17,-9,$0802 : db $FF
	dw -1,-9,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":12294..12678

SpriteFrame33:
	db $03,$80
	dw $000C
	dw -20,11,-25,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame33
	db $EE,$FE,$00,$00
	dw -7,-25,$0800 : db $FF
	dw -20,-9,$0802 : db $FF
	dw -4,-9,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":12721..13105
SpriteFrame34:
	db $04,$80
	dw $000A
	dw -18,5,-25,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame34
	db $F0,$FE,$00,$00
	dw -7,-25,$0800 : db $FF
	dw -18,-9,$0802 : db $FF
	dw -2,-9,$0804 : db $00
	dw -2,-1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":13155..13475
SpriteFrame35:
	db $04,$80
	dw $000A
	dw -16,6,-25,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame35
	db $F2,$FB,$00,$00
	dw -7,-25,$0800 : db $FF
	dw -16,-9,$0802 : db $FF
	dw 0,-9,$0804 : db $00
	dw 0,-1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":13525..13845
SpriteFrame36:
	db $04,$80
	dw $000A
	dw -15,8,-26,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame36
	db $F5,$F7,$00,$00
	dw -15,-11,$0800 : db $FF
	dw -4,-27,$0802 : db $FF
	dw 1,-11,$0804 : db $00
	dw 1,-3,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":13895..14215
SpriteFrame37:
	db $03,$80
	dw $000C
	dw -15,9,-26,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame37
	db $F2,$FA,$00,$00
	dw -15,-12,$0800 : db $FF
	dw 1,-12,$0802 : db $FF
	dw -4,-28,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":14258..14642
SpriteFrame38:
	db $03,$80
	dw $000C
	dw -15,16,-26,0
	dw $00C0,$00C0
	dw .tiles-SpriteFrame38
	db $F6,$F5,$00,$00
	dw -15,-15,$0800 : db $FF
	dw 1,-15,$0802 : db $FF
	dw -3,-31,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":14685..15069
SpriteFrame39:
	db $03,$80
	dw $000C
	dw -16,12,-26,3
	dw $00C0,$00C0
	dw .tiles-SpriteFrame39
	db $F1,$F8,$00,$00
	dw -3,-26,$0800 : db $FF
	dw -3,-10,$0802 : db $FF
	dw -19,-14,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":15112..15496
SpriteFrame40:
	db $04,$80
	dw $000A
	dw -10,7,-26,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame40
	db $F8,$FD,$00,$00
	dw -10,-26,$0800 : db $FF
	dw -8,-10,$0802 : db $FF
	dw 6,-26,$0804 : db $00
	dw 6,-18,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":15546..15866
SpriteFrame41:
	db $04,$80
	dw $000A
	dw -12,8,-24,6
	dw $00C0,$0080
	dw .tiles-SpriteFrame41
	db $F6,$FD,$00,$00
	dw -12,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw 4,-24,$0804 : db $00
	dw 4,-16,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":15916..16236
SpriteFrame42:
	db $04,$80
	dw $000A
	dw -13,7,-25,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame42
	db $F6,$FF,$00,$00
	dw -13,-25,$0800 : db $FF
	dw -4,-9,$0802 : db $FF
	dw 3,-25,$0804 : db $00
	dw 3,-17,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":16286..16606

SpriteFrame43:
	db $04,$80
	dw $000A
	dw -14,6,-25,4
	dw $00C0,$0080
	dw .tiles-SpriteFrame43
	db $F4,$FA,$00,$00
	dw -14,-25,$0800 : db $FF
	dw -7,-9,$0802 : db $FF
	dw 2,-25,$0804 : db $00
	dw 2,-17,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":16656..16976
SpriteFrame44:
	db $04,$80
	dw $000A
	dw -9,9,-24,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame44
	db $F9,$FB,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -3,-8,$0802 : db $FF
	dw 7,-24,$0804 : db $00
	dw 7,-16,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":17026..17346
SpriteFrame45:
	db $02,$80
	dw $0008
	dw -4,9,-23,6
	dw $0080,$0080
	dw .tiles-SpriteFrame45
	db $FE,$F9,$00,$00
	dw -3,-23,$0800 : db $FF
	dw -4,-7,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":17382..17638
SpriteFrame46:
	db $02,$80
	dw $0008
	dw -4,11,-23,5
	dw $0080,$0080
	dw .tiles-SpriteFrame46
	db $02,$FC,$00,$00
	dw 0,-23,$0800 : db $FF
	dw -4,-7,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":17674..17930
SpriteFrame47:
	db $02,$80
	dw $0008
	dw -5,8,-24,6
	dw $0080,$0080
	dw .tiles-SpriteFrame47
	db $FF,$FB,$00,$00
	dw -2,-24,$0800 : db $FF
	dw -5,-8,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":17966..18222
SpriteFrame48:
	db $02,$80
	dw $0008
	dw -5,5,-24,6
	dw $0080,$0080
	dw .tiles-SpriteFrame48
	db $FC,$F6,$00,$00
	dw -5,-24,$0800 : db $FF
	dw -5,-8,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":18258..18514
SpriteFrame49:
	db $02,$80
	dw $0008
	dw -2,7,-25,4
	dw $0080,$0080
	dw .tiles-SpriteFrame49
	db $FE,$F7,$00,$00
	dw -2,-25,$0800 : db $FF
	dw -2,-9,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":18550..18806
SpriteFrame50:
	db $03,$80
	dw $0009
	dw -5,13,-24,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame50
	db $0C,$FE,$00,$00
	dw -5,-24,$0800 : db $FF
	dw -4,-8,$0802 : db $FF
	dw 11,-16,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":18849..19137
SpriteFrame51:
	db $03,$80
	dw $0009
	dw -5,19,-22,7
	dw $00A0,$0080
	dw .tiles-SpriteFrame51
	db $12,$01,$00,$00
	dw 0,-22,$0800 : db $FF
	dw -5,-6,$0802 : db $FF
	dw 16,-14,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":19180..19468
SpriteFrame52:
	db $04,$80
	dw $000A
	dw -4,18,-25,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame52
	db $10,$FD,$00,$00
	dw -4,-25,$0800 : db $FF
	dw -4,-9,$0802 : db $FF
	dw 12,-24,$0804 : db $00
	dw 12,-16,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":19518..19838
SpriteFrame53:
	db $05,$80
	dw $000B
	dw -7,18,-23,5
	dw $00C0,$00A0
	dw .tiles-SpriteFrame53
	db $10,$00,$00,$00
	dw -1,-23,$0800 : db $FF
	dw -7,-7,$0802 : db $FF
	dw 15,-15,$0804 : db $00
	dw 9,-7,$0805 : db $00
	dw 9,1,$0814 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":19895..20247
SpriteFrame54:
	db $03,$80
	dw $0009
	dw -7,13,-24,7
	dw $00A0,$0080
	dw .tiles-SpriteFrame54
	db $0A,$01,$00,$00
	dw -7,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 9,-10,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":20290..20578
SpriteFrame55:
	db $03,$80
	dw $0009
	dw -7,14,-22,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame55
	db $0D,$02,$00,$00
	dw -7,-22,$0800 : db $FF
	dw -7,-6,$0802 : db $FF
	dw 9,-10,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":20621..20909

SpriteFrame56:
	db $03,$80
	dw $0009
	dw -3,16,-18,9
	dw $00A0,$0080
	dw .tiles-SpriteFrame56
	db $0E,$08,$00,$00
	dw -2,-6,$0800 : db $FF
	dw -3,-22,$0802 : db $FF
	dw 14,-6,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":20952..21240
SpriteFrame57:
	db $03,$80
	dw $0009
	dw -3,15,-21,9
	dw $00A0,$0080
	dw .tiles-SpriteFrame57
	db $0C,$04,$00,$00
	dw -3,-21,$0800 : db $FF
	dw -2,-5,$0802 : db $FF
	dw 13,-13,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":21283..21571
SpriteFrame58:
	db $03,$80
	dw $000C
	dw -9,16,-20,5
	dw $00C0,$00C0
	dw .tiles-SpriteFrame58
	db $0E,$02,$00,$00
	dw -9,-10,$0800 : db $FF
	dw 7,-10,$0802 : db $FF
	dw -4,-26,$0804 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":21614..21998
SpriteFrame59:
	db $03,$80
	dw $0009
	dw -7,15,-22,7
	dw $00A0,$0080
	dw .tiles-SpriteFrame59
	db $0D,$01,$00,$00
	dw -7,-8,$0800 : db $FF
	dw -4,-24,$0802 : db $FF
	dw 9,-8,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":22041..22329
SpriteFrame60:
	db $03,$80
	dw $0009
	dw -7,12,-22,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame60
	db $0A,$05,$00,$00
	dw -7,-10,$0800 : db $FF
	dw -7,-26,$0802 : db $FF
	dw 9,-10,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":22372..22660
SpriteFrame61:
	db $04,$80
	dw $0007
	dw -8,12,-19,4
	dw $0080,$0060
	dw .tiles-SpriteFrame61
	db $0A,$02,$00,$00
	dw -8,-19,$0800 : db $FF
	dw 8,-11,$0802 : db $00
	dw -7,-3,$0803 : db $00
	dw 1,-3,$0812 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":22710..22934
SpriteFrame62:
	db $03,$80
	dw $0009
	dw -8,12,-21,5
	dw $00A0,$0080
	dw .tiles-SpriteFrame62
	db $09,$04,$00,$00
	dw -8,-21,$0800 : db $FF
	dw -6,-5,$0802 : db $FF
	dw 8,-13,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":22977..23265
SpriteFrame63:
	db $03,$80
	dw $0009
	dw -6,14,-18,10
	dw $00A0,$0080
	dw .tiles-SpriteFrame63
	db $0C,$09,$00,$00
	dw -6,-5,$0800 : db $FF
	dw -4,-21,$0802 : db $FF
	dw 10,-5,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":23308..23596
SpriteFrame64:
	db $02,$80
	dw $0008
	dw -5,12,-20,6
	dw $0080,$0080
	dw .tiles-SpriteFrame64
	db $0A,$08,$00,$00
	dw -3,-9,$0800 : db $FF
	dw -5,-25,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":23632..23888
SpriteFrame65:
	db $02,$80
	dw $0008
	dw -5,6,-21,5
	dw $0080,$0080
	dw .tiles-SpriteFrame65
	db $01,$08,$00,$00
	dw -5,-21,$0800 : db $FF
	dw -5,-5,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":23924..24180
SpriteFrame66:
	db $04,$80
	dw $000A
	dw -10,9,-20,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame66
	db $FF,$07,$00,$00
	dw -9,-20,$0800 : db $FF
	dw -10,-4,$0802 : db $FF
	dw 6,-4,$0804 : db $00
	dw 6,4,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":24230..24550
SpriteFrame67:
	db $02,$80
	dw $0008
	dw -9,8,-21,6
	dw $0080,$0080
	dw .tiles-SpriteFrame67
	db $FB,$04,$00,$00
	dw -9,-21,$0800 : db $FF
	dw -6,-5,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":24586..24842

SpriteFrame68:
	db $02,$80
	dw $0008
	dw -12,4,-19,7
	dw $0080,$0080
	dw .tiles-SpriteFrame68
	db $F7,$07,$00,$00
	dw -12,-19,$0800 : db $FF
	dw -11,-3,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":24878..25134
SpriteFrame69:
	db $02,$80
	dw $0008
	dw -9,4,-22,6
	dw $0080,$0080
	dw .tiles-SpriteFrame69
	db $F9,$05,$00,$00
	dw -8,-22,$0800 : db $FF
	dw -9,-6,$0802 : db $FF
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":25170..25426
SpriteFrame70:
	db $04,$80
	dw $000A
	dw -15,5,-25,5
	dw $00C0,$0080
	dw .tiles-SpriteFrame70
	db $F4,$06,$00,$00
	dw -9,-25,$0800 : db $FF
	dw -15,-9,$0802 : db $FF
	dw 1,-9,$0804 : db $00
	dw 1,-1,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":25476..25796
SpriteFrame71:
	db $06,$80
	dw $000C
	dw -16,10,-24,4
	dw $00C0,$00C0
	dw .tiles-SpriteFrame71
	db $F3,$05,$00,$00
	dw -16,-24,$0800 : db $FF
	dw -7,-8,$0802 : db $FF
	dw 0,-24,$0804 : db $00
	dw 0,-16,$0805 : db $00
	dw 9,-8,$0814 : db $00
	dw 9,0,$0815 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":25860..26244
SpriteFrame72:
	db $04,$80
	dw $000A
	dw -17,6,-23,7
	dw $00C0,$0080
	dw .tiles-SpriteFrame72
	db $F2,$06,$00,$00
	dw -17,-8,$0800 : db $FF
	dw -8,-24,$0802 : db $FF
	dw -1,-8,$0804 : db $00
	dw -1,0,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":26294..26614
SpriteFrame73:
	db $05,$80
	dw $000E
	dw -18,10,-23,6
	dw $0100,$00C0
	dw .tiles-SpriteFrame73
	db $F1,$05,$00,$00
	dw -18,-23,$0800 : db $FF
	dw -15,-7,$0802 : db $FF
	dw 1,-7,$0804 : db $FF
	dw -2,-23,$0806 : db $00
	dw -2,-15,$0807 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":26671..27119
SpriteFrame74:
	db $03,$80
	dw $0009
	dw -16,5,-24,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame74
	db $F3,$06,$00,$00
	dw -10,-24,$0800 : db $FF
	dw -10,-8,$0802 : db $FF
	dw -18,-10,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":27162..27450
SpriteFrame75:
	db $04,$80
	dw $000A
	dw -15,6,-25,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame75
	db $F4,$03,$00,$00
	dw -15,-12,$0800 : db $FF
	dw -5,-28,$0802 : db $FF
	dw 1,-12,$0804 : db $00
	dw 1,-4,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":27500..27820
SpriteFrame76:
	db $03,$80
	dw $0009
	dw -15,6,-24,6
	dw $00A0,$0080
	dw .tiles-SpriteFrame76
	db $F5,$06,$00,$00
	dw -9,-24,$0800 : db $FF
	dw -9,-8,$0802 : db $FF
	dw -17,-11,$0804 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":27863..28151
SpriteFrame77:
	db $04,$80
	dw $000A
	dw -16,4,-24,3
	dw $00C0,$0080
	dw .tiles-SpriteFrame77
	db $F3,$03,$00,$00
	dw -16,-12,$0800 : db $FF
	dw -7,-28,$0802 : db $FF
	dw 0,-12,$0804 : db $00
	dw 0,-4,$0805 : db $00
.tiles:
	incbin "../../../Extracted/data/gfx/SpriteFrames82.bin":28201..28521
