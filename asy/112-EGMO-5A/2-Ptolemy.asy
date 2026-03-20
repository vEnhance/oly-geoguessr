pair A = dir(140);
pair B = dir(200);
pair C = dir(-20);
pair D = dir(80);

draw(A--C);
draw(B--D);
filldraw(A--B--C--D--cycle, opacity(0.2)+pink, black);

dot("$A$", A, dir(130));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(80));

/*
    Source: Ptolemy's Theorem (5.9)
    Points: A B C D
    Item: A B C D

    Text: Given $AB\cdot CD+AD\cdot BC=AC\cdot BD$.
*/
