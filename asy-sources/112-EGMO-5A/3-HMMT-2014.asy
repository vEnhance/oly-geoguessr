pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair D = foot(A, B, C);
pair E = extension(A, O, B, C);
pair T = 2*B*C/(B+C);
pair X = extension(A, T, B, C);
pair Y = extension(A, D, O, foot(O, A, T));

draw(A--D, grey);
draw(u_c, lightmagenta);
draw(A--E, deepgreen);
draw(X--Y, deepgreen);
draw(B--T--C, lightblue);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(-90));
dot("$O$", O, dir(10));
dot("$T$", T, dir(-90));
dot("$X$", X, dir(-90));
dot("$Y$", Y, dir(0));

/*
    Source: Harvard-MIT Math Tournament 2014 (5.13)
    Points: A B C D E O T X Y
    Item: A T X
    Item: B O T C

    Text: $AD\perp BC$, $YO\perp AX$, $AO\parallel XY$.
    Text: $AB=4$, $AC=5$, $BC=6$.
    Text: $TB$ and $TC$ are tangents.
*/
