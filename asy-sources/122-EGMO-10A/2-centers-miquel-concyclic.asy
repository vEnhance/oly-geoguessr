pair A = .75*dir(140);
pair B = dir(80);
pair C = dir(-30);
pair D = dir(210);
pair P = extension(A, D, B, C);
pair Q = extension(A, B, C, D);
pair M = intersectionpoints(circle(A, B, P), circle(A, D, Q))[1];
pair O_1 = circumcenter(B, C, Q);
pair O_2 = circumcenter(A, D, Q);
pair O_3 = circumcenter(A, B, P);
pair O_4 = circumcenter(C, D, P);



filldraw(A--B--C--D--cycle, opacity(0.1)+lightgreen, deepgreen);
draw(A--P--B);
draw(A--Q--D);

dot("$A$", A, dir(130));
dot("$B$", B, dir(30));
dot("$C$", C, dir(-60));
dot("$D$", D, dir(240));
dot("$M$", M, dir(180));
dot("$P$", P, dir(90));
dot("$Q$", Q, dir(180));
dot("$O_1$", O_1, dir(180));
dot("$O_2$", O_2, dir(180));
dot("$O_3$", O_3, dir(180));
dot("$O_4$", O_4, dir(180));

/*
    Source: Centers are concyclic with the miquel point (10.6)
    Points: A B C D M P Q O_1 O_2 O_3 O_4
    Item: M O_1 O_2 O_3 O_4
    Item: A D Q M
    Item: B C Q M
    Item: A B P M
    Item: C D P M
    
    Text: $M$ is the miquel point of quadrilateral $ABCD$.
    Text: $O_1$, $O_2$, $O_3$, $O_4$ are the circumcenters of $\triangle BCQ$, $\triangle ADQ$, $\triangle ABP$, $\triangle CDP$ respectively.
*/
