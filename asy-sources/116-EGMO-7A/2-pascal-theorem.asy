pair A = dir(130);
pair B = dir(-110);
pair C = dir(30);
pair D = dir(180);
pair E = dir(90);
pair F = dir(-40);
pair X = extension(A, B, D, E);
pair Y = extension(B, C, E, F);
pair Z = extension(C, D, F, A);

filldraw(circle(A, B, C), opacity(0.2)+paleyellow, blue);
draw(A--B--C--D--E--F--cycle);

dot("$A$", A, dir(120));
dot("$B$", B, dir(-90));
dot("$C$", C, dir(30));
dot("$D$", D, dir(180));
dot("$E$", E, dir(90));
dot("$F$", F, dir(-60));
dot("$X$", X, dir(160));
dot("$Y$", Y, dir(-10));
dot("$Z$", Z, dir(70));

/*
    Source: Pascal's Theorem (7.27)
    Points: A B C D E F X Y Z
    Item: X Y Z
*/
