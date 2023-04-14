pair B = origin;
pair C = (4,0);
pair A = 3*dir(35.430945);

pair I = incenter(A,B,C);
pair D = foot(I,B,C);
pair E = foot(I,A,B);

pair K = 2*I-D;
pair L = 2*I-E;

dot(A^^B^^C^^D^^E^^I^^K^^L);

label("$A$",A,dir(90));
label("$B$",B,dir(200));
label("$C$",C,dir(-40));

label("$I$",I,dir(120));
label("$D$",D,dir(-90));
label("$E$",E,dir(120));

label("$K$",K,S);
label("$L$",L,dir(90));

draw(A--B--C--cycle);

/*
    Source: 2005 ISL G1
    Points: A B C D E I K L
    Item: D K I
    Item: L I E
    Item: A B K L
    Text: $AB+BC=3AC$.
    Text: $K$ and $L$ are reflections.
*/