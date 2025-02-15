pair A = dir(140);
pair B = dir(85);
pair C = dir(-20);
pair D = dir(200);
circle u_c = circle(A, B, C);
pair P = extension(A, D, B, C);
pair Q = extension(A, B, C, D);
pair M = intersectionpoints(circle(A, B, P), circle(A, D, Q))[1];
pair O = circumcenter(A, B, C);
pair R = extension(A, C, B, D);

filldraw(A--B--C--D--cycle, opacity(0.1)+lightgreen, deepgreen);
draw(u_c, lightblue);
draw(A--C, grey);
draw(B--D, grey);
draw(A--P--B);
draw(A--Q--D);

dot("$A$", A, dir(130));
dot("$B$", B, dir(30));
dot("$C$", C, dir(-60));
dot("$D$", D, dir(240));
dot("$M$", M, dir(180));
dot("$O$", O, dir(180));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(180));
dot("$R$", R, dir(12)*1.3);

/*
    Source: Miquel point of a cyclic quadrilateral (10.12)
    Points: A B C D M O P Q R
    Item: P Q M
    Item: M O R
    Item: A D Q M
    Item: B C Q M
    Item: A B P M
    Item: C D P M
    Item: A O C M
    Item: B O D M

    Text: $M$ is the miquel point of cyclic quadrilateral $ABCD$.
*/
