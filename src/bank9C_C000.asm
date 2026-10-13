; Bank $9C, fifth 4 KB: team records continued (see bank9C_A000): the rest of LosAngeles, then Dallas, then Montreal,
; then NewJersey, then NYIslanders, then NYRangers, then Ottawa, then Philadelphia; Philadelphia continues in the next
; file.

org $9CC007
	%Player("Rene Chapdlaine", $0881,$1010,$1510,$1313)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Los Angeles")
.ta:		; abbreviation
	%String("LA")
.tm:		; nickname
	%String("Kings")
.ar:		; arena
	%String("Great Western Forum")
Dallas:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $14,$10,$00,$D9,$43
.sodds:
	db 181,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,17,04,03,10,11,00	; line 1 Sc1
	db 01,16,19,03,11,15,04,00	; line 2 Sc2
	db 01,18,20,07,04,13,11,00	; line 3 Chk
	db 01,21,17,08,05,10,11,00	; line 4 PP1
	db 01,16,17,11,03,10,04,00	; line 5 PP2
	db 01,21,18,07,04,12,10,00	; line 6 PK1
	db 01,23,19,05,10,07,08,00	; line 7 PK2
	db 01,16,20,07,08,05,10,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Jon Casey", $3024,$3443,$0000,$2234)	; 1
	%Player("Darcy Wakaluk", $3562,$3333,$0000,$2232)	; 2
	%Player("Mike Modano", $0975,$5445,$2452,$5243)	; 3
	%Player("Dave Gagner", $1564,$4443,$2444,$4244)	; 4
	%Player("Neal Broten", $0744,$4353,$3032,$4341)	; 5
	%Player("Brent Gilchrist", $4164,$3223,$2042,$2532)	; 6
	%Player("Mike McPhee", $1794,$3333,$4422,$4422)	; 7
	%Player("Gaetan Duchesne", $1093,$4232,$3423,$3511)	; 8
	%Player("Brian Propp", $1683,$3323,$3632,$2530)	; 9
	%Player("Russ Courtnall", $2665,$6424,$2133,$3432)	; 10
	%Player("Ulf Dahlen", $2283,$4433,$2044,$4330)	; 11
	%Player("Mike Craig", $2063,$3333,$3743,$3223)	; 12
	%Player("Trent Klatt", $2992,$2312,$1521,$1122)	; 13
	%Player("Shane Churla", $2791,$2221,$2922,$2125)	; 14
	%Player("Stewart Gavin", $1273,$3221,$2022,$2513)	; 15
	%Player("Mark Tinordi", $2493,$3344,$4433,$4224)	; 16
	%Player("Tommy Sjodin", $3364,$3334,$2131,$3331)	; 17
	%Player("Jim Johnson", $0672,$3242,$3631,$4143)	; 18
	%Player("Derian Hatcher", $0293,$2232,$2421,$4224)	; 19
	%Player("Craig Ludwig", $03C2,$2132,$3420,$3424)	; 20
	%Player("Richard Matvichuk", $0472,$3133,$3630,$3522)	; 21
	%Player("Mark Osiecki", $2392,$2122,$2520,$1312)	; 22
	%Player("Brad Berry", $0572,$2032,$3420,$3514)	; 23
	%Player("Enrico Ciccone", $3991,$1022,$2820,$3525)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Dallas")
.ta:		; abbreviation
	%String("DAL")
.tm:		; nickname
	%String("Stars")
.ar:		; arena
	%String("Dallas Arena")
Montreal:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $52,$11,$21,$E8,$49
.sodds:
	db 197,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,17,07,03,12,04,00	; line 1 Sc1
	db 01,23,18,07,03,12,04,00	; line 2 Sc2
	db 01,22,17,08,04,14,03,00	; line 3 Chk
	db 01,19,20,09,05,13,03,00	; line 4 PP1
	db 01,18,17,07,03,12,05,00	; line 5 PP2
	db 01,19,20,08,04,05,03,00	; line 6 PK1
	db 01,17,23,07,06,03,13,00	; line 7 PK2
	db 01,22,19,03,13,07,06,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Patrick Roy", $3366,$4446,$0000,$5566)	; 1
	%Player("Andre Racicot", $3742,$3333,$0000,$2222)	; 2
	%Player("Kirk Muller", $1194,$4444,$4444,$4143)	; 3
	%Player("Stephan Lebeau", $4754,$4433,$2145,$4031)	; 4
	%Player("Denis Savard", $1855,$4433,$2353,$3043)	; 5
	%Player("Guy Carbonneau", $2164,$3242,$4141,$3341)	; 6
	%Player("Vincent Damphousse", $2564,$4433,$2053,$4243)	; 7
	%Player("Gilbert Dionne", $4583,$4333,$2433,$3232)	; 8
	%Player("John Leclair", $17B3,$4333,$3033,$3222)	; 9
	%Player("Benoit Brunet", $2262,$2322,$2223,$2222)	; 10
	%Player("Mario Roberge", $3261,$1112,$3813,$1314)	; 11
	%Player("Brian Bellows", $2384,$4434,$2344,$4242)	; 12
	%Player("Mike Keane", $1253,$4432,$3323,$3033)	; 13
	%Player("Gary Leeman", $2654,$4323,$2933,$3232)	; 14
	%Player("Todd Ewen", $36B1,$1211,$3712,$2314)	; 15
	%Player("Ed Ronan", $3182,$2212,$3322,$1421)	; 16
	%Player("Eric Desjardins", $2894,$3343,$4342,$4233)	; 17
	%Player("Matt Schneider", $2773,$4333,$3442,$4243)	; 18
	%Player("Patrice Brisebois", $4353,$3333,$3722,$4323)	; 19
	%Player("Kevin Haller", $1462,$2231,$2612,$4523)	; 20
	%Player("Rob Ramage", $0593,$2233,$4731,$3534)	; 21
	%Player("J.J. Daigneault", $4864,$3244,$3432,$4422)	; 22
	%Player("Lyle Odelein", $2493,$2242,$3620,$3324)	; 23
	%Player("Donald Dufresne", $3492,$2122,$3921,$2313)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Montreal")
.ta:		; abbreviation
	%String("MTL")
.tm:		; nickname
	%String("Canadiens")
.ar:		; arena
	%String("Montreal Forum")
NewJersey:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $34,$11,$12,$F7,$44
.sodds:
	db 152,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,12,03,13,08,00	; line 1 Sc1
	db 01,18,21,08,04,12,03,00	; line 2 Sc2
	db 01,19,23,07,03,15,04,00	; line 3 Chk
	db 01,20,22,09,05,13,04,00	; line 4 PP1
	db 01,18,20,12,05,13,07,00	; line 5 PP2
	db 01,22,21,08,09,07,13,00	; line 6 PK1
	db 01,18,22,07,17,08,03,00	; line 7 PK2
	db 01,20,19,08,03,07,17,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Chris Terreri", $3124,$4443,$0000,$3333)	; 1
	%Player("Craig Billington", $0143,$4221,$0000,$2222)	; 2
	%Player("Alexnder Semak", $2064,$3443,$3144,$3242)	; 3
	%Player("Bernie Nicholls", $1963,$3433,$1342,$3043)	; 4
	%Player("Peter Stastny", $2694,$3343,$3044,$3241)	; 5
	%Player("Janne Ojanen", $3492,$2322,$2222,$2232)	; 6
	%Player("Valeri Zelepukin", $2564,$4433,$1043,$3143)	; 7
	%Player("John MacLean", $1593,$3344,$3733,$4423)	; 8
	%Player("Bobby Holik", $16A3,$4333,$3333,$4533)	; 9
	%Player("Tom Chorske", $0992,$2321,$2332,$2232)	; 10
	%Player("Troy Mallette", $08A2,$2221,$1824,$1313)	; 11
	%Player("Stephane Richer", $4494,$4435,$2143,$4432)	; 12
	%Player("Claude Lemieux", $22B4,$4434,$3732,$4334)	; 13
	%Player("Bill Guerin", $1292,$2323,$2333,$2323)	; 14
	%Player("Randy McKay", $2162,$2222,$2922,$3424)	; 15
	%Player("Scott Pellerin", $1862,$3332,$2623,$2223)	; 16
	%Player("Dave Barr", $1183,$3233,$3323,$3222)	; 17
	%Player("Scott Stevens", $04B4,$4344,$5642,$5043)	; 18
	%Player("Vachslav Fetisov", $02B4,$2244,$4441,$3044)	; 19
	%Player("Bruce Driver", $2363,$3342,$3432,$4232)	; 20
	%Player("Scott Niedrmayer", $2793,$3333,$3432,$3132)	; 21
	%Player("Ken Daneyko", $03A2,$2141,$4620,$4414)	; 22
	%Player("Tommy Albelin", $0673,$2232,$2230,$3322)	; 23
	%Player("Myles O'Connor", $0571,$1011,$1210,$1303)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("New Jersey")
.ta:		; abbreviation
	%String("NJ")
.tm:		; nickname
	%String("Devils")
.ar:		; arena
	%String("Meadowlands Arena")
NYIslanders:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $53,$21,$00,$D8,$42
.sodds:
	db 144,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,15,08,02,03,10,00	; line 1 Sc1
	db 01,20,17,08,02,11,03,00	; line 2 Sc2
	db 01,15,16,09,03,12,02,00	; line 3 Chk
	db 01,18,19,10,06,13,02,00	; line 4 PP1
	db 01,15,19,08,02,09,03,00	; line 5 PP2
	db 01,18,17,06,03,11,08,00	; line 6 PK1
	db 01,20,18,12,11,03,13,00	; line 7 PK2
	db 01,15,22,03,13,11,12,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Glenn Healy", $3552,$4442,$0000,$2222)	; 1
	%Player("Pierre Turgeon", $7794,$4534,$3445,$5141)	; 2
	%Player("Benoit Hogue", $3374,$5433,$2445,$4143)	; 3
	%Player("Marty McInnis", $1843,$3322,$2333,$3022)	; 4
	%Player("Travis Green", $3982,$2322,$3121,$2322)	; 5
	%Player("Ray Ferraro", $2063,$3334,$2643,$4333)	; 6
	%Player("Claude Loiselle", $1083,$2211,$3833,$1524)	; 7
	%Player("Steve Thomas", $3264,$4433,$4433,$4243)	; 8
	%Player("Derek King", $2793,$2434,$1445,$4222)	; 9
	%Player("Dave Volek", $2564,$4322,$1242,$4532)	; 10
	%Player("Patrick Flatley", $2683,$2432,$3342,$4042)	; 11
	%Player("Brian Mullen", $1663,$3333,$2433,$4531)	; 12
	%Player("Brad Dalgarno", $15B1,$2321,$1524,$2123)	; 13
	%Player("Mick Vukota", $1282,$3111,$1911,$2414)	; 14
	%Player("Vladimir Malakhov", $23A3,$3434,$3432,$4233)	; 15
	%Player("Darius Kasparitis", $1174,$3233,$4431,$3234)	; 16
	%Player("Jeff Norton", $0883,$3432,$2422,$4132)	; 17
	%Player("Uwe Krupp", $04E2,$2343,$3322,$4132)	; 18
	%Player("Tom Kurvers", $2883,$3434,$2631,$4132)	; 19
	%Player("Scott Lachance", $0782,$2243,$3432,$4133)	; 20
	%Player("Dennis Vaske", $37A1,$1212,$2611,$1113)	; 21
	%Player("Richard Pilon", $4793,$3123,$3821,$2515)	; 22
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("New York")
.ta:		; abbreviation
	%String("NYI")
.tm:		; nickname
	%String("Islanders")
.ar:		; arena
	%String("Nassau Coliseum")
NYRangers:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $34,$11,$11,$E7,$4A
.sodds:
	db 144,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,17,16,06,02,10,07,00	; line 1 Sc1
	db 01,16,19,07,02,11,05,00	; line 2 Sc2
	db 01,17,20,06,05,12,02,00	; line 3 Chk
	db 01,18,22,08,03,10,02,00	; line 4 PP1
	db 01,16,17,11,02,10,04,00	; line 5 PP2
	db 01,18,21,07,04,12,10,00	; line 6 PK1
	db 01,16,19,07,02,04,03,00	; line 7 PK2
	db 01,17,20,04,03,07,02,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Mike Richter", $3573,$4443,$0000,$4444)	; 1
	%Player("Mark Messier", $11A5,$4443,$5453,$4053)	; 2
	%Player("Sergei Nemchinov", $1364,$3353,$4034,$5232)	; 3
	%Player("Darren Turcotte", $0864,$4433,$2443,$4432)	; 4
	%Player("Ed Olczyk", $1294,$3334,$2443,$3442)	; 5
	%Player("Esa Tikkanen", $1095,$5344,$5442,$4443)	; 6
	%Player("Adam Graves", $0964,$4432,$3633,$4534)	; 7
	%Player("Phil Bourque", $2982,$4232,$4832,$3222)	; 8
	%Player("Jan Erixon", $2083,$3232,$2233,$3031)	; 9
	%Player("Mike Gartner", $2275,$5445,$2353,$5552)	; 10
	%Player("Tony Amonte", $3364,$4433,$1333,$4332)	; 11
	%Player("Alexei Kovalev", $2774,$3333,$1034,$3433)	; 12
	%Player("Paul Broten", $3771,$1231,$2312,$2312)	; 13
	%Player("Joey Kocur", $2682,$1132,$3921,$2424)	; 14
	%Player("Mike Hartman", $1872,$3101,$3611,$1514)	; 15
	%Player("Brian Leetch", $0266,$3444,$2651,$5252)	; 16
	%Player("James Patrick", $0394,$4344,$4341,$4243)	; 17
	%Player("Sergei Zubov", $2173,$3343,$3332,$3130)	; 18
	%Player("Jeff Beukeboom", $23B2,$2242,$3720,$3024)	; 19
	%Player("Kevin Lowe", $0484,$3243,$4241,$3133)	; 20
	%Player("Peter Andersson", $0592,$3322,$2231,$2432)	; 21
	%Player("Jay Wells", $24A2,$2222,$3620,$2124)	; 22
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("New York")
.ta:		; abbreviation
	%String("NYR")
.tm:		; nickname
	%String("Rangers")
.ar:		; arena
	%String("Madison Square Garden")
Ottawa:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $07,$02,$13,$F8,$37
.sodds:
	db 197,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,20,19,10,03,15,11,00	; line 1 Sc1
	db 01,20,19,10,03,15,07,00	; line 2 Sc2
	db 01,22,25,12,07,17,03,00	; line 3 Chk
	db 01,21,23,11,04,16,03,00	; line 4 PP1
	db 01,20,19,15,03,16,05,00	; line 5 PP2
	db 01,23,22,10,05,08,16,00	; line 6 PK1
	db 01,19,23,06,07,12,04,00	; line 7 PK2
	db 01,20,25,12,04,07,06,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Peter Sidorkwicz", $3162,$3112,$0000,$2222)	; 1
	%Player("Daniel Berthiaume", $3213,$3112,$0000,$2222)	; 2
	%Player("Jamie Baker", $1373,$3333,$2433,$4232)	; 3
	%Player("Mark Lamb", $0764,$3242,$3031,$3333)	; 4
	%Player("Neil Brady", $1292,$2332,$2622,$3133)	; 5
	%Player("Mark Freer", $1162,$2332,$2423,$4322)	; 6
	%Player("Laurie Boschman", $1664,$2242,$3432,$3523)	; 7
	%Player("David Archibald", $1572,$2232,$1622,$3522)	; 8
	%Player("Rob Murphy", $1891,$2222,$3621,$2412)	; 9
	%Player("Sylvain Turgeon", $6194,$4333,$2432,$3523)	; 10
	%Player("Mike Peluso", $4492,$2232,$3A13,$3525)	; 11
	%Player("Doug Smail", $0953,$3232,$2621,$2423)	; 12
	%Player("Jeff Lazaro", $2863,$3312,$2833,$1522)	; 13
	%Player("Darcy Loewen", $1062,$2122,$1612,$2424)	; 14
	%Player("Bob Kudelski", $2693,$3333,$2334,$3432)	; 15
	%Player("Jody Hull", $1792,$2332,$3122,$3321)	; 16
	%Player("Andrew McBain", $2092,$2332,$3522,$2122)	; 17
	%Player("Tomas Jelinek", $2572,$2222,$1632,$2513)	; 18
	%Player("Norm Maciver", $2263,$3443,$3022,$4133)	; 19
	%Player("Brad Shaw", $0473,$2333,$2331,$3232)	; 20
	%Player("Darren Rumble", $3492,$2232,$3420,$3423)	; 21
	%Player("Chris Luongo", $2362,$2131,$1320,$2423)	; 22
	%Player("Ken Hammond", $0573,$2132,$3621,$3513)	; 23
	%Player("Gord Dineen", $0681,$1221,$2311,$2513)	; 24
	%Player("Brad Marsh", $14B2,$2031,$3610,$2522)	; 25
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Ottawa")
.ta:		; abbreviation
	%String("OTW")
.tm:		; nickname
	%String("Senators")
.ar:		; arena
	%String("Ottawa Civic Center")
Philadelphia:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $36,$02,$22,$D7,$45
.sodds:
	db 134,48
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,17,05,04,14,15,00	; line 1 Sc1
	db 01,18,17,10,04,14,08,00	; line 2 Sc2
	db 01,20,22,08,05,15,04,00	; line 3 Chk
	db 01,19,21,11,06,16,04,00	; line 4 PP1
	db 01,17,19,05,04,14,06,00	; line 5 PP2
	db 01,20,18,10,06,15,04,00	; line 6 PK1
	db 01,17,22,08,14,10,05,00	; line 7 PK2
	db 01,20,18,10,05,08,14,00	; line 8
