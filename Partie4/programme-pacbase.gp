000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID.  PGSTAT.                                             PGSTAT
000030 AUTHOR.         STATS VENTES PAR VILLE.                          PGSTAT
000040 DATE-COMPILED.   11/08/98.                                       PGSTAT
000050 ENVIRONMENT DIVISION.                                            PGSTAT
000060 CONFIGURATION SECTION.                                           PGSTAT
000070 SOURCE-COMPUTER. IBM-370.                                        PGSTAT
000080 OBJECT-COMPUTER. IBM-370.                                        PGSTAT
000090 SPECIAL-NAMES.                                                   PGSTAT
000100      C01 IS SAUTP                                                PGSTAT
000110      CSP IS SAUT0.                                               PGSTAT
000130 INPUT-OUTPUT SECTION.                                            PGSTAT
000140 FILE-CONTROL.                                                    PGSTAT
000150      SELECT     SE-FICHIER    ASSIGN    UT-S-DDSE.               PGSTAT
000160      SELECT     VE-FICHIER    ASSIGN    UT-S-DDVE.               PGSTAT
000170 DATA DIVISION.                                                   PGSTAT
000180 FILE SECTION.                                                    PGSTAT
000190 FD                 SE-FICHIER                                    PGSTAT
000200      BLOCK              00000 RECORDS                            PGSTAT
000210      DATA RECORD                                                 PGSTAT
000220                    SE00                                          PGSTAT
000230           LABEL RECORD STANDARD.                                 PGSTAT
000240 01               SE00.                                           PGSTAT
000250   10             FILLER        PICTURE X(133).                   PGSTAT
000260 FD                 VE-FICHIER                                    PGSTAT
000270      BLOCK              00000 RECORDS                            PGSTAT
000280      DATA RECORD                                                 PGSTAT
000290                    VE00                                          PGSTAT
000300           LABEL RECORD STANDARD.                                 PGSTAT
000310 01               VE00.                                           PGSTAT
000320   10             VE00-VILLVE   PICTURE X(20).                    PGSTAT
000330   10             VE00-QTEVE    PICTURE 9(2).                     PGSTAT
000340   10             VE00-PRIXVE   PICTURE 9(3)V99.                  PGSTAT
000350   10             VE00-FILLER   PICTURE X(3).                     PGSTAT
000360 WORKING-STORAGE SECTION.                                         PGSTAT
000370*SD: WS BIB: ST SEL: 10______ FORM: I DESC: 2 NIV: 1 ORG: _ SS: _ 7ST100
000380 01               WS10.                                           PGSTAT
000390   10             WS10-CUMVST   PICTURE 9(6)V99 VALUE ZERO.       PGSTAT
000400   10             WS10-TOTGST   PICTURE 9(8)V99 VALUE ZERO.       PGSTAT
000410*SD: ED BIB: ST SEL: 10______ FORM: S DESC: 1 NIV: 1 ORG: _ SS: _ 7ST200
000420 01               ED10.                                           PGSTAT
000430   10             ED10-CUMVST   PICTURE Z(3)BZZ9.99.              PGSTAT
000440   10             ED10-TOTGST   PICTURE Z(2)BZ(3)BZZ9.99.         PGSTAT
000450 01               WS00-MTLIST   PICTURE 9(8)V99.                  7ST300
000460 01               DEBUT-WSS.                                      PGSTAT
000470   05             FILLER        PICTURE X(7) VALUE                PGSTAT
000480                                'WORKING'.                        PGSTAT
000490   05             IK            PICTURE X.                        PGSTAT
000500 01               CONSTANTES-PAC.                                 PGSTAT
000510   05             FILLER        PICTURE X(60) VALUE               PGSTAT
000520     '0071 LBA11/08/98PGSTATTEST'.                                PGSTAT
000540 01               PAC-CONSTANTES REDEFINES CONSTANTES-PAC.        PGSTAT
000550   05             NUGNA         PICTURE X(5).                     PGSTAT
000560   05             APPLI         PICTURE X(3).                     PGSTAT
000570   05             DATGN         PICTURE X(8).                     PGSTAT
000580   05             PROGR         PICTURE X(6).                     PGSTAT
000590   05             CODUTI        PICTURE X(8).                     PGSTAT
000600   05             TIMGN         PICTURE X(8).                     PGSTAT
000610   05             PROGE         PICTURE X(8).                     PGSTAT
000620   05             COBASE        PICTURE X(4).                     PGSTAT
000630   05             DATGNC        PICTURE X(10).                    PGSTAT
000640 01               DATCE.                                          PGSTAT
000650   05             CENTUR        PICTURE XX VALUE                  PGSTAT
000660                                '19'.                             PGSTAT
000670   05             DATOR.                                          PGSTAT
000680     10           DATOA         PICTURE XX.                       PGSTAT
000690     10           DATOM         PICTURE XX.                       PGSTAT
000700     10           DATOJ         PICTURE XX.                       PGSTAT
000710 01               VARIABLES-CONDITIONNELLES.                      PGSTAT
000720   05             RTD.                                            PGSTAT
000730     10           RTD1          PICTURE X VALUE                   PGSTAT
000740                                '1'.                              PGSTAT
000750   05             NRD           PICTURE 9 VALUE 1.                PGSTAT
000760   05             NRP           PICTURE 9 VALUE ZERO.             PGSTAT
000770   05             RTP.                                            PGSTAT
000780     10           RTP1          PICTURE X VALUE                   PGSTAT
000790                                '1'.                              PGSTAT
000800   05             VE-DE.                                          PGSTAT
000810     10           VE-DE1        PICTURE X VALUE                   PGSTAT
000820                                '1'.                              PGSTAT
000830   05             VE-PE.                                          PGSTAT
000840     10           VE-PE1        PICTURE X VALUE                   PGSTAT
000850                                '1'.                              PGSTAT
000860   05             FT.                                             PGSTAT
000870     10           VE-FT         PICTURE X VALUE                   PGSTAT
000880                                '0'.                              PGSTAT
000890   05             FI.                                             PGSTAT
000900     10           VE-FI         PICTURE X VALUE                   PGSTAT
000910                                '0'.                              PGSTAT
000920 01               INDICES       COMPUTATIONAL SYNC.               PGSTAT
000930   05             J00           PICTURE S9(4) VALUE +1.           PGSTAT
000940   05             J01           PICTURE S9(4) VALUE +1.           PGSTAT
000950 01               COMPTEURS-FICHIERS COMPUTATIONAL-3.             PGSTAT
000960   05             5-VE00-CPTENR PICTURE S9(9) VALUE ZERO.         PGSTAT
000970 01               CAT-TAB.                                        PGSTAT
000980   05             FILLER        PICTURE X(100) VALUE SPACES.      PGSTAT
000990   05             FILLER        PICTURE X(100) VALUE SPACES.      PGSTAT
001000 01               CAT-TAB-R     REDEFINES CAT-TAB.                PGSTAT
001010   05             CAT           PICTURE XX OCCURS 0100.           PGSTAT
001020 01               ST-TA.                                          PGSTAT
001030   05             ST-ABS        PICTURE X VALUE SPACE.            PGSTAT
001040   05             ST-T.                                           PGSTAT
001050     07           ST-TT         OCCURS 40.                        PGSTAT
001060       10         ST-ST         PICTURE XX.                       PGSTAT
001070       10         ST-LI         PICTURE 99.                       PGSTAT
001080       10         ST-SA         PICTURE 99.                       PGSTAT
001090 01               CONTENU-DES-CATEGORIES.                         PGSTAT
001100   05             TS-1-AA.                                        PGSTAT
001110     10           ABS-1-AA      PICTURE X VALUE                   PGSTAT
001120                                '*'.                              PGSTAT
001130     10           FILLER        PICTURE X(06) VALUE               PGSTAT
001140     '000101'.                                                    PGSTAT
001150   05             TS-1-CC.                                        PGSTAT
001160     10           ABS-1-CC      PICTURE X VALUE                   PGSTAT
001170                                ' '.                              PGSTAT
001180     10           FILLER        PICTURE X(06) VALUE               PGSTAT
001190     '010201'.                                                    PGSTAT
001200   05             TS-1-EE.                                        PGSTAT
001210     10           ABS-1-EE      PICTURE X VALUE                   PGSTAT
001220                                ' '.                              PGSTAT
001230     10           FILLER        PICTURE X(18) VALUE               PGSTAT
001240     '000301020401000501'.                                        PGSTAT
001250 01               TAILLES-DES-CATEGORIES COMPUTATIONAL-3.         PGSTAT
001260   05             1-AA-NL       PICTURE S99 VALUE +00.            PGSTAT
001270   05             1-CC-NL       PICTURE S99 VALUE +01.            PGSTAT
001280   05             1-EE-NL       PICTURE S99 VALUE +03.            PGSTAT
001290 01               COMPTEURS-ET-VARIABLES-EDITION.                 PGSTAT
001300   05             COMPTEURS     COMPUTATIONAL-3.                  PGSTAT
001310     10           5-SE00-1CLM   PICTURE S999 VALUE +60.           PGSTAT
001320     10           5-SE00-1CE    PICTURE S9(9) VALUE ZERO.         PGSTAT
001330     10           5-SE00-1CL    PICTURE S999 VALUE +60.           PGSTAT
001340     10           5-SE00-1CL1   PICTURE S999 VALUE +60.           PGSTAT
001350     10           5-SE00-1CP    PICTURE S9(7) VALUE ZERO.         PGSTAT
001360   05             5-SE00-1DP    PICTURE X VALUE                   PGSTAT
001370                                '1'.                              PGSTAT
001380   05             ST-SLS.                                         PGSTAT
001390     10           STX           PICTURE XX.                       PGSTAT
001400     10           ST9           REDEFINES STX PICTURE 99.         PGSTAT
001410     10           J02           PICTURE 99.                       PGSTAT
001420     10           SAUT          PICTURE 99.                       PGSTAT
001430   05             CATX          PICTURE XX VALUE SPACE.           PGSTAT
001440 01               LIBELLES.                                       PGSTAT
001450   05             1-LIB.                                          PGSTAT
001460     10           1-LIB01.                                        PGSTAT
001470       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001480     '***************************************     '.              PGSTAT
001490       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001500     '                                            '.              PGSTAT
001510       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001520     '                                            '.              PGSTAT
001530     10           1-LIB02.                                        PGSTAT
001540       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001550     '*                      : $            *     '.              PGSTAT
001560       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001570     '                                            '.              PGSTAT
001580       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001590     '                                            '.              PGSTAT
001600     10           1-LIB03.                                        PGSTAT
001610       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001620     '***************************************     '.              PGSTAT
001630       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001640     '                                            '.              PGSTAT
001650       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001660     '                                            '.              PGSTAT
001670     10           1-LIB04.                                        PGSTAT
001680       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001690     '* TOTAL :             $               *     '.              PGSTAT
001700       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001710     '                                            '.              PGSTAT
001720       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001730     '                                            '.              PGSTAT
001740     10           1-LIB05.                                        PGSTAT
001750       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001760     '***************************************     '.              PGSTAT
001770       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001780     '                                            '.              PGSTAT
001790       15         FILLER        PICTURE X(44) VALUE               PGSTAT
001800     '                                            '.              PGSTAT
001810   05             1-LIB-R       REDEFINES 1-LIB.                  PGSTAT
001820     10           1-LI00-1      OCCURS 005.                       PGSTAT
001830       15         FILLER        PICTURE X(00132).                 PGSTAT
001840 01               6-SE00.                                         PGSTAT
001850   05             6-SE00-1.                                       PGSTAT
001860     10           6-SE100-SAUT  PICTURE X.                        PGSTAT
001870     10           6-SE100       PICTURE X(132).                   PGSTAT
001880     10           6-SE101       REDEFINES 6-SE100.                PGSTAT
001890       15         FILLER        PICTURE X(002).                   PGSTAT
001900       15         6-SE101-VILLVE PICTURE X(20).                   PGSTAT
001910       15         FILLER        PICTURE X(005).                   PGSTAT
001920       15         6-SE101-CUMVST PICTURE Z(3)BZZ9.99.             PGSTAT
001930       15         FILLER        PICTURE X(095).                   PGSTAT
001940     10           6-SE102       REDEFINES 6-SE100.                PGSTAT
001950       15         FILLER        PICTURE X(024).                   PGSTAT
001960       15         6-SE102-TOTGST PICTURE Z(2)BZ(3)BZZ9.99.        PGSTAT
001970       15         FILLER        PICTURE X(095).                   PGSTAT
001980 01               1-VE00.                                         PGSTAT
001990   10             1-VE00-VILLVE PICTURE X(20).                    PGSTAT
002000   10             1-VE00-QTEVE  PICTURE 9(2).                     PGSTAT
002010   10             1-VE00-PRIXVE PICTURE 9(3)V99.                  PGSTAT
002020   10             1-VE00-FILLER PICTURE X(3).                     PGSTAT
002030 01               ZONES-UTILISATEUR PICTURE X.                    PGSTAT
002040 PROCEDURE DIVISION.                                              PGSTAT
002110 F01.                                                             PGSTAT
002120     EXIT.                                                        PGSTAT

002150 F01SE.                                                           PGSTAT
002160     OPEN OUTPUT SE-FICHIER.                                      PGSTAT
002170 F01SE-FN.                                                        PGSTAT
002180     EXIT.                                                        PGSTAT

002210 F01VE.                                                           PGSTAT
002220     OPEN INPUT VE-FICHIER.                                       PGSTAT
002230 F01VE-10.                                                        PGSTAT
002240     READ VE-FICHIER AT END                                       PGSTAT
002250         MOVE 1 TO VE-FI.                                         PGSTAT
002260 F01VE-FN.                                                        PGSTAT
002270     EXIT.                                                        PGSTAT
002280 F01-FN.                                                          PGSTAT
002290     EXIT.                                                        PGSTAT
002300*          NOTE *  DEBUT ITERATION DU PROGRAMME     *.            PGSTAT
002310 F05.                                                             PGSTAT
002320     EXIT.                                                        PGSTAT

002390 F10.                                                             PGSTAT
002400     EXIT.                                                        PGSTAT

002430 F10VE-10.                                                        PGSTAT
002440     MOVE VE-DE TO VE-PE.                                         PGSTAT
002450     MOVE NRD TO NRP.                                             PGSTAT
002460     IF      VE-FI  =  '1'                                        PGSTAT
002470         MOVE 1 TO VE-FT                                          PGSTAT
002480         GO TO F10VE-FN.                                          PGSTAT
002490     MOVE VE00 TO 1-VE00.                                         PGSTAT
002500     ADD 1 TO 5-VE00-CPTENR.                                      PGSTAT
002510     READ VE-FICHIER AT END                                       PGSTAT
002520         MOVE 1 TO VE-FI.                                         PGSTAT
002530 F10VE-FN.                                                        PGSTAT
002540     EXIT.                                                        PGSTAT
002550 F10-FN.                                                          PGSTAT
002560     EXIT.                                                        PGSTAT

002630 F20.                                                             PGSTAT
002640     IF      FT  =  ALL '1'                                       PGSTAT
002650         NEXT SENTENCE                                            PGSTAT
002660     ELSE                                                         PGSTAT
002670         GO TO F20-FN.                                            PGSTAT
002680 F20SE.                                                           PGSTAT
002690     CLOSE SE-FICHIER.                                            PGSTAT
002700 F20SE-FN.                                                        PGSTAT
002710     EXIT.                                                        PGSTAT
002720 F20VE.                                                           PGSTAT
002730     CLOSE VE-FICHIER.                                            PGSTAT
002740 F20VE-FN.                                                        PGSTAT
002750     EXIT.                                                        PGSTAT
002760 F2099. STOP RUN.                                                 PGSTAT
002770 F2099-FN.                                                        PGSTAT
002780     EXIT.                                                        PGSTAT
002790 F20-FN.                                                          PGSTAT
002800     EXIT.                                                        PGSTAT

002870 F22.                                                             PGSTAT
002880     EXIT.                                                        PGSTAT

002910 F22VE.                                                           PGSTAT
002920     MOVE ZERO TO VE-DE.                                          PGSTAT
002930     MOVE ZERO TO NRD.                                            PGSTAT
002940     MOVE RTD TO RTP.                                             PGSTAT
002950     MOVE ZERO TO RTD.                                            PGSTAT
002960     IF      VE-FI  =  '1'  MOVE 1 TO NRD                         PGSTAT
002970         GO TO F22VE-1.                                           PGSTAT
002980     IF      VE00-VILLVE NOT  =  1-VE00-VILLVE                    PGSTAT
002990         MOVE 1 TO NRD                                            PGSTAT
003000         GO TO F22VE-1.                                           PGSTAT
003010     GO TO F22VE-FN.                                              PGSTAT
003020 F22VE-1.                                                         PGSTAT
003030     MOVE 1 TO VE-DE1.                                            PGSTAT
003040     MOVE VE-DE TO RTD.                                           PGSTAT
003050 F22VE-FN.                                                        PGSTAT
003060     EXIT.                                                        PGSTAT
003070 F22-FN.                                                          PGSTAT
003080     EXIT.                                                        PGSTAT
003090*F30.                                                             P000
003100*CUMUL                                                            P000
003110 F30BB.                                                           P000
003120*CACLCUL ET CUMUL LIGNE                                           P000
003130     MOVE 1-VE00-PRIXVE TO WS00-MTLIST                            P100
003140     COMPUTE WS00-MTLIST  =  1-VE00-PRIXVE * 1-VE00-QTEVE         P110
003150     ADD WS00-MTLIST TO WS10-CUMVST                               P130
003160     ADD WS00-MTLIST TO WS10-TOTGST                               P140
003170     DISPLAY 'VILLE=' 1-VE00-VILLVE                               P150
003180     DISPLAY 'QTE=' 1-VE00-QTEVE                                  P160
003190     DISPLAY 'PRIX=' 1-VE00-PRIXVE                                P165
003200     DISPLAY 'MT=' WS00-MTLIST                                    P170
003210     DISPLAY 'TOTAL=' WS10-TOTGST.                                P180
003220 F30BB-FN.                                                        P180
003230     EXIT.                                                        P180
003240 F30DD.                                                           P000
003250     IF      VE-DE1  =  '1'                                       P000
003260         NEXT SENTENCE                                            P000
003270     ELSE                                                         P000
003280         GO TO F30DD-FN.                                          P000
003290*TRANSFERT CUMUL VILLE                                            P000
003300     MOVE WS10-CUMVST TO ED10-CUMVST                              P100
003310     DISPLAY '-RUPTURE-' 1-VE00-VILLVE                            P110
003320     DISPLAY 'CUMUL' WS10-CUMVST                                  P120
003330     DISPLAY 'ED' ED10-CUMVST.                                    P130
003340 F30DD-FN.                                                        P130
003350     EXIT.                                                        P130
003360 F30FF.                                                           P000
003370     IF      VE-DE1  =  '1'                                       P000
003380         NEXT SENTENCE                                            P000
003390     ELSE                                                         P000
003400         GO TO F30FF-FN.                                          P000
003410*REINIT CUMUL VILLE                                               P000
003420     MOVE ZERO TO WS10-CUMVST.                                    P100
003430 F30FF-FN.                                                        P100
003440     EXIT.                                                        P100
003450 F30GG.                                                           P000
003460     IF      VE-FI  =  '1'                                        P000
003470         NEXT SENTENCE                                            P000
003480     ELSE                                                         P000
003490         GO TO F30GG-FN.                                          P000
003500*TRANSFERT TOTAL                                                  P000
003510     MOVE WS10-TOTGST TO ED10-TOTGST.                             P100
003520 F30GG-FN.                                                        P100
003530     EXIT.                                                        P100
003540 F30-FN.                                                          P100
003550     EXIT.                                                        P100

003620 F81.                                                             PGSTAT
003630     EXIT.                                                        PGSTAT

003660 F81AA.                                                           PGSTAT
003670     IF      5-SE00-1CL NOT  <  5-SE00-1CLM                       PGSTAT
003680         MOVE 01 TO 5-SE00-1CL                                    PGSTAT
003690         ADD 1-AA-NL TO 5-SE00-1CL                                PGSTAT
003700         MOVE 'AA' TO CAT (J00) ADD 1 TO J00.                     PGSTAT
003710 F81AA-FN.                                                        PGSTAT
003720     EXIT.                                                        PGSTAT
003750 F81CC.                                                           PGSTAT
003760     IF      VE-DE1  =  '1'                                       PGSTAT
003770         ADD 1-CC-NL TO 5-SE00-1CL                                PGSTAT
003780         MOVE 'CC' TO CAT (J00) ADD 1 TO J00.                     PGSTAT
003790 F81CC-FN.                                                        PGSTAT
003800     EXIT.                                                        PGSTAT

003830 F81EE.                                                           PGSTAT
003840     IF      VE-FI  =  '1'                                        PGSTAT
003850         ADD 1-EE-NL TO 5-SE00-1CL                                PGSTAT
003860         MOVE 'EE' TO CAT (J00) ADD 1 TO J00.                     PGSTAT
003870 F81EE-FN.                                                        PGSTAT
003880     EXIT.                                                        PGSTAT
003890 F81ZZ.                                                           PGSTAT
003900     MOVE 1 TO J00.                                               PGSTAT
003910 F81ZZ-005.                                                       PGSTAT
003920     MOVE CAT (J00) TO CATX.                                      PGSTAT
003930     IF      CATX  =  '  '                                        PGSTAT
003940         MOVE 1 TO J00                                            PGSTAT
003950         MOVE SPACE TO CAT-TAB                                    PGSTAT
003960         GO TO F8199-FN.                                          PGSTAT
003970     MOVE 0 TO J01.                                               PGSTAT
003980     IF      CATX  =  'AA'                                        PGSTAT
003990         MOVE TS-1-AA TO ST-TA                                    PGSTAT
004000         GO TO F81ZZ-009.                                         PGSTAT
004010     IF      CATX  =  'CC'                                        PGSTAT
004020         MOVE TS-1-CC TO ST-TA                                    PGSTAT
004030         GO TO F81ZZ-009.                                         PGSTAT
004040     IF      CATX  =  'EE'                                        PGSTAT
004050         MOVE TS-1-EE TO ST-TA                                    PGSTAT
004060         GO TO F81ZZ-009.                                         PGSTAT
004070 F81ZZ-009.                                                       PGSTAT
004080     ADD 1 TO J01.                                                PGSTAT
004090 F81ZZ-010.                                                       PGSTAT
004100     MOVE ST-TT (J01) TO ST-SLS.                                  PGSTAT
004110     IF      ST-SLS  =  SPACE                                     PGSTAT
004120         ADD 1 TO J00                                             PGSTAT
004130         GO TO F81ZZ-005.                                         PGSTAT
004140     IF      J02  =                                               PGSTAT
004150     '00' MOVE SPACE TO 6-SE100 ELSE                              PGSTAT
004160         MOVE 1-LI00-1 (J02) TO 6-SE100.                          PGSTAT
004170     IF      ST-ABS NOT  =                                        PGSTAT
004180     ' ' AND SAUT = '01'                                          PGSTAT
004190         ADD 1 TO 5-SE00-1CP.                                     PGSTAT
004200 F81ZZ-FN.                                                        PGSTAT
004210     EXIT.                                                        PGSTAT
004240 F8100.                                                           PGSTAT
004250     IF      STX  =                                               PGSTAT
004260     '00'          GO TO F8199.                                   PGSTAT
004270     GO TO F8101 F8102 DEPENDING ON ST9.                          PGSTAT
004280 F8100-FN.                                                        PGSTAT
004290     EXIT.                                                        PGSTAT

004320 F8101.                                                           PGSTAT
004330     MOVE 1-VE00-VILLVE TO 6-SE101-VILLVE.                        PGSTAT
004340     MOVE ED10-CUMVST TO 6-SE101-CUMVST.                          PGSTAT
004350 F8101-99.                                                        PGSTAT
004360     GO TO F8199.                                                 PGSTAT
004370 F8101-FN.                                                        PGSTAT
004380     EXIT.                                                        PGSTAT
004410 F8102.                                                           PGSTAT
004420     MOVE ED10-TOTGST TO 6-SE102-TOTGST.                          PGSTAT
004430 F8102-99.                                                        PGSTAT
004440     GO TO F8199.                                                 PGSTAT
004450 F8102-FN.                                                        PGSTAT
004460     EXIT.                                                        PGSTAT
004490 F8199.                                                           PGSTAT
004500     MOVE 6-SE00 TO SE00.                                         PGSTAT
004510     IF      ST-ABS  =                                            PGSTAT
004520     ' '        GO TO F8199-10.                                   PGSTAT
004530     MOVE ' ' TO ST-ABS.                                          PGSTAT
004540     IF      SAUT  =                                              PGSTAT
004550     '01' MOVE 1    TO 5-SE00-1CL1                                PGSTAT
004560         WRITE SE00 AFTER ADVANCING SAUTP                         PGSTAT
004570             GO TO F8199-20.                                      PGSTAT
004580     SUBTRACT 5-SE00-1CL1 FROM SAUT.                              PGSTAT
004590 F8199-10.                                                        PGSTAT
004600     IF      SAUT  =                                              PGSTAT
004610     '00'                                                         PGSTAT
004620         WRITE SE00 AFTER ADVANCING SAUT0                         PGSTAT
004630     ELSE                                                         PGSTAT
004640             WRITE SE00 AFTER ADVANCING SAUT                      PGSTAT
004650             ADD SAUT TO 5-SE00-1CL1.                             PGSTAT
004660 F8199-20.                                                        PGSTAT
004670     ADD 1 TO 5-SE00-1CE.                                         PGSTAT
004680     GO TO F81ZZ-009.                                             PGSTAT
004690 F8199-FN.                                                        PGSTAT
004700     EXIT.                                                        PGSTAT
004710 F81-FN.                                                          PGSTAT
004720     EXIT.                                                        PGSTAT
004730 F9099-ITER-FN.                                                   PGSTAT
004740     GO TO F05.                                                   PGSTAT
