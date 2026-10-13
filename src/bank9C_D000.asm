; Bank $9C, sixth 4 KB: team records continued (see bank9C_A000): the rest of Philadelphia, then Pittsburgh, then
; Quebec, then SanJose, then StLouis, then TampaBay, then Toronto; Toronto continues in the next file.

org $9CD001
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Tommy Soderstrom", $3034,$4554,$0000,$3434)	; 1
	%Player("Dominic Roussel", $3363,$3333,$0000,$3322)	; 2
	%Player("Steph Beauregard", $3572,$3001,$0100,$2222)	; 3
	%Player("Eric Lindros", $88C4,$3444,$5946,$5244)	; 4
	%Player("Rod BrindAmour", $1794,$3444,$3444,$4243)	; 5
	%Player("Pelle Eklund", $0955,$4433,$3243,$4041)	; 6
	%Player("Josef Beranek", $4263,$3332,$1033,$3433)	; 7
	%Player("Keith Acton", $2542,$2243,$4032,$4232)	; 8
	%Player("Vachslav Butsayev", $2262,$2222,$2620,$2123)	; 9
	%Player("Brent Fedyk", $1882,$2433,$3323,$3122)	; 10
	%Player("Doug Evans", $1562,$2222,$2423,$2223)	; 11
	%Player("Dave Snuggerud", $1473,$3222,$2631,$2531)	; 12
	%Player("Claude Boivin", $1091,$1212,$2814,$1214)	; 13
	%Player("Mark Recchi", $0865,$4534,$3445,$4143)	; 14
	%Player("Kevin Dineen", $1174,$5342,$2733,$4534)	; 15
	%Player("Dave Brown", $2191,$1021,$2910,$2513)	; 16
	%Player("Garry Galley", $0372,$2342,$3631,$3233)	; 17
	%Player("Dimitri Yushkevich", $0274,$3343,$2431,$4333)	; 18
	%Player("Greg Hawgood", $2074,$3333,$2432,$3133)	; 19
	%Player("Terry Carkner", $29A2,$2232,$3621,$3024)	; 20
	%Player("Ric Nattress", $05A2,$2332,$2523,$3322)	; 21
	%Player("Ryan McGill", $2782,$2232,$2721,$3414)	; 22
	%Player("Shawn Cronin", $44A1,$1111,$2C13,$1513)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Philadelphia")
.ta:		; abbreviation
	%String("PHI")
.tm:		; nickname
	%String("Flyers")
.ar:		; arena
	%String("Spectrum")
Pittsburgh:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $71,$20,$21,$D9,$4B
.sodds:
	db 197,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,17,07,03,10,11,00	; line 1 Sc1
	db 01,16,17,07,03,10,04,00	; line 2 Sc2
	db 01,20,18,09,04,11,03,00	; line 3 Chk
	db 01,22,19,08,05,12,03,00	; line 4 PP1
	db 01,16,19,07,03,10,12,00	; line 5 PP2
	db 01,22,17,04,12,11,03,00	; line 6 PK1
	db 01,16,17,11,03,04,12,00	; line 7 PK2
	db 01,22,21,04,12,03,11,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Tom Barrasso", $35A4,$4554,$0100,$4444)	; 1
	%Player("Ken Wregget", $3182,$3442,$0000,$3232)	; 2
	%Player("Mario Lemieux", $66A5,$4644,$3366,$6062)	; 3
	%Player("Ron Francis", $1094,$3444,$4443,$4042)	; 4
	%Player("Shawn McEachern", $1573,$3333,$2433,$4332)	; 5
	%Player("Mike Stapleton", $2663,$2222,$2121,$2530)	; 6
	%Player("Kevin Stevens", $25B3,$4533,$3644,$5344)	; 7
	%Player("Dave Tippett", $1462,$3232,$2422,$3122)	; 8
	%Player("Jeff Daniels", $2092,$2122,$2623,$2421)	; 9
	%Player("Jaromir Jagr", $68A5,$4433,$4453,$4142)	; 10
	%Player("Rick Tocchet", $2292,$2544,$3735,$4134)	; 11
	%Player("Joe Mullen", $0764,$3433,$3145,$4230)	; 12
	%Player("Martin Straka", $8253,$3322,$2222,$2032)	; 13
	%Player("Mike Needham", $3962,$2222,$2523,$2521)	; 14
	%Player("Jay Caufield", $16E1,$2011,$3B10,$1314)	; 15
	%Player("Larry Murphy", $55A4,$3454,$3342,$5143)	; 16
	%Player("Ulf Samuelsson", $0584,$4353,$5630,$4135)	; 17
	%Player("Jim Paek", $0282,$3222,$2421,$3122)	; 18
	%Player("Paul Stanton", $2383,$3234,$3321,$3543)	; 19
	%Player("Peter Taglianeti", $3292,$2233,$4430,$4324)	; 20
	%Player("Mike Ramsey", $0683,$2232,$3622,$3122)	; 21
	%Player("Kjell Samuelsson", $28E2,$2134,$4731,$4523)	; 22
	%Player("Grant Jennings", $0392,$2132,$3820,$2313)	; 23
	%Player("Bryan Fogarty", $3381,$1211,$2220,$1011)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Pittsburgh")
.ta:		; abbreviation
	%String("PIT")
.tm:		; nickname
	%String("Penguins")
.ar:		; arena
	%String("Civic Arena")
Quebec:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $75,$21,$00,$D8,$47
.sodds:
	db 166,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,17,16,03,12,13,15,00	; line 1 Sc1
	db 01,17,16,07,03,12,04,00	; line 2 Sc2
	db 01,18,19,08,04,13,03,00	; line 3 Chk
	db 01,20,21,06,05,14,03,00	; line 4 PP1
	db 01,17,16,04,03,13,14,00	; line 5 PP2
	db 01,18,19,07,14,12,03,00	; line 6 PK1
	db 01,18,20,03,15,05,12,00	; line 7 PK2
	db 01,17,16,05,12,03,15,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Ron Hextall", $2774,$4444,$0000,$4433)	; 1
	%Player("Stephane Fiset", $3553,$4332,$0000,$2222)	; 2
	%Player("Joe Sakic", $1964,$4544,$2045,$5252)	; 3
	%Player("Mike Ricci", $0974,$4433,$3435,$3043)	; 4
	%Player("Claude Lapointe", $4753,$3342,$2432,$3123)	; 5
	%Player("Martin Rucinsky", $2553,$2323,$1433,$3132)	; 6
	%Player("Valeri Kamensky", $3184,$4435,$2543,$4142)	; 7
	%Player("Gino Cavallini", $44B1,$3222,$2423,$2222)	; 8
	%Player("Scott Pearson", $2292,$2222,$3624,$3524)	; 9
	%Player("Chris Simon", $12D1,$1101,$2811,$0515)	; 10
	%Player("Tony Twist", $15A1,$1101,$1C10,$1414)	; 11
	%Player("Mats Sundin", $1374,$4544,$1345,$4043)	; 12
	%Player("Owen Nolan", $1184,$4434,$1744,$4334)	; 13
	%Player("Andrei Kovalenko", $5133,$4433,$3434,$4132)	; 14
	%Player("Scott Young", $4873,$3343,$2133,$3431)	; 15
	%Player("Steve Duchesne", $2884,$4444,$2442,$4142)	; 16
	%Player("Curtis Leschyshyn", $0793,$4342,$3423,$4032)	; 17
	%Player("Alexei Gusarov", $0563,$3333,$3033,$4032)	; 18
	%Player("Kerry Huffman", $0293,$3333,$3631,$3223)	; 19
	%Player("Adam Foote", $5262,$2241,$3321,$3224)	; 20
	%Player("Steven Finn", $2982,$2233,$3622,$3424)	; 21
	%Player("Mikhail Tatarinov", $0483,$3225,$4641,$2443)	; 22
	%Player("Craig Wolanin", $0692,$2221,$2811,$2114)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Quebec")
.ta:		; abbreviation
	%String("QUE")
.tm:		; nickname
	%String("Nordiques")
.ar:		; arena
	%String("Colisee de Quebec")
SanJose:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $07,$02,$12,$C8,$38
.sodds:
	db 102,48
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,17,16,09,04,13,05,00	; line 1 Sc1
	db 01,17,20,09,04,13,05,00	; line 2 Sc2
	db 01,18,21,11,05,14,04,00	; line 3 Chk
	db 01,16,23,10,06,15,04,00	; line 4 PP1
	db 01,16,18,09,04,13,06,00	; line 5 PP2
	db 01,17,20,10,06,05,04,00	; line 6 PK1
	db 01,20,22,04,13,05,07,00	; line 7 PK2
	db 01,17,21,07,05,04,13,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Arturs Irbe", $3252,$4443,$0000,$3322)	; 1
	%Player("Jeff Hackett", $3052,$3112,$0000,$2222)	; 2
	%Player("Brian Hayward", $0162,$3002,$0000,$2222)	; 3
	%Player("Kelly Kisio", $1162,$2443,$3334,$4033)	; 4
	%Player("Rob Gaudreau", $3763,$3333,$2323,$4531)	; 5
	%Player("Dean Evason", $1261,$1232,$3323,$3323)	; 6
	%Player("Mike Sullivan", $4762,$3232,$1021,$4521)	; 7
	%Player("Perry Berezan", $1674,$4222,$3322,$2533)	; 8
	%Player("Johan Garpenlov", $1063,$3422,$1033,$3122)	; 9
	%Player("Jeff Odgers", $3691,$2322,$2623,$3415)	; 10
	%Player("John Carter", $2042,$2222,$2821,$2523)	; 11
	%Player("David Maley", $2581,$1112,$3820,$1414)	; 12
	%Player("Pat Falloon", $1774,$4323,$1342,$4531)	; 13
	%Player("Ed Courtenay", $3992,$2331,$1313,$2121)	; 14
	%Player("Mark Pederson", $1882,$2322,$2623,$2522)	; 15
	%Player("Doug Wilson", $2474,$3336,$3641,$3343)	; 16
	%Player("Neil Wilkinson", $0573,$3132,$3530,$4443)	; 17
	%Player("Sandis Ozolinsh", $0673,$3333,$3632,$4233)	; 18
	%Player("Tom Pederson", $4141,$2322,$2522,$2432)	; 19
	%Player("Doug Zmolek", $19C2,$2232,$3621,$3524)	; 20
	%Player("Jay More", $0473,$2134,$3331,$3534)	; 21
	%Player("Peter Ahola", $2192,$2132,$3621,$3422)	; 22
	%Player("Rob Zettler", $0272,$2132,$2430,$3434)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("San Jose")
.ta:		; abbreviation
	%String("SJ")
.tm:		; nickname
	%String("Sharks")
.ar:		; arena
	%String("San Jose Arena")
StLouis:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $22,$20,$21,$D9,$45
.sodds:
	db 208,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,16,15,10,02,11,03,00	; line 1 Sc1
	db 01,15,16,09,05,11,02,00	; line 2 Sc2
	db 01,18,22,06,02,10,05,00	; line 3 Chk
	db 01,17,19,08,03,13,05,00	; line 4 PP1
	db 01,15,17,10,02,11,04,00	; line 5 PP2
	db 01,19,20,03,04,12,10,00	; line 6 PK1
	db 01,18,22,05,04,08,13,00	; line 7 PK2
	db 01,19,16,08,13,04,05,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Curtis Joseph", $3164,$4664,$0000,$3344)	; 1
	%Player("Craig Janney", $1574,$3543,$2044,$4040)	; 2
	%Player("Nelson Emerson", $0744,$4433,$2343,$4132)	; 3
	%Player("Ron Sutter", $2263,$3342,$4533,$4343)	; 4
	%Player("Ron Wilson", $1863,$3241,$2022,$4322)	; 5
	%Player("Bob Bassen", $2843,$4222,$4833,$2323)	; 6
	%Player("Philippe Bozon", $3662,$2222,$1621,$2513)	; 7
	%Player("Igor Korolev", $3872,$2232,$2021,$3021)	; 8
	%Player("Basil McRae", $1792,$2222,$2C21,$3415)	; 9
	%Player("Brendan Shanahan", $19A3,$3544,$2745,$4244)	; 10
	%Player("Brett Hull", $1694,$4536,$3353,$4432)	; 11
	%Player("Kevin Miller", $1474,$3343,$3733,$4333)	; 12
	%Player("Rich Sutter", $2373,$3241,$2322,$4523)	; 13
	%Player("Kelly Chase", $3981,$1121,$1911,$2315)	; 14
	%Player("Jeff Brown", $2193,$3445,$2343,$5142)	; 15
	%Player("Garth Butcher", $0592,$3242,$4731,$4434)	; 16
	%Player("Doug Crossman", $0672,$2332,$2623,$4032)	; 17
	%Player("Rick Zombo", $0482,$2233,$2320,$4023)	; 18
	%Player("Stephane Quintal", $33B2,$2142,$3730,$4433)	; 19
	%Player("Lee Norwood", $2082,$2231,$3822,$3224)	; 20
	%Player("Bret Hedican", $4482,$2112,$3620,$1322)	; 21
	%Player("Curt Giles", $0253,$2131,$2220,$3312)	; 22
	%Player("Murray Baron", $34A3,$3122,$2621,$2513)	; 23
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("St. Louis")
.ta:		; abbreviation
	%String("STL")
.tm:		; nickname
	%String("Blues")
.ar:		; arena
	%String("St. Louis Arena")
TampaBay:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $05,$02,$00,$E7,$38
.sodds:
	db 104,64
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,11,04,05,06,00	; line 1 Sc1
	db 01,21,22,12,04,14,06,00	; line 2 Sc2
	db 01,20,23,11,06,16,04,00	; line 3 Chk
	db 01,18,19,13,05,15,04,00	; line 4 PP1
	db 01,19,20,12,04,14,05,00	; line 5 PP2
	db 01,18,21,11,06,05,04,00	; line 6 PK1
	db 01,21,18,11,16,14,15,00	; line 7 PK2
	db 01,19,20,15,14,11,16,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Wendell Young", $0163,$3223,$0000,$3233)	; 1
	%Player("Pat Jablonski", $3552,$3222,$0100,$2222)	; 2
	%Player("J.C. Bergeron", $3072,$3222,$0000,$1111)	; 3
	%Player("Brian Bradley", $1944,$3434,$3335,$4233)	; 4
	%Player("Chris Kontos", $1683,$3433,$3035,$4330)	; 5
	%Player("Adam Creighton", $10A3,$2322,$3422,$3433)	; 6
	%Player("Marc Bureau", $2873,$3332,$2132,$3324)	; 7
	%Player("Rob DiMaio", $1852,$3332,$2522,$3223)	; 8
	%Player("Steve Kasper", $1153,$3132,$4433,$3231)	; 9
	%Player("Jason Lafreniere", $1762,$2332,$1324,$2212)	; 10
	%Player("Mikael Andersson", $3462,$4232,$1032,$4530)	; 11
	%Player("Rob Zamuner", $0792,$3322,$3432,$3322)	; 12
	%Player("Steve Maltais", $37A2,$2232,$3021,$3422)	; 13
	%Player("John Tucker", $1492,$3333,$2332,$3233)	; 14
	%Player("Danton Cole", $2473,$3332,$2122,$3421)	; 15
	%Player("Tim Bergland", $2182,$2132,$2321,$3522)	; 16
	%Player("Stan Drulia", $2771,$2102,$2312,$0512)	; 17
	%Player("Bob Beers", $0293,$3332,$2322,$3323)	; 18
	%Player("Roman Hamrlik", $4473,$2233,$2431,$3423)	; 19
	%Player("Shawn Chambers", $2292,$2332,$2221,$3222)	; 20
	%Player("Marc Bergevin", $2562,$2223,$3420,$3322)	; 21
	%Player("Joe Reekie", $29B3,$2223,$2630,$3223)	; 22
	%Player("Chris Lipuma", $4061,$1211,$0210,$1114)	; 23
	%Player("Matt Hervey", $2691,$1211,$2910,$1304)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Tampa Bay")
.ta:		; abbreviation
	%String("TB")
.tm:		; nickname
	%String("Lightning")
.ar:		; arena
	%String("Expo Hall")
Toronto:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $20,$20,$11,$E8,$48
.sodds:
	db 150,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,17,18,08,03,12,14,00	; line 1 Sc1
	db 01,20,16,08,03,12,05,00	; line 2 Sc2
	db 01,22,21,10,05,13,03,00	; line 3 Chk
	db 01,17,18,09,04,14,03,00	; line 4 PP1
	db 01,17,16,08,03,12,14,00	; line 5 PP2
	db 01,18,20,14,04,13,03,00	; line 6 PK1
	db 01,17,22,05,03,11,06,00	; line 7 PK2
	db 01,20,16,11,06,03,05,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Felix Potvin", $2964,$4664,$0000,$4444)	; 1
	%Player("Daren Puppa", $0193,$4552,$0100,$2233)	; 2
	%Player("Doug Gilmour", $9345,$4554,$4444,$6043)	; 3
	%Player("John Cullen", $1974,$3433,$2344,$4143)	; 4
	%Player("Mike Krushelski", $2693,$3342,$3434,$4322)	; 5
	%Player("Peter Zezel", $2593,$3333,$4033,$4141)	; 6
	%Player("Dave McLlwain", $0773,$2231,$3433,$3532)	; 7
	%Player("Dave Andreychuk", $14B3,$3444,$4334,$5432)	; 8
	%Player("Wendel Clark", $1783,$3335,$4643,$4344)	; 9
	%Player("Mark Osborne", $2192,$2242,$3422,$4413)	; 10
