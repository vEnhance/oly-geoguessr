size(500);
dotfactor *= 2;
defaultpen(fontsize(18pt));

draw(unitcircle);
pair A = dir(70);
pair C = -A;
pair B = conj(C);
pair O = (0,0);
draw(A--B--C);

real r = 0.05;
pair X = B+r*dir(0);
pair Y = B+r*dir(270);
draw(X--(X+Y-B)--Y);

dot("$A$", A, A);
dot("$B$", B, B);
dot("$C$", C, C);
dot("$O$", O, dir(-B));

/*
  Source: Thale's Theorem
  Points: A O B C
  Item: A O C
*/
