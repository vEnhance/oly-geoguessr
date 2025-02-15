pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);

draw(circumcircle(D, E, F), lightblue);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

dot("$A$", A, dir(100));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(160));

label("$s-a$", (A+F)/2, dir(180));
label("$s-a$", (A+E)/2, dir(0));
label("$s-b$", (B+F)/2, dir(180));
label("$s-b$", (B+D)/2, dir(-90));
label("$s-c$", (C+D)/2, dir(-90));
label("$s-c$", (C+E)/2, dir(0));

/*
    Source: Area Formulas (5.3)
    Points: A B C D E F I
    Item: A E F I
    Item: B D F I
    Item: C D E I

    Text: $I$ is the incenter and $\triangle DEF$ is the contact triangle of $\triangle ABC$.
*/
