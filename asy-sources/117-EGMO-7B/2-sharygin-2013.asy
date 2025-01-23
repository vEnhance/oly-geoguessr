pair A = dir(210);
pair B = dir(-30);
pair C = dir(110);
circle u_c = circle(A, B, C);
pair C_1 = .48A+.52B;
pair A_1 = intersectionpoints(circle(C, A, C_1), line(B, C))[0];
pair B_1 = intersectionpoints(circle(C, B, C_1), line(A, C))[0];
pair C_2 = extension(A, A_1, B, B_1);
pair C_p = 2*foot(C, A, B)-C;

draw(A--A_1);
draw(B--B_1);
draw(u_c, blue);
filldraw(triangle(A, B, C), opacity(0.2)+paleyellow);

dot("$A$", A, dir(210));
dot("$B$", B, dir(-30));
dot("$C$", C, dir(110));
dot("$C_1$", C_1, dir(-90));
dot("$A_1$", A_1, dir(30));
dot("$B_1$", B_1, dir(180));
dot("$C_2$", C_2, dir(90));
dot("$C'$", C_p, dir(-90));

/*
    Source: Sharygin 2013 (7.44)
    Points: A B C A_1 B_1 C_1 C_3 C_p
    Item: C A_1 B_1 C_2
    Item: A B_1 C_1 C_2
    Item: B A_1 C_1 C_2
    Item: A C A_1 C_1
    Item: B C B_1 C_1
    Item: C_1 C_2 C_p

    Text: $C'$ is the reflection of $C$ over $AB$
*/
