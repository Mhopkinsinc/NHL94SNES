; Bank $9C, seventh 4 KB: the end of the team records (see bank9C_A000): the rest of Toronto, then Vancouver, Winnipeg,
; Washington, Florida and Anaheim. Then playoffseats, the playoff tree seedings (32 rows of 16 team numbers), and the
; start of the screen text records that the menu and stats code prints (a length word, then the text with position
; codes); they continue in the next file.

org $9CE011
	%Player("Bill Berg", $1072,$2232,$3423,$4523)	; 11
	%Player("Nikolai Borshevsky", $1664,$4423,$2044,$4241)	; 12
	%Player("Glenn Anderson", $0974,$4433,$2643,$4143)	; 13
	%Player("Rob Pearson", $1262,$2331,$1123,$4524)	; 14
	%Player("Mike Foligno", $7182,$2232,$5533,$3523)	; 15
	%Player("Ken Baumgartnr", $2292,$2021,$2A10,$2324)	; 16
	%Player("Todd Gill", $2363,$3332,$4422,$4123)	; 17
	%Player("Dave Ellett", $0494,$4345,$4441,$4242)	; 18
	%Player("Dimitri Mironov", $1573,$2333,$1232,$3132)	; 19
	%Player("Drake Berehowsky", $55A2,$2332,$3522,$3023)	; 20
	%Player("Jamie Macoun", $3483,$3244,$4431,$4442)	; 21
	%Player("Bob Rouse", $03A3,$3242,$4320,$4423)	; 22
	%Player("Sylvain Lefebvre", $0292,$2131,$3420,$4433)	; 23
	%Player("Bob McGill", $0882,$2023,$3523,$2324)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Toronto")
.ta:		; abbreviation
	%String("TOR")
.tm:		; nickname
	%String("Maple Leafs")
.ar:		; arena
	%String("Maple Leaf Gardens")
Vancouver:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $61,$02,$11,$E8,$47
.sodds:
	db 166,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,17,06,03,12,04,00	; line 1 Sc1
	db 01,18,21,09,03,13,05,00	; line 2 Sc2
	db 01,23,17,08,05,12,03,00	; line 3 Chk
	db 01,19,24,06,04,15,03,00	; line 4 PP1
	db 01,17,19,13,04,12,08,00	; line 5 PP2
	db 01,18,22,06,03,08,12,00	; line 6 PK1
	db 01,23,17,12,07,04,15,00	; line 7 PK2
	db 01,18,22,04,15,07,12,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Kirk McLean", $0184,$4444,$0000,$4433)	; 1
	%Player("Kay Whitmore", $3552,$3552,$0000,$2323)	; 2
	%Player("Cliff Ronning", $0755,$5432,$2043,$5141)	; 3
	%Player("Petr Nedved", $1952,$2432,$1036,$4233)	; 4
	%Player("Tom Fergus", $15A2,$2332,$2223,$3022)	; 5
	%Player("Geoff Courtnall", $1475,$5433,$1443,$3244)	; 6
	%Player("Murray Craven", $3263,$3433,$3434,$3031)	; 7
	%Player("Greg Adams", $0873,$3443,$3235,$4131)	; 8
	%Player("Sergio Momesso", $27B4,$3333,$4623,$4424)	; 9
	%Player("Gino Odjick", $29B2,$2232,$3A21,$3326)	; 10
	%Player("Garry Valk", $2372,$2232,$3623,$3323)	; 11
	%Player("Pavel Bure", $1055,$6544,$2054,$4442)	; 12
	%Player("Trevor Linden", $1694,$4444,$3344,$4342)	; 13
	%Player("Dixon Ward", $1792,$3333,$2125,$3123)	; 14
	%Player("Jim Sandlak", $25B1,$2333,$2922,$3324)	; 15
	%Player("Tim Hunter", $2692,$2122,$3923,$2324)	; 16
	%Player("Jyrki Lumme", $2174,$3342,$3441,$4142)	; 17
	%Player("Doug Lidster", $0393,$3233,$4341,$4142)	; 18
	%Player("Adrien Plavsic", $0672,$2332,$3622,$3023)	; 19
	%Player("Jiri Slegr", $24A3,$3333,$2631,$4134)	; 20
	%Player("Gerald Diduck", $04A3,$3234,$4731,$3434)	; 21
	%Player("Dave Babych", $44B2,$2343,$2630,$4233)	; 22
	%Player("Dana Murzyn", $0592,$3234,$4621,$4424)	; 23
	%Player("Robert Dirk", $22B2,$2132,$3632,$3324)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Vancouver")
.ta:		; abbreviation
	%String("VAN")
.tm:		; nickname
	%String("Canucks")
.ar:		; arena
	%String("Pacific Coliseum")
Winnipeg:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $45,$11,$11,$F8,$48
.sodds:
	db 214,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,19,18,04,03,13,09,00	; line 1 Sc1
	db 01,22,18,08,03,13,04,00	; line 2 Sc2
	db 01,19,21,09,04,14,03,00	; line 3 Chk
	db 01,20,24,10,06,17,03,00	; line 4 PP1
	db 01,20,18,08,03,13,04,00	; line 5 PP2
	db 01,19,21,09,04,14,03,00	; line 6 PK1
	db 01,19,21,10,06,05,16,00	; line 7 PK2
	db 01,24,22,05,16,10,06,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Bob Essensa", $3534,$4554,$0000,$4444)	; 1
	%Player("Jim Hrivnak", $3062,$3222,$0000,$2222)	; 2
	%Player("Alexei Zhamnov", $1075,$3433,$3054,$4152)	; 3
	%Player("Thomas Steen", $2584,$3433,$3444,$4053)	; 4
	%Player("Luciano Borsato", $3843,$3332,$3134,$3232)	; 5
	%Player("Mike Eagles", $3673,$3242,$5422,$5123)	; 6
	%Player("Stu Barnes", $1452,$3332,$2323,$3421)	; 7
	%Player("Darrin Shannon", $3492,$2343,$4034,$4033)	; 8
	%Player("Keith Tkachuk", $0793,$2334,$3623,$4424)	; 9
	%Player("Kris King", $17A3,$3242,$3622,$4324)	; 10
	%Player("Russ Romaniuk", $2163,$2122,$3623,$2522)	; 11
	%Player("Andy Brickley", $2392,$2221,$3220,$2030)	; 12
	%Player("Teemu Selanne", $1365,$6534,$3345,$5442)	; 13
	%Player("Evgeny Davydov", $1164,$4334,$1334,$3532)	; 14
	%Player("John Druce", $1592,$2332,$3322,$3122)	; 15
	%Player("Bryan Erickson", $1852,$3332,$3322,$3121)	; 16
	%Player("Tie Domi", $2092,$2232,$3923,$4126)	; 17
	%Player("Phil Housley", $0666,$5433,$2462,$4062)	; 18
	%Player("Teppo Numminen", $2774,$3353,$3142,$4132)	; 19
	%Player("Fredrik Olausson", $0494,$3434,$1142,$3141)	; 20
	%Player("Sergei Bautin", $0363,$3243,$4431,$4233)	; 21
	%Player("Igor Ulanov", $0592,$2242,$3621,$4024)	; 22
	%Player("Mike Lalor", $2293,$2132,$2420,$4523)	; 23
	%Player("Dean Kennedy", $2692,$2132,$3320,$4423)	; 24
	%Player("Randy Carlyle", $0892,$2122,$3621,$2522)	; 25
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Winnipeg")
.ta:		; abbreviation
	%String("WPG")
.tm:		; nickname
	%String("Jets")
.ar:		; arena
	%String("Winnipeg Arena")
Washington:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $52,$20,$11,$E8,$46
.sodds:
	db 181,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,18,17,04,03,12,13,00	; line 1 Sc1
	db 01,18,17,10,04,14,03,00	; line 2 Sc2
	db 01,19,20,09,03,12,04,00	; line 3 Chk
	db 01,21,22,11,05,13,04,00	; line 4 PP1
	db 01,20,17,04,03,12,06,00	; line 5 PP2
	db 01,18,19,06,05,13,04,00	; line 6 PK1
	db 01,21,17,03,14,10,06,00	; line 7 PK2
	db 01,19,20,10,06,03,14,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Don Beaupre", $3343,$4333,$0000,$3333)	; 1
	%Player("Rick Tabaracci", $3162,$3112,$0000,$3322)	; 2
	%Player("Mike Ridley", $1794,$4433,$2044,$4042)	; 3
	%Player("Dimitri Khristich", $0873,$3434,$3146,$4142)	; 4
	%Player("Dale Hunter", $3282,$2443,$4624,$4044)	; 5
	%Player("Michal Pivonka", $2083,$3433,$3443,$4043)	; 6
	%Player("Steve Konowlchuk", $2262,$2222,$3222,$2222)	; 7
	%Player("Reggie Savage", $1572,$2212,$2622,$1322)	; 8
	%Player("Bob Carpenter", $1174,$4333,$2432,$3443)	; 9
	%Player("Todd Krygier", $2162,$3232,$2422,$3512)	; 10
	%Player("Alan May", $1692,$2233,$3722,$3425)	; 11
	%Player("Peter Bondra", $1264,$6433,$2044,$4232)	; 12
	%Player("Pat Elynuik", $1963,$3333,$2335,$3122)	; 13
	%Player("Kelly Miller", $1084,$4333,$2043,$3241)	; 14
	%Player("Keith Jones", $2672,$2222,$3323,$2234)	; 15
	%Player("Paul MacDermid", $2392,$2232,$4724,$3323)	; 16
	%Player("Kevin Hatcher", $04C3,$3445,$4342,$4443)	; 17
	%Player("Al Iafrate", $34B4,$4446,$4642,$4444)	; 18
	%Player("Sylvain Cote", $0363,$3343,$3132,$4432)	; 19
	%Player("Calle Johansson", $0694,$3344,$3441,$4142)	; 20
	%Player("Paul Cavallini", $14A3,$3233,$3431,$3532)	; 21
	%Player("Shawn Anderson", $3692,$2122,$3621,$2331)	; 22
	%Player("Jason Woolley", $2562,$2111,$2220,$1212)	; 23
	%Player("Rod Langway", $05B3,$2022,$3230,$2323)	; 24
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Washington")
.ta:		; abbreviation
	%String("WSH")
.tm:		; nickname
	%String("Capitals")
.ar:		; arena
	%String("Capital Centre")
Florida:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $07,$02,$13,$96,$33
.sodds:
	db 214,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,14,12,08,05,04,07,00	; line 1 Sc1
	db 01,14,17,08,05,03,04,00	; line 2 Sc2
	db 01,16,12,06,10,11,05,00	; line 3 Chk
	db 01,13,15,07,09,04,05,00	; line 4 PP1
	db 01,14,12,08,05,04,10,00	; line 5 PP2
	db 01,13,17,06,10,03,05,00	; line 6 PK1
	db 01,14,12,09,05,07,08,00	; line 7 PK2
	db 01,13,17,07,08,09,05,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("John Vanbiesbrk", $3453,$4553,$0000,$3434)	; 1
	%Player("Mark Fitzpatrik", $3072,$4223,$0000,$2222)	; 2
	%Player("Tom Fitzgerald", $1482,$2232,$2122,$3222)	; 3
	%Player("Scott Mellanby", $2791,$1333,$4723,$3324)	; 4
	%Player("Brian Skrudland", $3984,$2242,$4633,$4434)	; 5
	%Player("Mike Hough", $1873,$2333,$2432,$3233)	; 6
	%Player("Dave Lowry", $1082,$2232,$3622,$3424)	; 7
	%Player("Andrei Lomakin", $2374,$3323,$1233,$3242)	; 8
	%Player("Randy Gilhen", $2072,$2132,$3221,$3521)	; 9
	%Player("Jesse Belanger", $2941,$2312,$2022,$1421)	; 10
	%Player("Bill Lindsay", $2271,$2222,$2022,$2421)	; 11
	%Player("Joe Cirella", $06A3,$3223,$2922,$3323)	; 12
	%Player("Alexnder Godynyuk", $21A2,$3222,$3822,$3512)	; 13
	%Player("Gord Murphy", $2885,$4234,$4931,$3333)	; 14
	%Player("Gord Hynes", $2642,$2221,$3222,$2522)	; 15
	%Player("Milan Tichy", $4383,$2112,$3821,$2224)	; 16
	%Player("Stephane Richer", $2593,$3333,$3332,$3322)	; 17
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Florida")
.ta:		; abbreviation
	%String("FLA")
.tm:		; nickname
	%String("Panthers")
.ar:		; arena
	%String("Miami Arena")
Anaheim:
.0:	dw .pld-.0,.sr-.0,.tn-.0,.ls+8-.0,.sr-.0,.sodds-.0,.ls-.0
.sr:		; the scouting report
	db $07,$02,$13,$97,$34
.sodds:
	db 214,0
.ls:		; -G,LD,RD,LW,-C,RW,XA,00: player numbers (1 = the first .pld entry)
	db 01,12,14,04,06,08,03,00	; line 1 Sc1
	db 01,12,16,03,06,11,04,00	; line 2 Sc2
	db 01,14,15,09,08,07,03,00	; line 3 Chk
	db 01,13,18,04,10,05,03,00	; line 4 PP1
	db 01,12,16,04,06,08,04,00	; line 5 PP2
	db 01,13,15,03,09,11,03,00	; line 6 PK1
	db 01,12,14,06,07,04,08,00	; line 7 PK2
	db 01,17,16,04,08,07,06,00	; line 8
.pld:		; name, then the ratings as 16 nibbles: unwl,sodp,chga,eytm
	%Player("Guy Hebert", $2962,$3332,$0000,$2222)	; 1
	%Player("Ron Tugnutt", $0122,$3331,$0000,$1112)	; 2
	%Player("Steven King", $2772,$2322,$1323,$3422)	; 3
	%Player("Troy Loney", $24A2,$3232,$4621,$3213)	; 4
	%Player("Stu Grimson", $23B1,$1021,$3A11,$2514)	; 5
	%Player("Terry Yake", $2563,$3433,$3334,$4032)	; 6
	%Player("Bob Corkum", $30A2,$2132,$2322,$3522)	; 7
	%Player("Anatoli Semenov", $2073,$3343,$2033,$4032)	; 8
	%Player("Lonnie Loach", $2862,$3322,$2623,$2222)	; 9
	%Player("Robin Bawa", $26B2,$2112,$1514,$1323)	; 10
	%Player("Tim Sweeney", $4152,$2322,$1022,$1411)	; 11
	%Player("Alexei Kasatonov", $07B4,$3234,$4441,$3142)	; 12
	%Player("Sean Hill", $3882,$2222,$3521,$2314)	; 13
	%Player("Randy Ladouceur", $39B3,$3131,$2421,$3514)	; 14
	%Player("David Williams", $0382,$2222,$2520,$2213)	; 15
	%Player("Bill Houlder", $33B3,$2332,$3422,$2421)	; 16
	%Player("Bobby Dollas", $32B2,$1121,$2110,$2111)	; 17
	%Player("Dennis Vial", $17B1,$1121,$3810,$2113)	; 18
	dw 2		; end of the player list (an empty String)
.tn:		; city
	%String("Anaheim")
.ta:		; abbreviation
	%String("ANH")
.tm:		; nickname
	%String("Mighty Ducks")
.ar:		; arena
	%String("Pond in Anaheim")

playoffseats:		; the playoff tree seedings: 32 rows of 16 team numbers (TeamList index)
	db 02,01,11,18, 13,24,12,17, 22,06,20,04, 10,03,25,23
	db 13,02,21,11, 18,17,14,01, 03,22,10,23, 20,06,05,04
	db 12,17,16,02, 09,11,24,01, 05,22,07,04, 19,23,10,06
	db 09,17,18,11, 24,01,12,02, 10,22,07,06, 05,04,03,23
	db 18,02,12,17, 09,11,16,01, 03,06,19,22, 05,23,07,04
	db 15,01,09,11, 13,17,14,02, 19,23,03,06, 05,04,07,22
	db 16,11,15,17, 21,02,13,01, 20,06,25,04, 00,23,03,22
	db 12,01,18,17, 16,11,13,02, 19,06,03,04, 05,23,10,22
	db 15,17,09,01, 08,11,24,02, 03,22,05,23, 25,04,10,06
	db 14,02,16,01, 18,11,09,17, 25,04,19,06, 20,23,03,22
	db 16,11,18,01, 12,17,13,02, 00,06,25,22, 10,23,03,04
	db 13,17,15,11, 14,02,12,01, 05,06,10,04, 19,22,20,23
	db 18,01,14,02, 15,11,16,17, 05,23,19,22, 07,04,03,06
	db 12,11,14,17, 15,01,09,02, 20,22,19,04, 05,06,07,23
	db 24,13,14,11, 16,02,21,17, 22,20,05,10, 25,04,19,23
	db 18,02,21,13, 12,11,09,17, 07,20,05,10, 19,23,06,04
	db 01,21,15,02, 12,11,18,17, 22,20,19,10, 05,23,25,04
	db 09,13,12,02, 15,11,01,17, 03,23,05,10, 22,04,07,20
	db 15,17,09,11, 08,02,14,13, 22,20,25,04, 06,23,07,10
	db 24,13,12,17, 14,02,01,11, 06,23,05,10, 07,04,25,20
	db 15,11,18,02, 01,13,24,17, 07,20,03,10, 25,23,06,04
	db 15,17,21,11, 18,13,12,02, 19,10,03,04, 25,20,07,23
	db 15,11,16,02, 12,08,18,17, 05,04,22,10, 25,20,19,23
	db 12,11,18,17, 15,13,16,02, 06,23,19,10, 22,20,07,04
	db 09,17,18,13, 15,11,01,02, 06,04,07,20, 03,10,22,23
	db 14,13,01,02, 24,11,15,17, 06,04,05,23, 07,10,25,20
	db 09,02,15,13, 12,17,01,11, 22,10,03,20, 06,23,19,04
	db 18,13,21,02, 01,11,08,17, 07,10,25,20, 03,04,05,23
	db 09,11,12,13, 24,02,18,17, 19,20,00,23, 03,04,06,10
	db 14,02,08,21, 24,17,01,11, 22,04,25,23, 05,10,00,20
	db 12,11,15,02, 21,17,14,13, 07,10,19,04, 00,23,06,20
	db 24,08,12,17, 01,11,21,02, 19,20,06,04, 00,10,25,23
incsrc "data/text/DATA8_9CEF59.asm"
