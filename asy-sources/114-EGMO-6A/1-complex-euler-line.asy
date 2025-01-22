pair A = dir(130);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair H = A+B+C;
pair G = (A+B+C)/3;

draw(u_c, blue);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$O$", O, dir(0));
dot("$H$", H, dir(0));
dot("$G$", G, dir(0));

/*
    Source: Complex Euler Line (6.12)
    Points: A B C O H G
    Item: H G O
*/
