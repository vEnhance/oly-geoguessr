pair A = dir(120);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
circle incircle = circle(D, E, F);
circle c_1 = circle(A, E, F);
circle c_2 = circle(B, D, F);
circle c_3 = circle(C, D, E);
pair P = intersectionpoints(u_c, c_1)[0];
pair Q = intersectionpoints(u_c, c_2)[1];
pair R = intersectionpoints(u_c, c_3)[0];
pair K = intersectionpoints(u_c, line(A, I))[0];
pair L = intersectionpoints(u_c, line(B, I))[1];
pair M = intersectionpoints(u_c, line(C, I))[1];
pair U = extension(Q, E, R, F);

draw(u_c, grey);
draw(A--B--C--A);
draw(incircle, dotted);
filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
filldraw(c_3, opacity(0.2)+mediumgrey, grey);
draw(Q--E, dashed);
draw(R--F, dashed);

dot("$A$", A, dir(120));
dot("$B$", B, dir(220));
dot("$C$", C, dir(-40));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(40));
dot("$F$", F, dir(180));
dot("$I$", I, dir(-30));
dot("$K$", K, dir(-90));
dot("$L$", L, dir(30));
dot("$M$", M, dir(160));
dot("$P$", P, dir(170));
dot("$Q$", Q, dir(200));
dot("$R$", R, dir(-30));
dot("$U$", U, dir(-90));

/*
    Source: Canada 2007/5 (2.37)
    Points: A B C D E F I K L M P Q R U
    Item: A I K
    Item: B I L
    Item: C I M
    Item: P U D K
    Item: Q U E L
    Item: R U F M
    Item: D E P Q
    Item: E F Q R
    Item: D F P R
    
    Text: $I$ is the incenter of $\triangle ABC$.
    Text: $P=(AEFI)\cap (ABC)$, $Q=(BDFI)\cap (ABC)$, $R=(CDEI)\cap (ABC)$, $U=QE\cap FR$.
    Text: $K$ is the midpoint of the arc $BC$ not containing $A$. Similarly $L$, $M$.
*/
