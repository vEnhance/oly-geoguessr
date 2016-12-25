pair A = dir(45);
pair B = dir(135);
pair C = dir(225);
pair D = dir(315);
pair O = origin;

filldraw(A--B--C--D--cycle, opacity(0.1)+lightblue, blue);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$D$", D, D);
dot("$O$", O, dir(90));

/*
  Source: Square with Center
  Points: A B C D O
  Item: A O C
  Item: B O D
  Item: A B C D
  Text: Point $O$ is the center of a square $ABCD$.
*/
