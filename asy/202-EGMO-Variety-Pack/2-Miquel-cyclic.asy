pair A = dir(85);
pair B = dir(200);
pair C = dir(340);
pair D = dir(40);
pair P = extension(A,D,B,C);
pair Q = extension(A,B,C,D);
pair R = extension(A,C,B,D);
pair O = (0,0);
pair M = extension(R,O,P,Q);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(315));
dot("$D$", D, dir(45));
dot("$P$", P, dir(0));
dot("$Q$", Q, dir(90));
dot("$R$", R, dir(260));
dot("$M$", M, dir(45));
dot("$O$", O, dir(270));

draw(unitcircle);
draw(A--B--C--D--A);
draw(A--C);
draw(B--D);
draw(A--Q--D);
draw(C--P--D);

/*
Source: Miquel point of a cyclic quadrilateral
Points: A B C D P Q R M O
Item: O R M
Item: P M Q
Item: A D Q M
Item: B C Q M
Item: C D P M
Item: A B P M
Item: O A C M
Item: O B D M
Text: $M$ is the Miquel point of cyclic quadrilateral $ABCD$.
*/
