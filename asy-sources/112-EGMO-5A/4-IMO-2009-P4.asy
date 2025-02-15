pair A = dir(90);
pair B = dir(210);
pair C = dir(-30);
pair D = foot(A, B, C);
pair I = incenter(A, B, C);
pair E = extension(B, I, A, C);
pair K = incenter(A, C, D);

draw(A--D, lightred);
draw(B--E, lightred);
draw(E--K);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

markangle(n=2, radius=10, I, E, K, deepgreen);

dot("$A$", A, dir(90));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(-90));
dot("$I$", I, dir(145));
dot("$E$", E, dir(30));
dot("$K$", K, dir(-30));
label("$45^\circ$", E, dir(238)*4.5, deepgreen);

/*
    Source: IMO 2009 P4 (5.14)
    Points: A B C D E I K
    Item: C I K
    Item: C D E I
    Item: A B D E K

    Text: $I$ is the incenter of $\triangle ABC$, $K$ is the incenter of $\triangle ADC$ and $\angle IEK=45^\circ$.
    Text: Suppose $\triangle ABC$ isn't right triangle.
*/
