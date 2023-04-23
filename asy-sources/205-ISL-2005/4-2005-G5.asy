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

dot(A^^B^^C^^D^^E^^M^^H^^Q);

label("$A$",A,dir(90));
label("$B$",B,dir(200));
label("$C$",C,dir(-40));

label("$M$",M,dir(-90));
label("$H$",H,dir(100));
label("$D$",D,dir(150));
label("$E$",E,dir(40));

label("$Q$",Q,dir(20));

draw(A--B--C--cycle);

/*
Source: ISL 2005 G5
Points: A B C H D E Q M
Item: H Q M
Item: D E H
Item: A D E Q

Text: $AD=AE$. 
Text: $H$ is an orthocenter.
*/