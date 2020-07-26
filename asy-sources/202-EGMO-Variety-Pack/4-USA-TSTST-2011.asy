size(10cm);

pair A = dir(120);
pair B = dir(210);
pair C = dir(330);
pair H = orthocenter(A,B,C);
pair M = (A+B)/2;
pair N = (A+C)/2;
pair X = 2M-H;
pair Y = 2N-H;
pair O = origin;
pair P = M+dir(X--M)*abs(A-M)*abs(B-M)/abs(X-M);
pair Q = N+dir(Y--N)*abs(A-N)*abs(C-N)/abs(Y-N);

dot("$A$", A, dir(120));
dot("$B$", B, dir(210));
dot("$C$", C, dir(330));
dot("$H$", H, dir(255));
dot("$M$", M, dir(180));
dot("$N$", N, dir(80));
dot("$O$", O, dir(270));
dot("$X$", X, dir(135));
dot("$Y$", Y, dir(30));
dot("$P$", P, dir(270));
dot("$Q$", Q, dir(200));

draw(A--B--C--A);
draw(unitcircle);
draw(X--P);
draw(Y--Q);

/*
Source: USA TSTST 2011/4
Points: A B C H M N O X Y P Q
Item: B O Y
Item: C O X
Item: A M O N
Item: M N P Q
Text: $M$, $N$ are midpoints.
*/
