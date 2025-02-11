pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
pair O = (0, 0);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D = foot(I, B, C);
pair E = foot(I, C, A);
pair F = foot(I, A, B);
pair Q = -A;
pair P = extension(E, F, I, Q);
pair X = intersectionpoints(u_c, line(I, Q))[1];
pair A_s = (E+F)/2;

draw(u_c, blue);
draw(X--Q, dashed+.8*red);
draw(A--Q, grey);
draw(A--B--C--cycle);
draw(D--E--F--cycle);
draw(circle(D, E, F), lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(180));
dot("$I$", I, dir(200));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(180));
dot("$Q$", Q, dir(-70));
dot("$P$", P, dir(-120)*1.2);
dot("$X$", X, dir(120));
dot("$A^*$", A_s, dir(90));

/*
    Source: NIMO 2014 (8.30)
    Points: A B C D E F I O P Q X A_s
    Item: B D F I
    Item: C D E I
    Item: A I A_s
    Item: A E F I X

    Text: $\triangle DEF$ is the contact triangle of $\triangle ABC$.
    Text: $O$ is the center of $\triangle ABC$ and $Q$ be its antipode. $I$ is the incenter of it.
    Text: $P=QI\cap EF$, $X=QI\cap (ABC)$.
    Text: $A^*$ is the midpoint of $EF$.
*/
