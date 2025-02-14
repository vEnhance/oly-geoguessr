pair A = dir(115);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair N_a = dir(-90);
pair I = incenter(A, B, C);
pair O = circumcenter(A, B, C);
pair S = -N_a;
pair T = intersectionpoints(u_c, line(S, I))[0];
pair K = extension(A, B, I, rotate(90, I)*A);
pair L = extension(A, C, I, rotate(90, I)*A);
circle mixtillinear_a = circle(K, L, T);
pair M_b = intersectionpoints(u_c, line(B, I))[1];
pair M_c = intersectionpoints(u_c, line(C, I))[1];

draw(u_c, blue);
draw(A--B--C--cycle);
draw(mixtillinear_a, deepcyan);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0));
dot("$S$", S, dir(90));
dot("$T$", T, dir(-120));
dot("$K$", K, dir(180));
dot("$L$", L, dir(30));
dot("$M_B$", M_b, dir(30));
dot("$M_C$", M_c, dir(180));

/*
    Source: Mixtilinear Incircles (4.40)
    Points: A B C I K L S T M_b M_c
    Item: B I M_b
    Item: C I M_c
    Item: I K L
    Item: I T S
    Item: B K I T
    Item: C L I T

    Text: $T$, $K$, $L$ are the $A$-mixtilinear touchpoints on the circumcircle and sides $AB$, $AC$ respectively.
    Text: $I$ is the incenter and $M_B$, $M_C$ are the midpoint of the minor arc $AC$, $AB$.
    Text: $S$ is the midpoint of the major arc $BC$.
*/
