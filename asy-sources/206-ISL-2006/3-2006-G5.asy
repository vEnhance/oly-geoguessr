pair J = (0, 0);
pair A_1 = dir(90);
pair Y = dir(55);
pair C_1 = dir(156);
circle excircle_a = circle(A_1, Y, C_1);
line tangent1 = tangent(excircle_a, A_1);
line tangent2 = tangent(excircle_a, C_1);
pair B = intersectionpoint(tangent1, tangent2);
pair D = foot(A_1, B, C_1);
pair B_1 = intersectionpoints(excircle_a, line(D, A_1))[0];
line tangent3 = tangent(excircle_a, B_1);
pair C = intersectionpoint(tangent1, tangent3);
pair A = intersectionpoint(tangent2, tangent3);
pair E = foot(C_1, D, J);

draw(B--C);
draw(D--J);
draw(C_1--E);
draw(C_1--J);
draw(B_1--J);
draw(D--B_1);
draw(excircle_a, deepcyan);
draw(C_1--A--B_1);

dot("$A$", A, dir(100));
dot("$B$", B, dir(180));
dot("$C$", C, dir(10));
dot("$D$", D, dir(180));
dot("$E$", E, dir(30));
dot("$J$", J, dir(-90));
dot("$A_1$", A_1, dir(90));
dot("$B_1$", B_1, dir(0));
dot("$C_1$", C_1, dir(180));

/*
    Source: ISL 2006 G5
    Points: A B C D E J A_1 B_1 C_1
    Item: A B C E
    Item: A D E B_1
    Item: D B E A_1
    Item: A J B_1 C_1
    Item: B J A_1 C_1
    Item: C E J A_1 B_1

    Text: $J$ is the $A$-excenter.
    Text: $AB$ and $A_1B_1$ are perpendicular at $D$.
    Text: $E$ is the foot of $C_1$ on $DJ$.
*/
