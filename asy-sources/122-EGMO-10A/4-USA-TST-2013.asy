pair A = dir(180);
pair B = dir(0);
pair C = dir(70);
circle u_c = circle(A, B, C);
pair D = foot(C, A, B);
pair X = .55C+.45D;
pair E = intersectionpoints(u_c, line(A, X))[1];
pair F = intersectionpoints(u_c, line(B, X))[1];
pair G = extension(A, F, B, E);
pair K = intersectionpoints(circle(B, D, G), line(A, X))[0];
pair L = intersectionpoints(circle(A, D, G), line(B, X))[0];
pair T_p = intersectionpoints(circle(D, K, L), line(A, B))[0];

filldraw(A--B--C--cycle, opacity(0.1)+lightgreen, deepgreen);
draw(u_c, lightblue);
draw(A--E);
draw(B--F);
draw(A--G--B, grey);
draw(C--T_p, lightblue);
draw(C--D);
draw(B--K);
draw(A--L);

markangle(n=1, radius=12, A, C, T_p, deepgreen);
markangle(n=1, radius=14, T_p, C, B, deepgreen);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$C$", C, dir(80));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(120));
dot("$G$", G, dir(90));
dot("$K$", K, dir(-90));
dot("$L$", L, dir(-100));
dot("$T'$", T_p, dir(-90));
dot("$X$", X, dir(60));

/*
    Source: USA TST 2013 (10.16)
    Points: A B C D E F G K L X T_p
    Item: C D G X
    Item: B D F G K
    Item: A D E G L
    Item: G E F X
    Item: A D F X
    Item: B D E X
    Item: K L D T_p

    Text: $E=AX\cap (ABC)$, $F=BX\cap (ABC)$, $G=AF\cap BE$
    Text: $C$-angle bisector intersects $AB$ at $T'$
*/
