pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = intersectionpoints(u_c, line(A, I))[0];
pair E = intersectionpoints(u_c, line(B, I))[1];
pair F = extension(D, E, A, C);
pair G = extension(D, E, B, C);
pair P = intersectionpoint(parallel(F, line(A, I)), parallel(G, line(B, I)));
pair K = 2*A*B/(A+B);
pair M = extension(A, K, P, F);
pair N = extension(B, K, P, G);

draw(A--B--C--cycle, blue);
draw(A--D, orange);
draw(P--M, orange);
draw(B--E, deepgreen);
draw(P--N, deepgreen);
draw(M--K--N);
draw(D--E);
draw(circumcircle(A, B, C), grey);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(-20));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(10));
dot("$G$", G, dir(-60));
dot("$P$", P, dir(-10));
dot("$K$", K, dir(180));
dot("$M$", M, dir(90));
dot("$N$", N, dir(-90));

/*
    Source: ISL 2011 G5
    Points: A B C D E F G P K M N I
    Item: K I P
    Item: A I F E M
    Item: B I G D N
    Item: M I N

    Text: $I$ is the incenter and $D$, $E$ are midpoints of the arcs as usual.
    Text: $F=DE\cap AC$, $G=DE\cap BC$.
    Text: $AI\parallel FP$, $BI\parallel GP$.
    Text: $KA$, $KB$ are tangents.
    Text: $M=AK\cap PF$, $N=BK\cap PG$.
*/
