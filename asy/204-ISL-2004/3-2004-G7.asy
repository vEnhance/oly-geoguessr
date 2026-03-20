pair A = dir(70);
pair B = dir(215);
pair C = dir(-35);
pair X = (C-.4B)/.6;
pair I_1 = incenter(A, B, X);
pair I_2 = incenter(A, C, X);
pair D = foot(I_1, B, X);
pair E = foot(I_1, A, X);
pair F = foot(I_1, A, B);
pair G = foot(I_2, C, X);
pair H = foot(I_2, A, X);
pair I = foot(I_2, A, C);
circle incircle1 = circle(D, E, F);
circle incircle2 = circle(G, H, I);
pair M = (A+B)/2;
pair N = (A+X)/2;
pair R = extension(M, N, B, I_1);
pair S = extension(M, N, C, I_2);
pair P = intersectionpoints(incircle1, incircle2)[1];
pair Q = intersectionpoints(incircle1, incircle2)[0];

draw(A--B--C--cycle);
draw(incircle1, lightblue);
draw(incircle2, lightblue);
draw(A--X--C);
draw(M--S, .8*red);
draw(B--R, deepgreen);
draw(C--S, deepgreen);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-70));
dot("$X$", X, dir(0));
dot("$I_1$", I_1, dir(-90));
dot("$I_2$", I_2, dir(-70));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$G$", G, dir(-90));
dot("$H$", H, dir(30));
dot("$M$", M, dir(180));
dot("$N$", N, dir(60));
dot("$R$", R, dir(70));
dot("$S$", S, dir(0));
dot("$P$", P, dir(-40));
dot("$Q$", Q, dir(0));

/*
    Source: ISL 2004 G7
    Points: A B C X D E G H M N R S P Q I_1 I_2
    Item: X I_1 I_2
    Item: D E R
    Item: G H S
    Item: A R E I_1
    Item: A S H I_2
    Item: X D E I_1
    Item: X G H I_2

    Text: The incircles of $\triangle ABX$ and $\triangle ACX$ intersect at $P$, $Q$.
    Text: $I_1$, $I_2$ are the centers of the incircles.
    Text: $MN$ is the $A$-midline.
    Text: $R=MN\cap BI_1$, $S=MN\cap CI_2$.
*/
