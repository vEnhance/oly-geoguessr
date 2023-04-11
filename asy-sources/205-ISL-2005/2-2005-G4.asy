pair D = origin;
pair A = dir(110);
pair C = 1.3*dir(20);
pair B = C + dir(90);

real k = 0.2;
pair E = B + k*dir(270);
pair F = k*dir(110);

pair P = intersectionpoint(A--C,B--D);
pair Q = intersectionpoint(B--D,E--F);
pair R = intersectionpoint(A--C,E--F);

draw(A--B--C--D--cycle);

pair T = intersectionpoint(
    bisectorpoint(A,C)--(A+C)/2,
    bisectorpoint(B,D)--(B+D)/2
);

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
*/