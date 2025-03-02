pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair N_a = intersectionpoints(u_c, line(A, I))[0];
pair N_b = intersectionpoints(u_c, line(B, I))[1];
pair N_c = intersectionpoints(u_c, line(C, I))[1];
pair I_a = 2*N_a-I;
pair I_b = 2*N_b-I;
pair I_c = 2*N_c-I;
pair P = circumcenter(I_a, I_b, I_c);
pair D = foot(P, B, C);
pair E = foot(P, C, A);
pair F = foot(P, A, B);

draw(u_c, blue);
draw(A--I_a, grey);
draw(B--I_b, grey);
draw(C--I_c, grey);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0)*1.3);
dot("$I_A$", I_a, dir(-90));
dot("$I_B$", I_b, dir(0));
dot("$I_C$", I_c, dir(180));
dot("$P$", P, dir(-90));
dot("$D$", D, dir(-90));
dot("$E$", E, dir(30));
dot("$F$", F, dir(150));

/*
    Source: ISL 2003 G3
    Points: A B C I I_a I_b I_c P D E F
    Item: P D I_a
    Item: P E I_b
    Item: P F I_c
    Item: A I_b I_c
    Item: B I_a I_c
    Item: C I_a I_b
    Item: I I_a B C
    Item: I I_b C A
    Item: I I_c A B

    Text: $I$ is the incenter and $I_A$, $I_B$, $I_C$ are the excenters of $\triangle ABC$.
    Text: Given $AP^2+PD^2=BP^2+PE^2=CP^2+PF^2$.
    Text: $D$, $E$, $F$ are the feet of $P$ on the sides.
*/
