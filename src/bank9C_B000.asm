; Bank $9C, fourth 4 KB: team records continued (see bank9C_A000): the rest of Buffalo, then Calgary, then Chicago,
; then Detroit, then Edmonton, then Hartford, then LosAngeles; LosAngeles continues in the next file.

org $9CB00D
	%Player("Richard Smehlik", $42A3,$3343,$4431,$3032)	; 19
	%Player("Ken Sutton", $4182,$2242,$1412,$3232)	; 20
	%Player("Grant Ledyard", $0394,$3231,$3C10,$2323)	; 21
	%Player("Gord Donnelly", $3491,$2231,$3B11,$2225)	; 22
	%Player("Randy Moller", $24A3,$2212,$3921,$1124)	; 23
	%Player("Keith Carney", $0692,$3212,$3622,$1424)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Buffalo")
.ta:		; abbreviation
	%String("BUF")
.tm:		; nickname
	%String("Sabres")
.ar:		; arena
	%String("Memorial Auditorium")
Calgary:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $42,$00,$00,$C9,$4B
.sodds:
	db 197,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,15,16,06,03,11,04,00	; line 1 Sc1
	db 01,19,16,06,03,12,04,00	; line 2 Sc2
	db 01,15,21,07,04,11,03,00	; line 3 Chk
	db 01,17,22,09,05,14,03,00	; line 4 PP1
	db 01,15,16,06,03,12,04,00	; line 5 PP2
	db 01,22,21,04,05,11,03,00	; line 6 PK1
	db 01,15,21,07,11,06,05,00	; line 7 PK2
	db 01,22,18,06,05,07,11,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Mike Vernon", $3043,$4444,$0000,$4433)	; 1
	%Player("Jeff Reese", $3542,$3442,$0000,$2233)	; 2
	%Player("Joe Nieuwendyk", $2584,$4434,$3444,$4322)	; 3
	%Player("Robert Reichel", $2664,$4434,$2444,$3242)	; 4
	%Player("Joel Otto", $29B4,$3352,$5734,$4124)	; 5
	%Player("Gary Roberts", $1074,$4544,$4845,$5134)	; 6
	%Player("Paul Ranheim", $2884,$4343,$1343,$3431)	; 7
	%Player("Brent Ashton", $15A3,$3343,$4632,$4433)	; 8
	%Player("Chris Lindberg", $1173,$4232,$2433,$2321)	; 9
	%Player("Craig Berube", $1692,$3112,$2A11,$1414)	; 10
	%Player("Theoren Fleury", $1435,$5454,$4743,$6133)	; 11
	%Player("Sergei Makarov", $4265,$4422,$1054,$3052)	; 12
	%Player("Greg Paslawski", $2372,$2313,$2134,$2220)	; 13
	%Player("Ronnie Stern", $2282,$2212,$3723,$1324)	; 14
	%Player("Gary Suter", $2075,$4454,$4642,$5243)	; 15
	%Player("Al MacInnis", $0284,$4436,$3541,$5243)	; 16
	%Player("Roger Johansson", $3474,$3222,$3431,$2332)	; 17
	%Player("Trent Yawney", $1873,$2242,$3630,$3133)	; 18
	%Player("Frank Musil", $0394,$4232,$3621,$3523)	; 19
	%Player("Michel Petit", $0793,$3234,$3941,$3333)	; 20
	%Player("Kevin Dahl", $0472,$3242,$3331,$3132)	; 21
	%Player("Chris Dahlquist", $0583,$3143,$3431,$3523)	; 22
	%Player("Greg Smyth", $06A0,$0100,$1901,$1404)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Calgary")
.ta:		; abbreviation
	%String("CGY")
.tm:		; nickname
	%String("Flames")
.ar:		; arena
	%String("Olympic Saddledome")
Chicago:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $20,$10,$21,$E8,$4E
.sodds:
	db 228,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,17,07,03,11,05,00	; line 1 Sc1
	db 01,18,17,07,03,11,04,00	; line 2 Sc2
	db 01,19,20,09,04,13,03,00	; line 3 Chk
	db 01,21,23,10,05,12,03,00	; line 4 PP1
	db 01,18,17,07,03,11,04,00	; line 5 PP2
	db 01,19,20,04,05,13,03,00	; line 6 PK1
	db 01,18,17,05,11,03,12,00	; line 7 PK2
	db 01,20,22,03,12,05,11,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Ed Belfour", $3066,$4665,$0000,$6655)	; 1
	%Player("Jim Waite", $2963,$3332,$0000,$2233)	; 2
	%Player("Jeremy Roenick", $2745,$5445,$2355,$5253)	; 3
	%Player("Christan Ruuttu", $2284,$4343,$4442,$4243)	; 4
	%Player("Brent Sutter", $1263,$2453,$4343,$5133)	; 5
	%Player("Troy Murray", $1984,$3242,$4331,$3533)	; 6
	%Player("Michel Goulet", $1684,$3332,$2635,$3312)	; 7
	%Player("Stephane Matteau", $3282,$2321,$3623,$3213)	; 8
	%Player("Greg Gilbert", $1472,$2332,$4633,$3112)	; 9
	%Player("Jocelyn Lemieux", $2693,$4334,$2622,$2213)	; 10
	%Player("Steve Larmer", $2874,$4464,$4444,$6342)	; 11
	%Player("Dirk Graham", $3384,$3353,$4732,$4534)	; 12
	%Player("Brian Noonan", $1073,$3334,$3343,$4533)	; 13
	%Player("Dave Christian", $2583,$3233,$2331,$3231)	; 14
	%Player("Joe Murphy", $1774,$4434,$3233,$4243)	; 15
	%Player("Rob Brown", $4464,$3322,$2841,$2024)	; 16
	%Player("Chris Chelios", $0774,$4465,$4751,$6245)	; 17
	%Player("Steve Smith", $05B4,$4344,$4641,$5244)	; 18
	%Player("Bryan Marchment", $0283,$3242,$4621,$3215)	; 19
	%Player("Frantsek Kucera", $0692,$2243,$1321,$3422)	; 20
	%Player("Craig Muni", $0392,$2132,$4620,$4223)	; 21
	%Player("Keith Brown", $0472,$2232,$3931,$3433)	; 22
	%Player("Cam Russell", $0853,$3132,$3431,$3524)	; 23
	%Player("Adam Bennett", $4792,$2111,$2520,$1412)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Chicago")
.ta:		; abbreviation
	%String("CHI")
.tm:		; nickname
	%String("Blackhawks")
.ar:		; arena
	%String("Chicago Stadium")
Detroit:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $73,$21,$00,$F8,$4B
.sodds:
	db 212,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,04,03,13,08,00	; line 1 Sc1
	db 01,21,25,11,03,13,04,00	; line 2 Sc2
	db 01,18,23,08,04,14,03,00	; line 3 Chk
	db 01,19,20,09,05,15,03,00	; line 4 PP1
	db 01,18,20,08,03,13,15,00	; line 5 PP2
	db 01,19,21,15,04,14,03,00	; line 6 PK1
	db 01,19,23,08,04,03,05,00	; line 7 PK2
	db 01,21,25,05,03,08,04,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Tim Cheveldae", $3264,$4444,$0000,$4344)	; 1
	%Player("Vincent Riendeau", $3763,$3222,$0000,$3223)	; 2
	%Player("Steve Yzerman", $1966,$5644,$1155,$6152)	; 3
	%Player("Sergei Fedorov", $9175,$4444,$3254,$4153)	; 4
	%Player("Dallas Drake", $2844,$4343,$2033,$4133)	; 5
	%Player("Mike Sillinger", $2373,$3332,$2332,$4021)	; 6
	%Player("Vachslav Kozlov", $1354,$3223,$1233,$3533)	; 7
	%Player("Paul Ysebaert", $2174,$4443,$2644,$3342)	; 8
	%Player("Shawn Burr", $1162,$2332,$4622,$3123)	; 9
	%Player("Keith Primeau", $55B3,$3343,$1624,$3124)	; 10
	%Player("Gerard Gallant", $1762,$2333,$4633,$3134)	; 11
	%Player("John Ogrodnick", $2593,$3333,$3234,$2130)	; 12
	%Player("Dino Ciccarelli", $2255,$4425,$2355,$4143)	; 13
	%Player("Ray Sheppard", $2662,$2433,$3334,$3222)	; 14
	%Player("Bob Probert", $24B4,$3333,$4A22,$4235)	; 15
	%Player("Sheldon Kennedy", $1543,$3322,$2324,$2522)	; 16
	%Player("Jim Hiller", $1472,$2212,$3722,$1424)	; 17
	%Player("Paul Coffey", $7796,$5434,$2461,$5153)	; 18
	%Player("Steve Chiasson", $0394,$3444,$3641,$4234)	; 19
	%Player("Yves Racine", $3363,$3344,$3431,$4233)	; 20
	%Player("Nicklas Lidstrom", $0554,$3344,$3441,$4241)	; 21
	%Player("Mark Howe", $0463,$3343,$3231,$3031)	; 22
	%Player("Vladimir Konstantov", $1663,$3243,$4731,$4233)	; 23
	%Player("Steve Konroyd", $0883,$3232,$4421,$3233)	; 24
	%Player("Brad McCrimmon", $0283,$2242,$4610,$3133)	; 25
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Detroit")
.ta:		; abbreviation
	%String("DET")
.tm:		; nickname
	%String("Red Wings")
.ar:		; arena
	%String("Joe Louis Arena")
Edmonton:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $16,$02,$12,$E8,$43
.sodds:
	db 208,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,17,08,02,14,09,00	; line 1 Sc1
	db 01,16,17,09,02,14,03,00	; line 2 Sc2
	db 01,19,18,08,03,15,02,00	; line 3 Chk
	db 01,20,21,10,11,04,02,00	; line 4 PP1
	db 01,16,17,09,08,14,06,00	; line 5 PP2
	db 01,20,18,10,06,15,09,00	; line 6 PK1
	db 01,16,18,08,04,11,02,00	; line 7 PK2
	db 01,19,21,11,02,08,04,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Bill Ranford", $3044,$3334,$0000,$4454)	; 1
	%Player("Doug Weight", $3963,$3343,$3443,$3132)	; 2
	%Player("Todd Elik", $3473,$4332,$2433,$3123)	; 3
	%Player("Craig MacTavish", $1484,$3242,$4432,$5223)	; 4
	%Player("Kevin Todd", $1553,$4333,$3632,$3332)	; 5
	%Player("Shjon Podein", $2692,$2322,$2624,$2512)	; 6
	%Player("Mike Hudson", $2093,$3242,$4820,$3233)	; 7
	%Player("Shayne Corson", $0994,$4343,$4642,$4234)	; 8
	%Player("Craig Simpson", $1883,$3434,$2345,$3132)	; 9
	%Player("Zdeno Ciger", $0874,$3333,$2033,$3230)	; 10
	%Player("Kelly Buchberger", $16A2,$2232,$4A13,$3213)	; 11
	%Player("Martin Gelinas", $0783,$3223,$2432,$2422)	; 12
	%Player("Louie DeBrusk", $29C1,$1212,$3C14,$1515)	; 13
	%Player("Petr Klima", $8575,$5324,$1355,$4533)	; 14
	%Player("Steven Rice", $12B2,$2212,$1321,$1223)	; 15
	%Player("Dave Manson", $2494,$4355,$4A41,$5434)	; 16
	%Player("Igor Kravchuk", $2194,$3343,$3242,$4432)	; 17
	%Player("Brian Benning", $1982,$2343,$3622,$4234)	; 18
	%Player("Geoff Smith", $2594,$3231,$1431,$3231)	; 19
	%Player("Brian Glynn", $06B3,$3234,$3421,$4323)	; 20
	%Player("Luke Richardson", $22B3,$3132,$4630,$2434)	; 21
	%Player("Chris Joseph", $02A3,$3313,$3531,$1233)	; 22
	%Player("Brad Werenka", $3693,$3223,$2633,$2523)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Edmonton")
.ta:		; abbreviation
	%String("EDM")
.tm:		; nickname
	%String("Oilers")
.ar:		; arena
	%String("Northlands Coliseum")
Hartford:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $17,$02,$00,$E6,$42
.sodds:
	db 163,96
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,19,08,04,13,05,00	; line 1 Sc1
	db 01,18,23,08,04,13,06,00	; line 2 Sc2
	db 01,21,19,10,06,14,04,00	; line 3 Chk
	db 01,20,22,09,05,15,04,00	; line 4 PP1
	db 01,18,19,08,04,13,05,00	; line 5 PP2
	db 01,20,21,09,05,06,04,00	; line 6 PK1
	db 01,20,19,15,14,08,04,00	; line 7 PK2
	db 01,18,23,08,04,15,14,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Sean Burke", $01A4,$3224,$0000,$4444)	; 1
	%Player("Mario Gosselin", $3132,$3442,$0000,$1122)	; 2
	%Player("Frank Pietrngelo", $4063,$3113,$0000,$2222)	; 3
	%Player("Andrew Cassels", $2173,$3442,$2034,$4032)	; 4
	%Player("Mikael Nylander", $3654,$3323,$2232,$3132)	; 5
	%Player("Robert Kron", $3853,$3342,$2233,$3432)	; 6
	%Player("Robert Petrovicky", $3954,$3223,$2231,$3433)	; 7
	%Player("Geoff Sanderson", $0864,$4434,$2044,$4331)	; 8
	%Player("Patrick Poulin", $24A3,$3323,$3033,$3232)	; 9
	%Player("Yvon Corriveau", $1182,$2232,$3812,$3311)	; 10
	%Player("Jim McKenzie", $3392,$2112,$2422,$2314)	; 11
	%Player("Randy Cunnyworth", $0762,$3232,$3622,$3533)	; 12
	%Player("Pat Verbeek", $1673,$4434,$3744,$4244)	; 13
	%Player("Mark Janssens", $22B3,$3333,$4633,$4124)	; 14
	%Player("Nick Kypreos", $2082,$2221,$3624,$3415)	; 15
	%Player("Mark Greig", $1771,$1210,$1511,$1013)	; 16
	%Player("Jamie Leach", $3483,$3212,$3923,$1520)	; 17
	%Player("Zarley Zalapski", $03A5,$4454,$4442,$5133)	; 18
	%Player("Eric Weinrich", $04A3,$4343,$3432,$4133)	; 19
	%Player("Adam Burt", $0674,$3234,$3441,$4334)	; 20
	%Player("Dan Keczmer", $3772,$2231,$1622,$2513)	; 21
	%Player("Doug Houda", $2772,$2122,$2921,$2414)	; 22
	%Player("Allen Pedersen", $41A2,$3132,$3621,$2123)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Hartford")
.ta:		; abbreviation
	%String("HFD")
.tm:		; nickname
	%String("Whalers")
.ar:		; arena
	%String("Hartford Civic Center")
LosAngeles:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $66,$12,$11,$C9,$4A
.sodds:
	db 150,32
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,17,08,04,12,05,00	; line 1 Sc1
	db 01,16,18,08,04,12,05,00	; line 2 Sc2
	db 01,17,20,09,05,13,04,00	; line 3 Chk
	db 01,19,21,10,06,14,04,00	; line 4 PP1
	db 01,18,16,08,04,13,05,00	; line 5 PP2
	db 01,19,17,09,05,12,04,00	; line 6 PK1
	db 01,20,17,09,14,04,13,00	; line 7 PK2
	db 01,18,21,04,13,09,14,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Kelly Hrudey", $3263,$3444,$0000,$2223)	; 1
	%Player("Robb Stauber", $3562,$3553,$0000,$2222)	; 2
	%Player("Rick Knickle", $0122,$3332,$0000,$2221)	; 3
	%Player("Wayne Gretzky", $9946,$4542,$2262,$6060)	; 4
	%Player("Jimmy Carson", $1294,$4434,$2345,$4241)	; 5
	%Player("Corey Millen", $2343,$4432,$1534,$3333)	; 6
	%Player("Gary Shuchuk", $1462,$2201,$2322,$0322)	; 7
	%Player("Luc Robitaille", $2074,$4534,$2456,$5243)	; 8
	%Player("Tony Granato", $2164,$5443,$3334,$3334)	; 9
	%Player("Pat Conacher", $1572,$2222,$2423,$2431)	; 10
	%Player("Warren Rychel", $1072,$2211,$3612,$1515)	; 11
	%Player("Tomas Sandstrom", $0794,$4535,$3845,$3233)	; 12
	%Player("Jari Kurri", $1784,$3444,$2143,$4132)	; 13
	%Player("Mike Donnelly", $1164,$4432,$3423,$4332)	; 14
	%Player("Dave Taylor", $1873,$2233,$3532,$3323)	; 15
	%Player("Rob Blake", $04B4,$4444,$3341,$4344)	; 16
	%Player("Marty McSorley", $33C3,$3343,$3932,$4436)	; 17
	%Player("Alexei Zhitnik", $0254,$4343,$3432,$4133)	; 18
	%Player("Darryl Sydor", $2593,$3233,$3431,$3232)	; 19
	%Player("Charlie Huddy", $22A3,$2243,$3431,$3132)	; 20
	%Player("Mark Hardy", $2483,$3231,$3620,$2123)	; 21
	%Player("Brent Thompson", $0352,$2121,$2820,$2114)	; 22
	%Player("Tim Watters", $0562,$2121,$2620,$2122)	; 23
