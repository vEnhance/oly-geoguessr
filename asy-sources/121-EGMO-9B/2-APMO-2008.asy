pair A = dir(210);
pair B = dir(115);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair D = .65B+.35C;
pair E = intersectionpoints(circle(A, C, D), line(A, B))[1];
pair G = intersectionpoints(u_c, line(A, D))[1];
pair H = intersectionpoints(u_c, line(C, E))[1];
line line1 = line(D, E);
line tangent1 = tangent(u_c, A);
line tangent2 = tangent(u_c, C);
pair L = intersectionpoint(line1, tangent1);
pair M = intersectionpoint(line1, tangent2);
pair P = extension(L, H, M, G);

draw(L--M);
draw(u_c, blue);
draw(A--G, grey);
draw(C--H, grey);
draw(M--P, dashed);
draw(A--B--C--cycle);
draw(L--A, lightblue);
draw(M--C, lightblue);
draw(circle(A, C, D), deepcyan);

dot("$A$", A, dir(210));
dot("$B$", B, dir(110));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(85)*1.4);
dot("$E$", E, dir(113)*1.4);
dot("$G$", G, dir(90)*1.4);
dot("$H$", H, dir(180));
dot("$L$", L, dir(180));
dot("$M$", M, dir(0));
dot("$P$", P, dir(150));

/*
    Source: APMO 2008 P3 (9.54)
    Points: A B C D E G H L M P
    Item: L H P
    Item: B D E P
    Item: A L P D
    Item: C M P E

    Text: $ACDE$ is cyclic.
    Text: Tangents at $A$, $C$ intersects $DE$ at $L$, $M$.
    Text: $G=ADc\cap (ABC)$, $P=GM\cap (ABC)$.
*/
