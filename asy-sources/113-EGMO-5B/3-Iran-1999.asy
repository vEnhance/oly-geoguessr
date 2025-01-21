pair A = dir(110);
pair B = dir(200);
pair C = dir(-20);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = dir(-90);
pair E = foot(I, B, D);
pair F = foot(I, C, D);

draw(A--D);
draw(A--B--C--cycle);
draw(B--D--C, deepgreen);
draw(E--I--F, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(230));
dot("$F$", F, dir(-50));

/*
    Source: Iran Olympiad 1999 (5.22)
    Points: A B C D E F I
    Item: A B C D
    Item: D E F I

    Text: $DB=DC$ and $D$ lies on $AI$
*/
