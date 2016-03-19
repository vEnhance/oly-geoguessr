size(500);
dotfactor *= 2;
defaultpen(fontsize(18pt));

pair A = dir(60);
pair B = dir(100);
pair C = dir(190);
pair D = dir(250);

pair E = (3,1);
pair F = (3,0);
pair G = (3,-1);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$D$", D, D);

dot("$E$", E, dir(0));
dot("$F$", F, dir(0));
dot("$G$", G, dir(0));

draw(A--B--C--D--cycle);

/*
  Source: Cyclic Quad and a Line
  Points: A B C D E F G
  Item: A B C D
  Item: E F G
*/
