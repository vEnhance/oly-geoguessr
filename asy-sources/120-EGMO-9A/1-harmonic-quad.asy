pair A = dir(165);
pair X = dir(60);
pair Y = dir(-50);
circle u_c = circle(A, X, Y);
pair P = 2*X*Y/(X+Y);
pair B = intersectionpoints(u_c, line(A, P))[0];

draw(u_c, blue);
draw(A--X--B--Y--A);
draw(X--P--Y, lightblue);

dot("$A$", A, dir(180));
dot("$B$", B, dir(0));
dot("$X$", X, dir(70));
dot("$Y$", Y, dir(-60));
dot("$P$", P, dir(0));

/*
    Source: Harmonic Quadrilaterals (9.9)
    Points: A B X Y P
    Item: A B P

    Text: $AXBY$ is a harmonic quadrilateral.
    Text: $PX$, $PY$ are tangents.
*/
