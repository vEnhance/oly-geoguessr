pair A = dir(115);
pair B = dir(210);
pair C = dir(-30);
pair D = (-.3, .15);
pair S = .45A+.55B;
pair T = intersectionpoints(circle(B, C, S), line(A, C))[1];
pair E = intersectionpoints(circle(B, S, D), line(B, C))[1];
pair F = intersectionpoints(circle(C, T, D), line(B, C))[0];
circle c_1 = circle(B, S, D);
circle c_2 = circle(C, T, D);
pair K = intersectionpoints(c_1, c_2)[0];
pair X = extension(A, B, D, F);
pair Y = extension(A, C, D, E);

draw(A--X);
draw(A--Y);
draw(A--K, grey);
draw(c_1, lightblue);
draw(c_2, lightblue);
draw(F--X, deepgreen);
draw(E--Y, deepgreen);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);

dot("$A$", A, dir(190));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(30));
dot("$S$", S, dir(150));
dot("$T$", T, dir(80));
dot("$E$", E, dir(-60));
dot("$F$", F, dir(-130));
dot("$K$", K, dir(-100));
dot("$X$", X, dir(90));
dot("$Y$", Y, dir(90));

/*
    Source: USA TST 2014 P4 (7.50)
    Points: A B C D E F K S T X Y
    Item: B C S T
    Item: D S T X Y

    Text: $S=AB\cap (BDE)$, $T=AC\cap (CDF)$
*/
