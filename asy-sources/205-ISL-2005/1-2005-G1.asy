pair B = origin;
pair C = (9,0);
pair A = C+6*dir(acos(23/27))

pair I = incenter(A,B,C)
pair D = foot(I,B,C)
pair E = foot(I,A,C)

pair K = 2*I-D
pair L = 2*I-E

draw(A--B--C--cycle)

/*
    Source: 2005 ISL G1
    Points: A B C D E I K L
    Item: B C D
    Item: A C E
    Item: D K I
    Item: L I E
    Item: A B K L
*/