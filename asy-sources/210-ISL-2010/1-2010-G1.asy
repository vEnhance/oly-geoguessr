pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair H = A+B+C;
pair D = foot(A, B, C);
pair E = foot(B, C, A);
pair F = foot(C, A, B);
pair P = intersectionpoints(u_c, line(E, F))[0];
pair Q = extension(B, P, D, F);

draw(u_c, blue);
draw(A--B--C--cycle);
draw(A--D);
draw(B--E);
draw(C--F);
draw(P--E);
draw(B--Q);
draw(D--Q);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$H$", H, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(165));
dot("$P$", P, dir(180));
dot("$Q$", Q, dir(110));

/*
    Source: ISL 2010 G1
    Points: A B C D E F H P Q
    Item: A P Q F
    Item: A E H F
    Item: B D H F
    Item: C D H E
    Item: A E D B
    Item: B F E C
    Item: C D F A
*/
