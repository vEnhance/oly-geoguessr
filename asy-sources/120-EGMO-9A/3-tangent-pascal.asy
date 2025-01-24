pair A = dir(153);
pair B = dir(213);
pair C = dir(-33);
circle u_c = circle(A, B, C);
line tangent1 = tangent(u_c, A);
line tangent2 = tangent(u_c, B);
line tangent3 = tangent(u_c, C);
pair X = intersectionpoint(tangent1, line(B, C));
pair Y = intersectionpoint(tangent2, line(C, A));
pair Z = intersectionpoint(tangent3, line(A, B));

draw(B--X);
draw(A--Y);
draw(B--Z);
draw(u_c, blue);
draw(A--B--C--cycle);
draw(A--X, lightblue);
draw(B--Y, lightblue);
draw(C--Z, lightblue);

dot("$A$", A, dir(110));
dot("$B$", B, dir(230));
dot("$C$", C, dir(-50));
dot("$X$", X, dir(180));
dot("$Y$", Y, dir(160));
dot("$Z$", Z, dir(-90));

/*
    Source: 9.31
    Points: A B C X Y Z
    Item: X Y Z
*/
