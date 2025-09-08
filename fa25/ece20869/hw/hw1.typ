#import "@preview/truthfy:0.6.0": truth-table, truth-table-empty
#set enum(numbering: "(a)")
ECE369

HW 01

Timothy Waldin

Due 09/12

\
= Problem 1
#line(length: 100%)
#grid(
  columns: 2,
  row-gutter: 1em,
  column-gutter: 2em,
  [(a) #truth-table($(a -> b) -> (not a or b)$)],
  [(b) #truth-table($b -> (a -> not a)$)],
  [(c) #truth-table($b -> (a -> not b)$)],
  [(d) #truth-table($((a -> not b) and a) -> not b$)]
)

= Problem 2
#line(length: 100%)
(a) Compare $not(a or b) and c$ with $not b and (not a and c)$
#grid(
  columns: (auto, auto, auto),
  column-gutter: 1em,
  align: center + horizon,
  truth-table($not(a or b) and c$),
  [vs],
  truth-table($not b and (not a and c)$)
)
Since their truth tables are the same,
$
(not(a or b) and c) <=> (not b and (not a and c))
$
#pagebreak()

(b) Compare $not a and not b$ with $not(not b or a)$
#grid(
  columns: (auto, auto, auto),
  column-gutter: 1em,
  align: center+horizon,
  truth-table($not a and not b$),
  [vs],
  truth-table($not(not b or a)$)
)
Since the first and second rows of the truth tables are different,
$
(not a and not b) equiv.not (not(not b or a))
$

(c) Compare $a or b$ with $not(not a and not b)$
#grid(
  columns: (auto, auto, auto),
  column-gutter: 1em,
  align: center+horizon,
  truth-table($a or b$),
  [vs],
  truth-table($not(not a and not b)$)
)
Since their truth tables are the same,
$
(a or b) <=> (not(not a and not b))
$

= Problem 3
#line(length: 100%)
Translate these English sentences into propositions and logical formulas. Please make sure your proposition
refers to an English sentence that has no negation

+ #text()[The boba tea shop next to ECE369 classroom has a discount for students every Thursday. Bob is a
student at ECE369. Bob always goes pass the boba tea shop if he came to class. Bob will buy a boba
tea if he goes pass the boba tea shop and there is a discount. Bob does not come to class if it’s raining.
ECE369 meets on Tuesdays and Thursdays. Bob came to class today but did not buy a boba tea.
Therefore, today is Tuesday and today is not raining.

*Translated Propositions:*\
  $a$: The boba tea shop next to ECE369 classroom has a discount.\
  $b$: Bob is a student at ECE369.\
  $c$: Bob came to class.\
  $d$: Bob goes the past boba tea shop.\
  $e$: Bob buys boba tea.\
  $f$: It is raining.\
  $g$: Today is Thursday.\
  $h$: Today is Tuesday.\
  #colbreak()
*Logical formulas*
  #set enum(numbering: "1. ")
  + $g -> a$ "The boba tea shop next to ECE369 classroom has a discount for students every Thursday."
  + $b$ "Bob is a student at ECE369."
  + $c -> d$ "Bob always goes pass the boba tea shop if he came to class."
  + $(d and a) -> e$ "Bob will buy a boba tea if he goes pass the boba tea shop and there is a discount."
  + $f -> not c$ "Bob does not come to class if it is raining."
  + $c -> (g or h)$ "ECE369 meets on Tuesdays and Thursdays"
  + $c and not e$ "Bob came to class today but did not buy a boba tea."
*Deduction*\

+ (Formula 7) $c$ is true and $not e$ is true. This is a stated premise.\
+ (Formula 3) $c -> d$ (Since bob came to class, Bob went past the boba tea shop).\
+ (Formula 4) $not e -> not (d and a)$ but since $d$, $not a$.  contrapositive (Since Bob did not buy boba but he did come to class, there must not be a discount).\
+ (Formula 1) $not a -> not g$ contrapositive (Since no discount, it's not Thursday).\
+ (Formula 6) $c -> (g or h)$ but we know $not g$, so $h$ bust be true (Since ECE369 meets on Tuesdays and Thursdays, but it's not Thursday, it's Tuesday).\
+ (Formula 5)$c -> not f$ contrapositive (If Bob came to class, it is not raining).\
*Conclusion*
  + $h and not f$ "Today is Tuesday and today is not raining.

]
