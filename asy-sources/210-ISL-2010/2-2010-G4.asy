pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair E = dir(-60);
pair F_p = 2*foot(E, A, I)-E;
pair F = extension(A, F_p, B, C);
pair D = intersectionpoints(u_c, line(A, I))[0];
pair I_a = 2*D-I;
pair G = (I+F)/2;
pair K = intersectionpoints(u_c, line(D, G))[1];
pair P = extension(D, G, A, F);

draw(u_c, blue);
draw(A--B--C--cycle);
draw(E--A--F, deepgreen);
draw(A--I_a);
draw(I--F);
draw(D--K);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$E$", E, dir(-40));
dot("$F$", F, dir(-90));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-40));
dot("$I_a$", I_a, dir(-90));
dot("$G$", G, dir(0));
dot("$K$", K, dir(150));
dot("$P$", P, dir(0));

/*
    Source: ISL 2010 G4
    Points: A B C I D E F G K P I_a
    Item: B I C I_a
    Item: A I G K
    Item: K I E
    Text: $K=DG\cap (ABC)$
    Text: $P=DG\cap AF$
    Text: $I_a$ is the $A$-excenter
*/
