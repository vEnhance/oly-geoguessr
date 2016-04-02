pair A = dir(60);
pair B = dir(100);
pair C = dir(190);
pair D = dir(250);
pair E = dir(310);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$D$", D, D);
dot("$E$", E, E);

draw(A--B--C--D--E--cycle);

/*
  Source: Cyclic Pentagon
  Points: A B C D E
  Item: A B C D E
  Text: This diagram contains a cyclic pentagon.
  Text: You need to select all five points at once, not just any four.
*/
