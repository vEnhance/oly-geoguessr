pair A = dir(60);
pair B = dir(100);
pair C = dir(190);
pair D = dir(250);

pair E = (2,1);
pair F = (2,0.5);
pair G = (2,0);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$D$", D, D);

dot("$E$", E, dir(0));
dot("$F$", F, dir(0));
dot("$G$", G, dir(0));

draw(A--B--C--D--cycle);

/*
  Source: Two Items
  Points: A B C D E F G
  Item: A B C D
  Item: E F G
  Text: This diagram has two items.
  Text: Make sure you have both of them before pressing "Finish"!
*/
