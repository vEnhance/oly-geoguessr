pair A = dir(125);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair I = incenter(A, B, C);
pair D  = intersectionpoints(u_c, line(A, I))[0];
pair F_1 = foot(A, B, D);
pair F_2 = foot(A, C, D);
pair F_3 = foot(D, A, B);
pair F_4 = foot(D, A, C);
pair A_1 = extension(F_1, F_2, F_3, F_4);
pair H = A+B+C;

draw(u_c, blue);
draw(D--F_1);
draw(D--C);
draw(B--F_3);
draw(F_1--F_2, deepgreen);
draw(F_3--F_4, deepgreen);
draw(D--F_3, dotted);
draw(D--F_4, dotted);
draw(A--F_1, dotted);
draw(A--F_2, dotted);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$I$", I, dir(0));
dot("$D$", D, dir(-90));
dot("$F_1$", F_1, dir(180));
dot("$F_2$", F_2, dir(-30));
dot("$F_3$", F_3, dir(-110));
dot("$F_4$", F_4, dir(30));
dot("$A_1$", A_1, dir(-90));
dot("$H$", H, dir(0));

/*
    Source: USA TSTST 2013 P1 (6.26)
    Points: A B C D I H A_1 F_1 F_2 F_3 F_4
    Item: A I D
    Item: D H A_1
    Item: A D F_1 F_2 F_3 F_4

    Text: $H$ is the orthocenter of $\triangle ABC$.
    Text: $I$ is the incenter. $D$ is the midpoint of the arc $BC$ not containing $A$.
    Text: $F_1$, $F_2$ are the feet from $A$ on $BD$, $DC$.
    Text: $F_3$, $F_4$ are the feet from $D$ on $AB$, $AC$.
*/
