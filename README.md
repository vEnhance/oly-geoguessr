# Olympiad GeoGuessr (oly-geoguessr)

[Link to game](http://web.evanchen.cc/guessr/index.html)

## Synopsis

A **item** is defined to be any of the following:

- A maximal set of concyclic points, lying on a circle not in the diagram.
- A maximal set of collinear points, lying on a line not in the diagram.

Your task is to search for all such items in the diagram in a series of diagrams,
taken from olympiad geometry configurations.
These configurations are either taken from actual problems from contests like
USAMO or IMO Shortlist, or they are very classical configurations which you
should know anyways. In other words, the diagrams in this game are "organic".

### Finding Items

You input a item by clicking on the corresponding points in the picture.
(You can deselect a point by clicking it again.)
You can click "Check" (upper left) to have the program verify
your conjecture. Note that a item is _maximal_:
this means for example that if five points are concyclic, and
you only select four of the points, your conjecture will be
graded as incorrect.

If you are correct, then all points will flash green momentarily,
and the found item which you clicked will be added to a
running list on the right. Otherwise, all points will flash red,
and you will receive a slight penalty, see below.
If you try to input an item more than once,
the points will flash orange but there is no penalty.
The order in which the points are highlighted is irrelevant.

Once you have found all the items in a diagram,
**you must press the "Finish" button**.
Correctly doing so will complete the entire diagram.
Doing so incorrectly will again cause a small penalty, see below.

### Game Format

Each "episode" consists of a set of four diagrams, worth 7 marks each.
You are given six minutes to try and identify as many items as you can.
The "Previous" and "Next" buttons in the lower-right let you move
freely between the diagrams, so e.g. if you are stuck on one diagram,
you can move on to a different one and come back later.
The system will remember all the items you have found as you move
back and forth throughout the system.

The episode ends when either one of the following conditions is met:

- Time has expired, or
- You have completed all four diagrams.

### Scoring

Once the episode is completed,
your score for the game is the sum of the scores for all diagrams.

Your score for a diagram is computed as follows.

- **7 marks** if the diagram was completed with at most one error.
- **6 marks** if the diagram was completed with at most four errors.
- **5 marks** if the diagram was completed with more than four errors.
- **4 marks** if all items were found,
  but the "Finish" button was not pressed.
- **2 marks** if at least 1/2 of the possible items were found.
- **1 mark** if at least 1/3 of the possible items were found.
- **0 marks** otherwise.

Here an "error" is any conjecture graded as incorrect
or any incorrect attempts to press the "Done" button.
