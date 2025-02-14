pair A = dir(110);
pair B = dir(200);
pair C = dir(-20);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = dir(-90);
pair E = foot(I, B, D);
pair F = foot(I, C, D);

draw(A--D, grey);
draw(B--D--C, lightblue);
draw(E--I--F, deepcyan);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

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
    
    Text: $I$ is the incenter of $\triangle ABC$, $DB=DC$ and $D$ lies on $AI$.
    Text: $E$, $F$ are the feet of $I$ on $DB$, $DC$.
*/
