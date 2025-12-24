pair E = (0, 0);
pair F = dir(50);
pair C = dir(130);
pair G = dir(210);
pair D = (F-.6C)/.4;
circle c_1 = circle(C, E, D);
circle c_2 = circle(C, F, G);
pair B = intersectionpoints(c_1, line(C, G))[1];
pair A = B+D-C;
pair M = (C+F)/2;
pair N = (C+G)/2;
pair P = (B+D)/2;

draw(C--G);
draw(c_2, dotted);
draw(c_1, blue);
draw(A--C, grey);
draw(B--D, grey);
draw(E--G, deepcyan);
draw(E--C, deepcyan);
draw(E--F, deepcyan);
draw(A--G, lightblue);
draw(A--B--C--D--cycle);

dot("$A$", A, dir(50));
dot("$B$", B, dir(150));
dot("$C$", C, dir(180));
dot("$D$", D, dir(0));
dot("$E$", E, dir(-90)*1.3);
dot("$F$", F, dir(90));
dot("$G$", G, dir(220));
dot("$M$", M, dir(-90));
dot("$N$", N, dir(0));
dot("$P$", P, dir(75));

/*
    Source: ISL 2007 G4
    Points: A B C D E F G M N P
    Item: M N P
    Item: C E M N
    Item: B E N P
    Item: D E M P

    Text: $ABCD$ is a parallelogram.
    Text: $E \in (BCD)$ such that $EG=EC=EF$.
    Text: $M$, $N$, $P$ are the midpoints of $CF$, $CG$, $BD$ respectively.
*/
