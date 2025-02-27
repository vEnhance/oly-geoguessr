pair O = (0, 0);
circle c_1 = circle((point)O, 1);
pair B = dir(90);
line tangent1 = tangent(c_1, B);
pair A = B+2.2dir(180);
pair C = 2*B-A;
pair D = (A+B)/2;
pair E = intersectionpoints(c_1, circle(D, C))[1];
pair F = intersectionpoints(c_1, circle(D, C))[0];
circle c_2 = circle((point)O, abs(O-A));
pair M = (C+D)/2;

filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
draw(C--A--F, grey);
draw(D--E, grey);
draw(C--F, grey);
draw(M--(D+E)/2, dotted);
draw(M--(C+F)/2, dotted);

dot("$A$", A, dir(180));
dot("$B$", B, dir(90));
dot("$C$", C, dir(0));
dot("$D$", D, dir(90));
dot("$E$", E, dir(215));
dot("$F$", F, dir(-30));
dot("$M$", M, dir(90));
dot("$O$", O, dir(0));

/*
    Source: USAMO 1998/2 (2.32)
    Points: A B C D E F M O
    Item: C D E F
    
    Text: Two circles are concentric at $O$.
    Text: $AC$ is tangent at $B$ to the smaller circle.
    Text: $D$ is the midpoint of $AB$.
    Text: perpendicular bisectors of $DE$ and $CF$ intersect at $M$ on $AC$.
*/
