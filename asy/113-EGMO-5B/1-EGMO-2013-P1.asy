pair B = dir(180);
pair C = dir(0);
pair A = dir(60);
pair E = 3*A-2*C;
pair M = (B+E)/2;
pair D = extension(A, M, B, C);

draw(A--E, grey);
draw(E--B, grey);
draw(C--D, grey);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

dot("$A$", A, dir(50));
dot("$B$", B, dir(230));
dot("$C$", C, dir(-60));
dot("$D$", D, dir(0));
dot("$E$", E, dir(90));
dot("$M$", M, dir(180));

/*
    Source: EGMO 2013 P1 (5.19)
    Points: A B C D E M
    Item: A D M

    Text: $CD=BC$, $AE=2CA$, $AD=BE$, $MB=ME$.
*/
