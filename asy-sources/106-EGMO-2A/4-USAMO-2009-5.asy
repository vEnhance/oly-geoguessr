pair O_1 = (-1, 0);
pair O_2 = (1, 0);
pair X = 1.2*dir(78);
circle c_1 = circle((point)O_1, abs(O_1-X));
circle c_2 = circle((point)O_2, abs(O_2-X));
pair Y = 2*foot(X, O_1, O_2)-X;
pair Z = .75X+.25Y;
pair P = intersectionpoints(line(O_1, Z), c_2)[0];
pair Q = intersectionpoints(line(O_1, Z), c_2)[1];
pair R = intersectionpoints(line(O_2, Z), c_1)[0];
pair S = intersectionpoints(line(O_2, Z), c_1)[1];
circle c_3 = circle(P, Q, R);
pair O_3 = circumcenter(P, Q, R);

filldraw(c_1, opacity(0.2)+mediumgrey, grey);
filldraw(c_2, opacity(0.2)+mediumgrey, grey);
filldraw(c_3, opacity(0.2)+lightgrey, dotted);
draw(O_1--Q, grey);
draw(O_2--S, grey);

dot("$P$", P, dir(110)*1.3);
dot("$Q$", Q, dir(20));
dot("$R$", R, dir(65)*1.3);
dot("$S$", S, dir(140));
dot("$X$", X, dir(80)*1.4);
dot("$Y$", Y, dir(-90)*1.4);
dot("$Z$", Z, dir(-100)*1.2);
dot("$O_1$", O_1, dir(-90));
dot("$O_2$", O_2, dir(-90));
dot("$O_3$", O_3, dir(90));

/*
    Source: USAMO 2009/1 (2.21)
    Points: P Q R S X Y Z O_1 O_2 O_3
    Item: X Y Z O_3
    
    Text: $O_1$ lies on $PQ$, $O_2$ lies on $RS$.
    Text: $PQRS$ is cyclic with center $O_3$.
    Text: $Z$ is the intersection of $PQ$ and $RS$.
*/
