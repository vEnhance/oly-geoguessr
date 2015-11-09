# oly-geoguessr
Olympiad GeoGuessr


## Gameplay

A *tuple* is defined to be any of the following:

+ A maximal set of concyclic points, lying on a circle not in the diagram.
+ A maximal set of collinear points, lying on a line not in the diagram.

Your task is to search for all such tuples in the diagram in a series of diagrams,
taken from olympiad geometry configurations.
These configurations are either taken from actual problems from contests like
USAMO or IMO Shortlist, or they are very classical configurations which you
should know anyways. In other words, the diagrams in this game are "organic".

### User Interface

You input a tuple by clicking on the corresponding points in the picture.
(You can deselect a point by clicking it again.)
You can click "Check" to have the program verify your guess of a tuple.
Note that a tuple is *maximal*: that is to say, if five points are concyclic,
and you only select four of the points, your guess will be graded as incorrect.

If you are correct, then all points will flash green momentarily, and the
sequence of points which you clicked will be added to a running list on the right.
Otherwise, all points will flash red, and you will receive a slight penalty (described below).

The order in which the points are highlighted is irrelevant.
Note that if you try to select a tuple which you have correctly identified,
the grader will mark your guess as incorrect.
So keep track of what you've selected and haven't selected!

Once you have identified all the tuples correctly,
the next diagram will automatically appear.


### Scoring
