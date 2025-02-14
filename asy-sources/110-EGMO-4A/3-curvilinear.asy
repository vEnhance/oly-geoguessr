pair O = (0, 0);
pair T = dir(60);
pair M = dir(-90);
pair C = dir(110);
pair O_1 = .6O+.4T;
pair K = O_1+abs(O_1-T)*dir(-90);
circle u_c = circle(C, M, T);
line tangent1 = line(K, rotate(90, K)*O_1);
pair A = intersectionpoints(u_c, tangent1)[0];
pair B = intersectionpoints(u_c, tangent1)[1];
pair I = incenter(A, B, C);
circle c_1 = circle(T, K, O_1+abs(O_1-T)*dir(0));
line tangent2 = tangents(c_1, C)[0];
pair L = intersectionpoints(c_1, tangent2)[0];
pair D = intersectionpoint(tangent2, line(A, B));

draw(u_c, blue);
draw(c_1, deepcyan);
draw(C--D);
draw(C--A--B--cycle);

dot("$O$", O, dir(0));
dot("$T$", T, dir(30));
dot("$O_1$", O_1, dir(-90));
dot("$K$", K, dir(-90));
dot("$C$", C, dir(110));
dot("$M$", M, dir(-90));
dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$I$", I, dir(0));
dot("$L$", L, dir(180));
dot("$D$", D, dir(-90));

/*
    Source: Curvilinear Incircle Chords (4.36)
    Points: A B C I O O_1 T K M L D
    Item: O O_1 T
    Item: M K T
    Item: C I M
    Item: K I L
    Item: C L I T
    Item: D K L O_1

    Text: The two circles with centers $O$ and $O_1$ are tangent.
    Text: $C$ is arbitrary on the arc $AB$ containing $T$.
    Text: $I$ is the incenter of $\triangle ABC$.
    Text: $MA=MB$.
*/
