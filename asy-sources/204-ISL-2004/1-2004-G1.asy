pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
pair H = A+B+C;
pair O = (B+C)/2;
circle u_c = circle(A, B, C);
pair M = foot(B, A, C);
pair N = foot(C, A, B);
pair I = incenter(A, B, C);
pair R = intersectionpoints(circle(A, M, N), line(A, I))[0];
pair S = intersectionpoints(circle(B, N, R), line(B, C))[1];

draw(u_c, blue);
draw(B--M, grey);
draw(C--N, grey);
draw(A--R--O, dashed);
draw(N--O--M, dotted);

draw(circle(B, N, R), lightblue);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$H$", H, dir(90)*1.2);
dot("$M$", M, dir(30));
dot("$N$", N, dir(160));
dot("$O$", O, dir(-90));
dot("$R$", R, dir(30));
dot("$S$", S, dir(-65));

/*
    Source: ISL 2004 G1
    Points: A B C H O M N R S
    Item: B N M C
    Item: A H M N R
    Item: C M R S

    Text: $H$ is the orthocenter and $O$ is the midpoint of $BC$.
    Text: $R$ is the intersection of the angle bisector of $\angle BAC$ and $\angle MON$.
    Text: $S$ is the intersection of $BC$ and $(BNR)$.
*/
