pair A = dir(110);
pair B = dir(210);
pair C = dir(330);
dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
draw(A--B--C--cycle);

pair D = 0.4*B + 0.6*C;
pair E = 0.5*C + 0.5*A;
pair F = 0.6*A + 0.4*B;
dot("$D$", D, dir(B+C));
dot("$E$", E, dir(C+A)*1.8);
dot("$F$", F, dir(A+B));
draw(circumcircle(B,F,D));
draw(circumcircle(C,D,E));

pair K = IP(circumcircle(B,F,D), circumcircle(C,D,E));
dot("$K$", K, dir(90));


/*
  Source: Miquel Points
  Points: A B C D E F K
  Item: A E F K
  Text: Points $D$, $E$, $F$ are arbitrary.
*/
