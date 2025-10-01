// hw2.typ
#import "@preview/truthfy:0.5.0": truth-table, truth-table-empty

#set page(
  paper: "us-letter",
  margin: 1in,
)

#set text(font: "New Computer Modern", size: 11pt)
#set par(justify: true)

// Header section
#box(width: 100%, stroke: 1pt, inset: 10pt)[
  #grid(
    columns: (1fr, 1fr),
    [
      #text(weight: "bold", size: 12pt)[ECE 369] \
      #text(weight: "bold", size: 12pt)[Homework 2] \
      Due September 24th, 2025 \
      \
    ],
    [
      Name: Timothy Waldin \
      \
      List anyone you have collaborated with: \
    ]
  )
]

#v(1em)

In this exam, you may use the following inference rules:

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  align: (left, center, left),
  [*Name*], [*Abbreviation*], [*Rule*],
  [modus ponens], [mp], [$(P -> Q quad P) / Q$],
  [modus tollens], [mt], [$(P -> Q quad not Q)/ (not P)$],
  [simplification], [simpl], [$(P and Q)/ P$],
  [addition], [add], [$P / (P or Q)$],
  [conjunction], [conj], [$(P quad Q) / (P and Q)$],
  [hypothetical syllogism], [hs], [$(P -> Q quad Q -> R) / (P -> R)$],
  [disjunctive syllogism], [ds], [$(P or Q quad not P) / Q$],
  [disjunction elimination], [de], [$((P or Q) quad P -> R quad Q -> R) / R$],
)

And you may use the following equivalences ($alpha <=> beta$ should be read as "$alpha$ is equivalent to $beta$"):

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  align: (left, center, left),
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

#pagebreak()

When you use the deduction theorem, introduce your assumption by labeling it "hyp." and discharge the assumption (turn it into an implication) by labeling it "X–Y, ded" where line X is where you introduced the assumption (the left hand side of the implication), and line Y is where you concluded the right-hand side of the implication. Drawing the vertical line is mandatory.

You may also use the following predicate logic equivalences:

#table(
  columns: (auto, auto, auto),
  stroke: 0.5pt,
  align: (left, center, left),
  [*Name*], [*Abbreviation*], [*Equivalence*],
  [DeMorgan's Law (1)], [dm], [$not forall x . alpha <=> exists x . not alpha$],
  [DeMorgan's Law (2)], [dm], [$not exists x . alpha <=> forall x . not alpha$],
)

And the following predicate logic inference rules. Remember that $alpha[a |-> b]$ means "replace all occurrences of $a$ in $alpha$ with $b$."

#table(
  columns: (25%, 10%, 20%, 45%),
  stroke: 0.5pt,
  align: (left, center, left, left),
  [*Name*], [*Abbr.*], [*Rule*], [*Rules for application*],
  [universal\ instantiation], [ui], [$forall x.alpha \ alpha[x |-> c]$], [$c$ can be a constant or a variable, but if it is a variable, it cannot be one that is re-mapped inside $alpha$],
  [existential\ generalization], [eg], [$alpha \ exists x.alpha[c |-> x]$], [$x$ cannot already appear inside $alpha$. It should be a "fresh" variable.],
  [existential\ instantiation], [ei], [$exists x.alpha \ alpha[x |-> c]$], [$c$ should be a fresh constant: it shouldn't be in any of the premises, and should not have appeared anywhere else in the proof.],
  [universal\ generalization], [ug], [$alpha \ forall x.alpha[c |-> x]$], [$c$ should not be constrained in the proof in any way—it should be possible for $c$ to be talking about any object in the domain.],
)

#pagebreak()

== Problem 1

Translate these English statements into logical formulas. One formula per sentence.

=== (a)
(1) All integers are neither even or odd. \
(2) For all integers, if it is even, it is a multiple of 2. \
(3) For all integers, if it is a multiple of 4, it cannot be odd. \
(4) For all integers, if it is a multiple of 12, it must also be a multiple of 3. \
(5) There exist some integers that are a multiple of 3 but is not odd.

Use these predicates (Please fill in the blanks): \
Odd(x): Number x is odd. \
Even(x): #rect(stroke: 1pt, inset: 3pt)[*Number x is even*] \
Divisible(a, b): #rect(stroke: 1pt, inset: 3pt)[*Number a is divisible by b*]

*Solutions:*
#set enum(numbering: "(1)")
#enum(
  rect(stroke: 1pt, inset: 3pt)[*$forall x (not "Even"(x) or not "Odd"(x))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x ("Even"(x) -> "Divisible"(x, 2))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x ("Divisible"(x, 4) -> not "Odd"(x))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x ("Divisible"(x, 12) -> "Divisible"(x, 3))$*],
  rect(stroke: 1pt, inset: 3pt)[*$exists x ("Divisible"(x, 3) and not "Odd"(x))$*]
)

#pagebreak()

=== (b)
(1) A positive integer is a prime if and only if there does not exist an integer that is its factor (i.e., it is divisible by this factor) beside 1 and itself. \
(2) A composite number is an integer that has at least one positive factor besides 1 and itself. \
(3) A composite number is an integer that has at least one factor that is between 1 and itself. \
(4) An integer greater than 1 is either a prime or a composite. \
(5) There exists a positive integer that is neither a prime nor a composite number.

Use these predicates (Please fill in the blanks): \
P(x): x is a prime number. \
C(x): x is a composite number. \
Div(a,b): #rect(stroke: 1pt, inset: 3pt)[*a is divisible by b (b is a factor of a)*]

*Solutions:*
#set enum(numbering: "(1)")
#enum(
  rect(stroke: 1pt, inset: 3pt)[*$forall x ((x > 0) -> (P(x) <-> not exists y ((y != 1 and y != x) and "Div"(x, y))))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x (C(x) <-> exists y (y > 0 and y != 1 and y != x and "Div"(x, y)))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x (C(x) <-> exists y (1 < y < x and "Div"(x, y)))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x ((x > 1) -> (P(x) or C(x)))$*],
  rect(stroke: 1pt, inset: 3pt)[*$exists x (x > 0 and not P(x) and not C(x))$*]
)

#pagebreak()

=== (c)
(1) There is a movie star who is richer than anyone else. \
(2) Anyone who is richer than other person pays more taxes than the other person does. \
(3) Therefore, there is a movie star who pays more taxes than anyone else.

Use these predicates (Please fill in): \
Movie(x): x is a movie star. \
R(x,y): #rect(stroke: 1pt, inset: 3pt)[*x is richer than y*] \
T(x,y): #rect(stroke: 1pt, inset: 3pt)[*x pays more taxes than y*]

(Careful: You need to use $not (x = y)$ to indicate the statements are applied to someone other than the person themself.)

*Solutions:*
#set enum(numbering: "(1)")
#enum(
  rect(stroke: 1pt, inset: 3pt)[*$exists x ("Movie"(x) and forall y (not (x = y) -> R(x, y)))$*],
  rect(stroke: 1pt, inset: 3pt)[*$forall x forall y ((not (x = y) and R(x, y)) -> T(x, y))$*],
  rect(stroke: 1pt, inset: 3pt)[*$exists x ("Movie"(x) and forall y (not (x = y) -> T(x, y)))$*]
)

=== (d) Prove the statement in (c).

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof:*
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$exists x ("Movie"(x) and forall y (not (x = y) -> R(x, y)))$], [Premise],
  [2.], [$forall x forall y ((not (x = y) and R(x, y)) -> T(x, y))$], [Premise],
  [3.], [$"Movie"(a) and forall y (not (a = y) -> R(a, y))$], [1, ei],
  [4.], [$"Movie"(a)$], [3, simpl],
  [5.], [$forall y (not (a = y) -> R(a, y))$], [3, simpl],
  [6.], [$forall y ((not (a = y) and R(a, y)) -> T(a, y))$], [2, ui],
  [7.], [│ $not (a = b)$], [hyp.],
  [8.], [│ $not (a = b) -> R(a, b)$], [5, ui],
  [9.], [│ $R(a, b)$], [7, 8, mp],
  [10.], [│ $not (a = b) and R(a, b)$], [7, 9, conj],
  [11.], [│ $(not (a = b) and R(a, b)) -> T(a, b)$], [6, ui],
  [12.], [│ $T(a, b)$], [10, 11, mp],
  [13.], [$not (a = b) -> T(a, b)$], [7-12, ded],
  [14.], [$forall y (not (a = y) -> T(a, y))$], [13, ug],
  [15.], [$"Movie"(a) and forall y (not (a = y) -> T(a, y))$], [4, 14, conj],
  [16.], [*$exists x ("Movie"(x) and forall y (not (x = y) -> T(x, y)))$*], [15, eg],
)
]

#pagebreak()

== Problem 2

Prove the statement using deduction. For full credit, draw the vertical lines correctly for deduction scoping.

=== (a) $A -> (B -> (C -> D)) tack.r C -> (A -> (B -> D))$

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof:*
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$A -> (B -> (C -> D))$], [Premise],
  [2.], [│ $C$], [hyp.],
  [3.], [│ │ $A$], [hyp.],
  [4.], [│ │ $B -> (C -> D)$], [1, 3, mp],
  [5.], [│ │ │ $B$], [hyp.],
  [6.], [│ │ │ $C -> D$], [4, 5, mp],
  [7.], [│ │ │ $D$], [2, 6, mp],
  [8.], [│ │ $B -> D$], [5-7, ded],
  [9.], [│ $A -> (B -> D)$], [3-8, ded],
  [10.], [*$C -> (A -> (B -> D))$*], [2-9, ded],
)
]

=== (b) $A -> (B -> (not C and not D)) tack.r D -> (A -> not B)$

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof:*
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$A -> (B -> (not C and not D))$], [Premise],
  [2.], [│ $D$], [hyp.],
  [3.], [│ │ $A$], [hyp.],
  [4.], [│ │ $B -> (not C and not D)$], [1, 3, mp],
  [5.], [│ │ $not B or (not C and not D)$], [4, impl],
  [6.], [│ │ $not B or not D$], [5, simpl (on disjunct)],
  [7.], [│ │ $not not D$], [2, dn],
  [8.], [│ │ $not B$], [6, 7, ds],
  [9.], [│ $A -> not B$], [3-8, ded],
  [10.], [*$D -> (A -> not B)$*], [2-9, ded],
)
]

#pagebreak()

== Problem 3

Prove the following statements using predicate logic.

=== (a) ${not exists x(M(x) and P(x)), forall x(S(x) -> M(x))} tack.r forall x(S(x) -> not P(x))$

(Hint: One of the "perfect" syllogism Aristotle has proposed)

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof:*
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$not exists x(M(x) and P(x))$], [Premise],
  [2.], [$forall x(S(x) -> M(x))$], [Premise],
  [3.], [$forall x not (M(x) and P(x))$], [1, dm],
  [4.], [$forall x (not M(x) or not P(x))$], [3, dm],
  [5.], [$forall x (M(x) -> not P(x))$], [4, impl],
  [6.], [$S(a) -> M(a)$], [2, ui],
  [7.], [$M(a) -> not P(a)$], [5, ui],
  [8.], [$S(a) -> not P(a)$], [6, 7, hs],
  [9.], [*$forall x(S(x) -> not P(x))$*], [8, ug],
)
]

#pagebreak()

=== (b) ${forall x(F(x) -> exists y(C(y) and O(x, y))), forall x(D(x) -> forall y(C(y) -> not O(x, y)))} tack.r forall x(F(x) -> not D(x))$

(Hint: You may use two deductions in the proof sequence. This formal logical argument can be interpreted as "Every farmer owns a cow. No dentist owns a cow. Therefore, no farmer is a dentist.")

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof:*
#table(
  columns: (auto, 1fr, auto),
  stroke: none,
  align: (left, left, left),
  [1.], [$forall x(F(x) -> exists y(C(y) and O(x, y)))$], [Premise],
  [2.], [$forall x(D(x) -> forall y(C(y) -> not O(x, y)))$], [Premise],
  [3.], [│ $F(a)$], [hyp.],
  [4.], [│ $F(a) -> exists y(C(y) and O(a, y))$], [1, ui],
  [5.], [│ $exists y(C(y) and O(a, y))$], [3, 4, mp],
  [6.], [│ $C(b) and O(a, b)$], [5, ei],
  [7.], [│ $C(b)$], [6, simpl],
  [8.], [│ $O(a, b)$], [6, simpl],
  [9.], [│ │ $D(a)$], [hyp.],
  [10.], [│ │ $D(a) -> forall y(C(y) -> not O(a, y))$], [2, ui],
  [11.], [│ │ $forall y(C(y) -> not O(a, y))$], [9, 10, mp],
  [12.], [│ │ $C(b) -> not O(a, b)$], [11, ui],
  [13.], [│ │ $not O(a, b)$], [7, 12, mp],
  [14.], [│ │ $O(a, b) and not O(a, b)$], [8, 13, conj],
  [15.], [│ │ $bot$], [14, contradiction],
  [16.], [│ $not D(a)$], [9-15, ded (by contradiction)],
  [17.], [$F(a) -> not D(a)$], [3-16, ded],
  [18.], [*$forall x(F(x) -> not D(x))$*], [17, ug],
)
]

#pagebreak()

== Problem 4

Prove the following claims by contradiction. You will not get credit if you prove using a proof style other than contradiction!

For full credit, clearly write down your definitions and predicates first.

=== (a) There is no smallest, positive, rational number.

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Definitions:*
- Let $bb(Q)^+$ denote the set of positive rational numbers
- A rational number can be expressed as $p/q$ where $p, q in bb(Z)$ and $q != 0$

*Proof by Contradiction:*

Assume for contradiction that there exists a smallest positive rational number $r$.

So we have: $r in bb(Q)^+$ and $forall y in bb(Q)^+ (r <= y)$

Consider the number $r/2$. Since $r$ is a positive rational number:
- $r > 0$
- $r = p/q$ for some integers $p > 0, q > 0$
- Therefore $r/2 = p/(2q)$ which is also a positive rational number

We observe:
- $r/2 > 0$ (since $r > 0$)
- $r/2 < r$ (since dividing by 2 reduces a positive number)
- $r/2 in bb(Q)^+$ (positive rationals are closed under division by positive integers)

But this contradicts our assumption that $r$ is the smallest positive rational number, since we found $r/2 in bb(Q)^+$ with $r/2 < r$.

Therefore, there is no smallest positive rational number. *Q.E.D.*
]

=== (b) Consider the roots of the quadratic polynomial $p x^2 + q x + r$, where $p, q$, and $r$ are all $> 0$. If $q > 2sqrt(p dot r)$, the roots of this polynomial cannot be complex.

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Hint: Let the root be $x = (a + b i)$ which leads to $p x^2 + q x + r = 0$*

*Proof by Contradiction:*

Assume for contradiction that when $p, q, r > 0$ and $q > 2sqrt(p r)$, the polynomial has complex roots.

Let one root be $x = a + b i$ where $b != 0$ (non-real).
Since coefficients are real, the other root must be the conjugate: $x = a - b i$

By Vieta's formulas:
- Sum of roots: $(a + b i) + (a - b i) = 2a = -q/p$
- Product of roots: $(a + b i)(a - b i) = a^2 + b^2 = r/p$

From the sum: $a = -q/(2p)$

Since $q > 0$ and $p > 0$: $a < 0$

From the product: $a^2 + b^2 = r/p$

Substituting $a = -q/(2p)$:
$q^2/(4p^2) + b^2 = r/p$

Therefore: $b^2 = r/p - q^2/(4p^2) = (4p r - q^2)/(4p^2)$

Since $b$ is real (part of a complex number), we need $b^2 >= 0$:
$(4p r - q^2)/(4p^2) >= 0$

This requires: $4p r - q^2 >= 0$, which means $q^2 <= 4p r$, or $q <= 2sqrt(p r)$

But this contradicts our given condition that $q > 2sqrt(p r)$.

Therefore, when $q > 2sqrt(p r)$, the roots cannot be complex. *Q.E.D.*
]
