pair O = (0, 0);
pair B = dir(215);
pair C = dir(-35);
pair D_p = dir(-90);
pair E = D_p+abs(D_p-B)*dir(60);
circle c_1 = circle(B, E, C);
line tangent1 = tangents(c_1, O)[0];
pair I = intersectionpoints(c_1, tangent1)[0];
pair A = 2*I-D_p;

draw(A--D_p, grey);
filldraw(triangle(A, B, C), opacity(0.2)+pink, black);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$D'$", D_p, dir(-90));
dot("$I$", I, dir(30));

/*
    Source: Harvard-MIT Math Tournament 2013 (5.20)
    Points: A B C D_p I
    Item: A B C D_p

    Text: $I$ is the incenter.
    Text: $2BC=AB+AC$.
    Text: $D'$ is the reflection of $A$ over $I$.
*/
