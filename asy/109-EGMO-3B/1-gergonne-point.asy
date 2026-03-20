pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
pair G = extension(B, E, C, F);

draw(B--E);
draw(C--F);
draw(circle(D, E, F), dotted);
filldraw(triangle(A, B, C), opacity(0.2)+paleblue, black+1.1);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$G$", G, dir(-90));

/*
    Source: 3.16
    Points: A B C D E F G
    Item: A D G

    Text: $\triangle DEF$ is the contact triangle of $\triangle ABC$.
    Text: $G$ is the intersection of $BE$ and $CF$.
*/
