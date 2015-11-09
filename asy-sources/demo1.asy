size(500);

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
  Tuple: A B C D E
*/
