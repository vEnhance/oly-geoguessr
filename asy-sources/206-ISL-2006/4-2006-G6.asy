pair P = dir(110);
pair A = dir(210);
pair B = dir(-30);
pair O = (A+B)/2;
circle u_c = circle(P, A, B);
pair D = P+A+B;
pair E = foot(B, P, A);
pair F = foot(A, P, B);
pair K = extension(E, F, P, D);
pair E_p = rotate(90, (D+E)/2)*E;
pair F_p = rotate(90, (D+F)/2)*F;
pair O_1 = extension(E_p, (D+E)/2, A, K);
pair O_2 = extension(F_p, (D+F)/2, B, K);

draw(P--D);
draw(E--F);
draw(P--A--B--cycle);
draw(circle(O_1, abs(E-O_1)), deepcyan+dotted);
draw(circle(O_2, abs(F-O_2)), deepcyan+dotted);
draw(arc((A+B)/2, abs((A+B)/2-A), 180, 0), deepcyan);


dot("$A$", A, dir(210));
dot("$B$", B, dir(-30));
dot("$D$", D, dir(0));
dot("$E$", E, dir(180));
dot("$F$", F, dir(60));
dot("$K$", K, dir(135));
dot("$O$", O, dir(-90));
dot("$P$", P, dir(90));
dot("$O_1$", O_1, dir(180));
dot("$O_2$", O_2, dir(0));

/*
    Source: ISL 2006 G6
    Points: A B D E F K O P O_1 O_2
    Item: D O_1 O_2
    Item: A O_1 K
    Item: B O_2 K
    Item: O O_1 E
    Item: O O_2 F
    Item: P D E F
    Item: A D F
    Item: B D E

    Text: Three circles with centers $O$, $O_1$, $O_2$ are tangent to each other.
    Text: Common tangent line at $D$ is perpendicular to the diameter $AB$.
    Text: $P=AE\cap BF$, $K=PD\cap EF$.
*/
