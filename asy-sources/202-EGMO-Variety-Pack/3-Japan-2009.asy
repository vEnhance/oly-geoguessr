size(10cm);

pair Q = dir(240);
pair R = origin;
pair O = Q+dir(Q--R)*0.6;
pair P = O+dir(90)*0.6;
pair B = intersectionpoint(unitcircle,P--P+dir(180)*10);
pair C = intersectionpoint(unitcircle,P--P+dir(0)*10);
pair N = dir(90);
pair M = dir(270);
pair A = intersectionpoint(unitcircle,O--O+dir(M--O)*10);

dot("$A$", A, dir(135));
dot("$B$", B, dir(170));
dot("$C$", C, dir(10));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(240));
dot("$O$", O, dir(210));
dot("$M$", M, dir(270));
dot("$N$", N, dir(90));
dot("$R$", R, dir(0));

draw(unitcircle);
draw(circle(O,abs(O-P)));
draw(A--B--C--A);
draw(A--M);

/*
Source: Japanese Olympiad 2009
Points: A B C M N O P Q R
Item: Q P N
Item: Q O R
Item: M R N
Item: A P O Q
Text: $O$, $R$ are centers of circles.
Text: $M$, $N$ are arc midpoints.
*/
