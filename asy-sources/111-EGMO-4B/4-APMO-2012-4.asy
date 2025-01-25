pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair D = foot(A, B, C);
pair M = (B+C)/2;
pair H = A+B+C;
pair E = intersectionpoints(u_c, line(M, H))[1];
pair F = intersectionpoints(u_c, line(D, E))[0];
pair X = foot(B, C, A);
pair Y = foot(C, A, B);
pair K = extension(X, Y, B, C);
pair A_p = -A;
pair O = (A+A_p)/2;

draw(u_c, blue);
draw(B--K--X);
draw(E--F);
draw(A--D, lightblue);
draw(B--X, lightblue);
draw(C--Y, lightblue);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(240));
dot("$C$", C, dir(-60));
dot("$D$", D, dir(-120));
dot("$M$", M, dir(-90));
dot("$H$", H, dir(0));
dot("$E$", E, dir(180));
dot("$F$", F, dir(-90));
dot("$X$", X, dir(30));
dot("$Y$", Y, dir(170));
dot("$K$", K, dir(180));
dot("$A'$", A_p, dir(-70));
dot("$O$", O, dir(0));

/*
    Source: APMO 2012/4 (4.52)
    Points: A B C D E F X Y H M K A_p O
    Item: A H E X Y
    Item: B H D Y
    Item: C H D X
    Item: B C X Y
    Item: C A D Y
    Item: A B D X
    Item: D H E K
    Item: E H M A_p
    Item: A E D M
    Item: A O A_p
    Item: A E K

    Text: $X$, $Y$ are the feet as usual.
    Text: $A'$ is the antipode of $A$
    Text: $K=BC\cap XY$
*/
