pair A = (0, 0);
pair D = (1, 0);
pair C = (.96, .44);
line p_line = parallel(C, line(A, D));
pair B = C+.74*dir(D--A);
pair Q = (1.14, .16);
pair P = extension(A, C, B, D);
circle c_1 = circle(A, D, Q);
pair Q_p = intersectionpoints(c_1, line(P, Q))[1];

draw(A--Q--D);
draw(B--Q--C);
draw(B--C, orange);
draw(A--D, orange);
draw(A--C, lightblue);
draw(B--D, lightblue);
draw(Q--Q_p, lightblue);
draw(A--B--C--D--cycle);

markangle(n=2, radius=10, C, Q, B, deepgreen);
markangle(n=2, radius=10, A, Q, D, deepgreen);

dot("$A$", A, dir(180));
dot("$B$", B, dir(130));
dot("$C$", C, dir(30));
dot("$D$", D, dir(0));
dot("$P$", P, dir(-100));
dot("$Q$", Q, dir(-10));
dot("$Q'$", Q_p, dir(180));

/*
    Source: ISL 2007 G3
    Points: A B C D P Q Q_p
    Item: A D Q Q_p

    Text: $Q'$ is a point such that the homothety at $P$ sends $A$ to $C$ and $Q$ to $Q'$
*/
