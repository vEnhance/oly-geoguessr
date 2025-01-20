pair A = dir(210);
pair B = dir(-30);
pair C = dir(140);
pair M = (A+B)/2;
pair I = incenter(A, B, C);
pair A_p = foot(I, B, C);
pair B_p = foot(I, C, A);
pair C_p = foot(I, A, B);
circle incircle = circle(A_p, B_p, C_p);
pair Z = foot(I, C, M);
pair K_p = extension(A_p, B_p, I, Z);
pair L = extension(C, M, A_p, B_p);

draw(A--B--C--cycle, lightblue);
draw(incircle, dotted+deepcyan);
draw(C--K_p);
draw(C--M);
draw(K_p--B_p);

dot("$A$", A, dir(210));
dot("$B$", B, dir(-30));
dot("$C$", C, dir(110));
dot("$M$", M, dir(-90));
dot("$I$", I, dir(0));
dot("$A'$", A_p, dir(75));
dot("$B'$", B_p, dir(180));
dot("$C'$", C_p, dir(-90));
dot("$Z$", Z, dir(0));
dot("$K'$", K_p, dir(0));
dot("$L$", L, dir(75));

/*
    Source: Sharygin 2013 (4.51)
    Points: A B C I L M Z A_p B_p C_p K_p
    Item: C I A_p B_p
    Item: A I B_p C_p
    Item: B I A_p C_p
    Item: I M Z C_p
    Item: I L C_p
    Item: I Z K_p

    Text: $K\in B'C'$ such that $CK'\parallel AB$
    Text: $Z$ is the foot from $I$ on $CM$
*/
