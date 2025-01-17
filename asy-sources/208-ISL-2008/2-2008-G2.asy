pair A = dir(125);
pair B = dir(55);
pair E = dir(-30);
pair F = dir(160);
pair J = extension(A, B, E, F);
pair P = extension(A, F, B, E);
pair Q = extension(A, E, B, F);
pair I = extension(P, Q, E, F);
pair K = (E+F)/2;
line p_line = parallel(I, line(A, B));
pair C = intersectionpoint(line(B, E), p_line);
pair D = intersectionpoint(line(A, F), p_line);

draw(A--J--E--C);
draw(A--B--C--D--cycle, lightblue);
draw(circumcircle(A, B, I), deepcyan);

dot("$A$", A, dir(110));
dot("$B$", B, dir(30));
dot("$C$", C, dir(0));
dot("$D$", D, dir(180));
dot("$E$", E, dir(-30));
dot("$F$", F, dir(90));
dot("$I$", I, dir(-120));
dot("$J$", J, dir(180));
dot("$K$", K, dir(-110));

/*
    Source: ISL 2008 G2
    Points: A B C D E F I J K
    Item: A B E F
    Item: C D E F
    Item: C D J K

    Text: Given that $A$, $B$, $I$, $K$ is cyclic
*/
