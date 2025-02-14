pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
pair M = (B+C)/2;
pair X = extension(E, F, D, I);

draw(A--B--C--cycle, blue);
draw(incircle(A, B, C), dotted+deepcyan);
draw(D--E--F--cycle, deepcyan);
draw(D--X);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$M$", M, dir(-90));
dot("$X$", X, dir(90));

/*
    Source: An Incircle Concurrency (4.17)
    Points: A B C D E F I M X
    Item: A X M
    Item: A E F I
    Item: B D I F
    Item: C D I E

    Text: $I$ is the incenter and $\triangle DEF$ is the contact triangle.
    Text: $M$ is the midpoint of $BC$.
*/
