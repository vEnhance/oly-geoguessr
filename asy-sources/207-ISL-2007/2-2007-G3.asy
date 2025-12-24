pair A = (0, 0);
pair D = (1, 0);
pair C = (.96, .44);
line p_line = parallel(C, line(A, D));
pair B = C+.74*dir(D--A);
pair Q = (1.14, .16);
pair P = extension(A, C, B, D);
circle c_1 = circle(A, D, Q);
pair Q_p = intersectionpoints(c_1, line(P, Q))[1];

draw(A--Q--D, grey);
draw(B--Q--C, grey);
draw(B--C, .8*red);
draw(A--D, .8*red);
draw(A--B);
draw(C--D);
draw(A--C, lightblue);
draw(B--D, lightblue);
draw(Q--Q_p, lightblue);

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
    Item: B C Q Q_p

    Text: $AD\parallel BC$, $P=AC\cap BD$.
    Text: $\angle AQD=\angle BQC$.
    Text: $Q'$ is a point such that the homothety at $P$ sends $A$ to $C$ and $Q$ to $Q'$.
*/
