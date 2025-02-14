pair A = dir(130);
pair B = dir(90);
pair X = dir(180);
pair Y = dir(0);
pair P = extension(A, Y, B, X);
pair Z = foot(P, X, Y);
pair C_p = foot(X, A, Z);
pair C = intersectionpoints(circle(A, B, X), line(X, C_p))[1];
pair Q = extension(C, X, A, Y);

draw(A--Y, grey);
draw(C--X, grey);
draw(B--X, grey);
draw(P--Z, grey);
draw(A--Z, dotted);
draw(circle(A, B, X), lightmagenta);
filldraw(X--A--B--C--Y--cycle, opacity(0.2)+pink, black);

dot("$A$", A, dir(120));
dot("$B$", B, dir(90));
dot("$X$", X, dir(180));
dot("$Y$", Y, dir(0));
dot("$P$", P, dir(90)*1.2);
dot("$Z$", Z, dir(-90));
dot("$C$", C, dir(20));
dot("$Q$", Q, dir(-90)*1.2);

/*
    Source: JMO 2023 P5 (5.25)
    Points: A B C P Q X Y Z
    Item: A P X Z

    Text: Quadrilateral $XABCY$ is inscribed in a circle with diameter $XY$.
    Text: $Z$ is the foot of $P$ on $XY$ and $XC\perp AZ$.
*/
