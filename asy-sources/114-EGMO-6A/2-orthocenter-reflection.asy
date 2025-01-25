pair A = dir(110);
pair B = dir(210);
pair C = dir(-30);
circle u_c = circle(A, B, C);
pair O = (0, 0);
pair H = A+B+C;
pair X = 2*foot(H, B, C)-H;
pair M = (B+C)/2;
pair Y = 2*M-H;

draw(A--X);
draw(H--Y);
draw(A--B--C--cycle);

dot("$A$", A, dir(110));
dot("$B$", B, dir(210));
dot("$C$", C, dir(-30));
dot("$H$", H, dir(180));
dot("$M$", M, dir(-120));
dot("$X$", X, dir(-90));
dot("$Y$", Y, dir(-90));
dot("$O$", O, dir(0));

/*
    Source: 6.14
    Points: A B C H M X Y O
    Item: A B C X Y
    Item: A O Y
*/
