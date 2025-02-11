pair A = dir(125);
pair B = dir(210);
pair C = dir(-30);
pair O = (0, 0);
pair H = A+B+C;
circle u_c = circle(A, B, C);
pair K = (C+A)/2;
pair L = (A+B)/2;
pair D = intersectionpoints(u_c, line(B, K))[1];
pair E = intersectionpoints(u_c, line(C, L))[1];
pair P = 2*K-B;
pair Q = 2*L-C;
circle c_1 = circle(C, D, P);
circle c_2 = circle(B, E, Q);
pair A_p = -A;
pair N = (A+B+C)/2;
pair X = 2*N-A_p;
pair O_1 = circumcenter(C, D, P);
pair O_2 = circumcenter(B, E, Q);

draw(B--P);
draw(C--Q);
draw(H--O);
draw(A--A_p, grey);
draw(u_c, blue);
draw(P--C, grey);
draw(Q--B, grey);
draw(X--O_1, orange);
draw(X--O_2, orange);
draw(A--B--C--cycle);
draw(c_1, deepgreen);
draw(arc(O_2, abs(O_2-B), -25, 120), deepgreen);

dot("$A$", A, dir(130));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D$", D, dir(82)*1.5);
dot("$E$", E, dir(210)*1.3);
dot("$H$", H, dir(90));
dot("$K$", K, dir(80)*1.3);
dot("$L$", L, dir(40));
dot("$N$", N, dir(-70));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(140));
dot("$A'$", A_p, dir(-60));
dot("$X$", X, dir(120));
dot("$O$", O, dir(0));
dot("$O_1$", O_1, dir(0));
dot("$O_2$", O_2, dir(180));

/*
    Source: ELMO Shortlist 2013 (6.46)
    Points: A B C D E H K L N O P Q X A_p O_1 O_2
    Item: A P Q
    Item: D E K L
    Item: D E P Q
    Item: A K L O
    Item: A_p N X
    Item: N O_1 O_2
    Item: C A_p O_1
    Item: B A_p O_2

    Text: $K$, $L$ are midpoints of two sides.
    Text: $D=BK\cap (ABC)$, $E=CL\cap (ABC)$.
    Text: $P$ is the reflection of $B$ over $K$. Similarly $Q$.
    Text: $O_1$ is the center of $(PDC)$ and it is tangent to $AC$. Similarly $(QBE)$ is defined.
    Text: $X$ is the intersection of perpendicular bisector of $CP$ and $BQ$.
*/
