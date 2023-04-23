pair A = 1.5*dir(70);
pair B = origin;
pair C = (2,0);
pair M = (B+C)/2;

pair H = orthocenter(A,B,C);
pair I = incenter(A,B,C);
pair K = foot(H,A,I);
pair D = point(A--B,intersections(A--B,H,K)[0]);
pair E = point(A--C,intersections(A--C,H,K)[0]);
pair Q = point(H--M,intersections(H--M,A,I)[0]);

draw(A--B--C--cycle);
draw(D--E, grey);
draw(A--Q, grey);
draw(H--M, grey);

dot("$A$",A,dir(90));
dot("$B$",B,dir(200));
dot("$C$",C,dir(-40));

dot("$M$",M,dir(-90));
dot("$H$",H,dir(100));
dot("$D$",D,dir(150));
dot("$E$",E,dir(40));

dot("$Q$",Q,dir(20));


/*
Source: Shortlist 2005 G5
Points: A B C H D E Q M
Item: A D E Q

Text: $AD=AE$.
Text: $H$ is an orthocenter.
Text: $Q$ lies on the bisector of $\angle A$.
*/
