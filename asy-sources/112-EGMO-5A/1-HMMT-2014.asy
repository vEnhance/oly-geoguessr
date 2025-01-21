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

draw(A--D);
draw(u_c, blue);
draw(A--B--C--cycle);
draw(A--E, lightblue);
draw(X--Y, lightblue);
draw(B--T--C, deepgreen);

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

    Text: $AB=4$, $AC=5$, $BC=6$
    Text: $TB$ and $TC$ are tangents
*/
