pair A = dir(60);
pair B = dir(100);
pair C = dir(190);
pair D = dir(250);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$D$", D, D);

draw(A--B--C--D--cycle);

/*
  Source: Cyclic Quad
  Points: A B C D
  Item: A B C D
*/
