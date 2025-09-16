#import "@preview/truthfy:0.6.0": truth-table, truth-table-empty
#set page(margin: 1in)
#set text(size: 11pt)
#set par(justify: true)

// Header - matching the original PDF layout
#align(center)[
  #text(size: 14pt, weight: "bold")[ECE 369] \
  #text(size: 14pt, weight: "bold")[Homework 1] \
  #text(size: 14pt, weight: "bold")[Due September 10th, 2025]
]

#v(0.5em)

#table(
  columns: (1fr, 1fr),
  stroke: (x: 1pt, y: 1pt),
  inset: 0.5em,
  [For questions with a final answer, please *box your answer*.],
  [
    Name: Timothy Waldin \
    List anyone you have collaborated with: #underline[#h(2in)]
  ]
)

#v(1em)

In this exam, you may use the following inference rules:

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  [*Name*], [*Abbreviation*], [*Rule*],
  [modus ponens], [mp], [$(P -> Q space P) / Q$],
  [modus tollens], [mt], [$(P -> Q space not Q) / (not P)$],
  [simplification], [simpl], [$(P and Q) / P$],
  [addition], [add], [$P / P or Q$],
  [conjunction], [conj], [$(P space Q) / (P and Q)$],
  [hypothetical syllogism], [hs], [$(P -> Q space Q -> R) / (P -> R)$],
  [disjunctive syllogism], [ds], [$(P or Q space not P)/Q$],
  [disjunction elimination], [de], [$((P or Q) space P -> R space Q -> R) / R$],
)
]

And you may use the following equivalences ($α <=> β$ should be read as "$α$ is equivalent to $β$"):

#pagebreak()

#align(center)[
#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  [*Name*], [*Abbreviation*], [*Equivalence*],
  [Double negation], [dn], [$P <=> not not P$],
  [Contrapositive], [cp], [$P -> Q <=> not Q -> not P$],
  [Implication], [impl], [$P -> Q <=> not P or Q$],
  [Exportation], [exp], [$P -> (Q -> R) <=> (P and Q) -> R$],
  [DeMorgan's Laws], [dm], [$not (P and Q) <=> not P or not Q$ \ $not (P or Q) <=> not P and not Q$],
  [Associativity], [assoc], [$(P and Q) and R <=> P and (Q and R)$ \ $(P or Q) or R <=> P or (Q or R)$],
  [Commutativity], [comm], [$P and Q <=> Q and P$ \ $P or Q <=> Q or P$],
  [Distributivity], [dist], [$P and (Q or R) <=> (P and Q) or (P and R)$ \ $P or (Q and R) <=> (P or Q) and (P or R)$],
  [Self-reference], [self], [$P <=> P and P$ \ $P <=> P or P$],
)
]

When you use the deduction theorem, introduce your assumption by labeling it "hyp." and discharge the assumption (turn it into an implication) by labeling it "X–Y, ded" where line X is where you introduced the assumption (the left hand side of the implication), and line Y is where you concluded the right-hand side of the implication. Drawing the vertical line is mandatory.

#pagebreak()

== Problem 1

This problem will ask you to consider building several truth tables. For each boolean formula below, give a complete truth table for all possible combinations of the variables. As an example, here is the truth table for $(a and b) or c$:

#align(center)[
  #truth-table($(a and b) or c$)
]

For each subproblem, use the format above for your truth tables, draw a box around your truth table, and label which subproblem it is for. Feel free to add extra columns to your truth table to work out smaller parts of the formula. Just make sure your last column is for the overall formula.

#set enum(numbering: "(a)")

#grid(
  columns: 2,
  row-gutter: 1em,
  column-gutter: 2em,
  [#enum.item(1)[$(a → b) -> (not a or b)$]
  #rect(stroke: 1pt, inset: 0.5em)[
  #truth-table($(a -> b) -> (not a or b)$)
  ]],
  [#enum.item(2)[$b -> (a -> not a)$]
  #rect(stroke: 1pt, inset: 0.5em)[
  #truth-table($b -> (a -> not a)$)
  ]]
)

#grid(
  columns: 2,
  row-gutter: 1em,
  column-gutter: 2em,
  [#enum.item(3)[$b -> (a -> not b)$]
  #rect(stroke: 1pt, inset: 0.5em)[
  #truth-table($b -> (a -> not b)$)
  ]],
  [#enum.item(4)[$((a -> not b) and a) -> not b$]
  #rect(stroke: 1pt, inset: 0.5em)[
  #truth-table($((a -> not b) and a) -> not b$)
  ]]
)

#pagebreak()

== Problem 2

In this problem, we want you to say whether the two formulas are equivalent.
Justify your answer: if the two formulas are equivalent, draw the truth table
demonstrating this (you must draw the entire truth table for full credit). If
the two formulas are not equivalent, you can show a full truth table, or just
give a row of the truth table that demonstrates the formulae are not
equivalent.

#set enum(numbering: "(a)")

#enum.item(1)[$not(a or b) and c$ versus $not b and (not a and c)$ (10 points)]

#rect(stroke: 1pt, inset: 1em, width: 100%)[
#align(center)[
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
not (a or b) and c <=> not b and (not a and c)
$
]
]

#enum.item(2)[$not a and not b$ versus $not(not b or a)$ (5 points)]

#rect(stroke: 1pt, inset: 1em)[
#grid(
  columns: (auto, auto, auto),
  column-gutter: 1em,
  align: center+horizon,
  truth-table($not a and not b$),
  [vs],
  truth-table($not(not b or a)$)
)
Since their truth tables are not the same,
$
not a and not b cancel(<=>)  not(not b or a)
$
]

#enum.item(3)[$a or b$ versus $not(not a and not b)$ (5 points)]

#rect(stroke: 1pt, inset: 1em)[
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
a or b <=> not (not a and not b)
$
]

#pagebreak()

== Problem 3

Translate these English sentences into propositions and logical formulas. Please make sure your proposition refers to an English sentence that has no negation.

#set enum(numbering: "(a)")

#enum.item(1)[The Boba tea shop will give customer discount if the customer is
a student in ECE20869 and it's Thursday. Bob is a student in ECE20869. Bob
always walks past the Boba tea shop if he came to ECE20869 class. Bob always
buys a Boba tea if he walks pass the Boba tea shop and there is a discount. Bob
does not come to class if it's raining. ECE20869 meets on Tuesdays and
Thursdays. Bob came to ECE20869 class today but did not buy a boba tea.
Therefore, today is Tuesday and today is not raining.

#table(
  columns: (1fr, 1fr),
  stroke: (x: 1pt, y: 1pt),
  [*Propositions:*
  - $a$: The boba tea shop gives customer discount
  - $b$: Bob is a student in ECE20869
  - $c$: Bob came to ECE20869 class
  - $d$: Bob walks past the boba tea shop
  - $e$: Bob buys boba tea
  - $f$: It is raining
  - $g$: Today is Thursday
  - $h$: Today is Tuesday],
  [*Logical formulas:*
  1. $(b and g) -> a$
  2. $b$
  3. $c -> d$
  4. $(d and a) -> e$
  5. $f -> not c$
  6. $c -> (g or h)$
  7. $c and not e$
  8. Therefore: $h and not f$]
)
]

#enum.item(2)[Alice lives in 2nd street. Bob likes eating apple. If Bob lives
in 2nd street, Bob will meet Alice this afternoon. If Bob meets Alice and if
Alice likes eating apple, Bob will give Alice an apple. Alice did not receive
an apple from Bob this afternoon, therefore either Alice does not like eating
apple or Bob did not live in 2nd street.

#table(
  columns: (1fr, 1fr),
  stroke: (x: 1pt, y: 1pt),
  [*Propositions:*
  - $p$: Alice lives in 2nd street
  - $q$: Bob likes eating apple
  - $r$: Bob lives in 2nd street
  - $s$: Bob meets Alice this afternoon
  - $t$: Alice likes eating apple
  - $u$: Bob gives Alice an apple],
  [*Logical formulas:*
  1. $p$
  2. $q$
  3. $r -> s$
  4. $(s and t) -> u$
  5. $not u$
  6. Therefore: $not t or not r$]
)
]
== Problem 4

Prove the following statements step by step: ${not X, Y, Y -> (X or Z)} ⊢ Z$

#rect(stroke: 1pt, inset: 1em)[
#align(center)[
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$not X$], [Premise],
  [2.], [$Y$], [Premise],
  [3.], [$Y -> (X or Z)$], [Premise],
  [4.], [$X or Z$], [2, 3 mp],
  [5.], [$Z$], [1, 4 ds],
)
]
]

#pagebreak()

== Problem 5

Prove the following statement: ${A -> (B -> C), D -> A, B} ⊢ D -> C$

#set enum(numbering: "(a)")

#enum.item(1)[Prove it without using the deduction rule. You are allowed to use
any rule specified on page 1.

#rect(stroke: 1pt, inset: 1em)[
#align(center)[
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$A -> (B -> C)$], [Premise],
  [2.], [$D -> A$], [Premise],
  [3.], [$B$], [Premise],
  [4.], [$D -> (B -> C)$], [1, 2 hs],
  [5.], [$(D -> (B -> C)) <=> ((D and B) -> C)$], [exp],
  [6.], [$(D and B) -> C$], [4, 5 equiv],
  [7.], [$D -> C$], [3, 6 (B as constant)],
)
]
]
]

#enum.item(2)[Prove it using the deduction rule (Hint: You should assume the
antecedent (left hand side) of the implication as your hypothesis. Then try to
prove the consequent (right hand side))

#rect(stroke: 1pt, inset: 1em)[
#align(center)[
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$A -> (B -> C)$], [Premise],
  [2.], [$D -> A$], [Premise],
  [3.], [$B$], [Premise],
  [4.], [$D$], [hyp],
  [5.], [$A$], [2, 4 mp],
  [6.], [$B -> C$], [1, 5 mp],
  [7.], [$C$], [3, 6 mp],
  [8.], [$D -> C$], [4-7, ded],
)
]
]
]

== Problem 6

Prove the following statements, step by step, using deduction: ${not P -> not Q, P -> R} ⊢ Q -> R$

#rect(stroke: 1pt, inset: 1em)[
#align(center)[
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$not P -> not Q$], [Premise],
  [2.], [$P -> R$], [Premise],
  [3.], [$Q$], [hyp],
  [4.], [$Q -> P$], [1, cp],
  [5.], [$P$], [3, 4 mp],
  [6.], [$R$], [2, 5 mp],
  [7.], [$Q -> R$], [3-6, ded],
)
]
]
