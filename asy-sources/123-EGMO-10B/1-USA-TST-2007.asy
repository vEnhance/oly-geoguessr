pair A = dir(-30);
pair P = dir(210);
pair D = .7*dir(140);
pair X = dir(75);
pair B = extension(A, P, D, X);
pair C = extension(A, X, D, P);
circle c_1 = circle(A, P, C);
circle c_2 = circle(B, P, D);
pair Q = intersectionpoints(c_1, c_2)[1];
line p_line1 = parallel(P, line(B, D));
line p_line2 = parallel(P, line(A, C));
pair Y = intersectionpoints(c_1, p_line1)[1];
pair Z = intersectionpoints(c_2, p_line2)[1];

filldraw(c_1, opacity(0.1)+lightgreen, deepgreen);
filldraw(c_2, opacity(0.1)+lightgreen, deepgreen);
draw(B--X, orange);
draw(A--C, mediumblue);
draw(P--Y, orange);
draw(P--Z, mediumblue);
draw(A--B);
draw(C--P);

dot("$A$", A, dir(-30));
dot("$B$", B, dir(210));
dot("$C$", C, dir(90));
dot("$D$", D, dir(160));
dot("$P$", P, dir(-100));
dot("$Q$", Q, dir(110));
dot("$X$", X, dir(10));
dot("$Y$", Y, dir(0));
dot("$Z$", Z, dir(130));

/*
    Source: USA TST 2007 P1 (10.20)
    Points: A B C D P Q X Y Z
    Item: Q X Y Z
    Item: C D Q X
    Item: A B Q X

    Text: Complete quadrilateral $APDX$ and $Q=(BPD)\cap (APC)$.
    Text: $BX\parallel PY$, $AC\parallel PZ$.
*/
