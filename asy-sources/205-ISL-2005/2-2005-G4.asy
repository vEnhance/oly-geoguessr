pair D = origin;
pair A = dir(80);
pair C = 1.3*dir(10);
pair B = C + dir(115);

real k = 0.2;
pair E = B + k*dir(295);
pair F = k*dir(80);

pair P = intersectionpoint(A--C,B--D);
pair Q = intersectionpoint(B--D,E--F);
pair R = intersectionpoint(A--C,E--F);

pair T = intersectionpoints(
    circumcircle(F,Q,D),
    circumcircle(P,Q,R)
)[0];

draw(A--B--C--D--cycle);

dot(A^^B^^C^^D^^E^^F^^P^^Q^^R^^T);

label("$A$",A,dir(120));
label("$B$",B,dir(70));
label("$C$",C,dir(-30));
label("$D$",D,dir(-140));

label("$E$",E,dir(40));
label("$F$",F,dir(160));
label("$P$",P,dir(90));
label("$Q$",Q,dir(180));
label("$R$",R,dir(90));
label("$T$",T,dir(-90));

/*
Source: 2005 ISL G4/IMO 2005
Points: A B C D E F P Q R T
Item: B E C
Item: D A F
Item: A C P R
Item: B D P Q
Item: E F Q R
Item: T A F R
Item: T F Q D
Item: T B E Q
Item: T B P C
Item: T P Q R
Item: A P D T
Item: B P C T

Text: $BC=DA$ and $BE=DF$.
*/