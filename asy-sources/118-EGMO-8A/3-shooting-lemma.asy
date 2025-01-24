pair T = dir(70);
pair O = (0, 0);
pair M = dir(-90);
pair O_1 = .7T+.3O;
pair K = O_1+abs(O_1-T)*dir(-90);
pair L = dir(0);
circle u_c = circle(L, M, T);
pair B = intersectionpoints(u_c, line(K, rotate(90, K)*O_1))[0];
pair C = intersectionpoints(u_c, line(K, rotate(90, K)*O_1))[1];

draw(B--C);
draw(u_c, blue);
draw(circle(O_1, abs(O_1-T)), lightblue);
draw(arc(M, abs(M-B), 140, 40), dashed);

dot("$T$", T, dir(40));
dot("$B$", B, dir(160));
dot("$C$", C, dir(20));
dot("$M$", M, dir(-90));
dot("$K$", K, dir(-90));
dot("$O$", O, dir(10));
dot("$O_1$", O_1, dir(10));


/*
    Source: 8.15
    Points: B C T K M O O_1
    Item: T O O_1
    Item: T K M
*/
