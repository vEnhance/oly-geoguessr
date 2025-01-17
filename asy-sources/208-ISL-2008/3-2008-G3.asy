pair A = dir(118);
pair E = dir(-65);
pair F = dir(12);
pair P = dir(-115);
pair B = (-.75, -1.75);
pair X = extension(A, F, P, E);
circle c_1 = circle(B, P, E);
pair G = intersectionpoints(c_1, line(B, X))[1];
line p_line1 = parallel(E, line(P, G));
line p_line2 = parallel(E, line(P, F));
pair C = intersectionpoint(line(B, G), p_line1);
pair D = intersectionpoint(line(A, F), p_line2);
circle c_2 = circle(A, P, D);
circle c_3 = circle(B, P, C);
pair Q = intersectionpoints(c_2, c_3)[1];

draw(c_2, deepcyan);
draw(c_3, deepcyan);
draw(A--X--B);
draw(E--F, lightblue);
draw(Q--D, lightblue);
draw(E--G, orange);
draw(Q--C, orange);
draw(D--E--A--P--B--E--C);

dot("$A$", A, dir(140));
dot("$E$", E, dir(170));
dot("$F$", F, dir(70));
dot("$P$", P, dir(190));
dot("$B$", B, dir(180));
dot("$X$", X, dir(0));
dot("$G$", G, dir(-90));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(60));
dot("$Q$", Q, dir(0));

/*
    Source: ISL 2008 G3
    Points: A B C D P Q E F G X
    Item: P Q E X
    Item: A P E F
    Item: P B G E

    Text: $F\in AD$ such that $EF\parallel QD$
    Text: $G\in BC$ such that $EG\parallel QC$
*/
