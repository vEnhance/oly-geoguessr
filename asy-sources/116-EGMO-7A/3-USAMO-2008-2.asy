pair A = dir(115);
pair B = dir(210);
pair C = dir(-30);
pair O = (0, 0);
circle u_c = circle(A, B, C);
pair M = (B+C)/2;
pair N = (C+A)/2;
pair P = (A+B)/2;
pair D = extension(A, M, P, O);
pair E = extension(A, M, N, O);
pair F = extension(B, D, C, E);

draw(A--M);
draw(D--P);
draw(E--N);
draw(C--F);
draw(B--D);
draw(u_c, blue);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$M$", M, dir(-90));
dot("$N$", N, dir(30));
dot("$P$", P, dir(180));
dot("$D$", D, dir(0));
dot("$E$", E, dir(-130));
dot("$F$", F, dir(160));

/*
    Source: USAMO 2008 P2 (7.29)
    Points: A B C D E F M N P
    Item: A E N P
*/
