pair C = (14,0);
pair A = (9,12);
pair B = (0,0);
pair D = foot(A,B,C);
pair E = foot(B,A,C);
pair F = foot(C,A,B);
pair H = orthocenter(A,B,C);
pair om = extension(E,F,C,B);
pair nom = extension(E,F,D,(5,3));
path circ = circumcircle(A,B,C);

pair P1 = intersectionpoint(F--om, circ);
pair P2 = intersectionpoint(E--nom, circ);
pair Q1 = intersectionpoint(D--F, B--P1);
pair Q2 = extension(B,P2,D,F);
pair Ep = reflect(A,B)*E;
pair Cp = reflect(A,B)*C;
pair Hp = reflect(A,B)*H;
pair Dp = reflect(A,B)*D;
draw(A--B--C--A--D--F--C);
draw(B--E);
draw(P1--P2);
draw(F--Q2);
draw(P1--B--Q2, dotted);
dot(A^^B^^C^^D^^E^^F^^Q1^^Q2^^P1^^P2);
draw(circ);
markscalefactor=0.05;
draw(rightanglemark(C,F,A));
draw(rightanglemark(B,E,C));
draw(rightanglemark(A,D,B));
label("$A$", A, dir(90));
label("$B$", B, dir(225));
label("$C$", C, dir(315));
label("$D$", D, dir(-90));
label("$E$", E, dir(45));
label("$F$", F, 1.2*dir(200));
label("$P_1$", P1, dir(0));
label("$P_2$", P2, dir(135));
label("$Q_1$", Q1, dir(250));
label("$Q_2$", Q2, dir(90));		


/*
  Source: Shortlist 2010 G1
  Points: A B C D E F P1 P2 Q1 Q2
  Item: B F E C
  Item: A C D F
  Item: A E B D
  Item: P1 Q1 A F
  Item: P2 Q2 A F
  Item: P1 Q1 C D
  Item: P2 Q2 C D
  Item: P1 Q1 P2 Q2
  Text: IMO Shortlist 2010, Problem G1
*/
