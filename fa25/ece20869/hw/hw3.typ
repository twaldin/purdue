// hw3.typ
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
      #text(weight: "bold", size: 12pt)[Homework 3] \
      Due October 1st, 2025 \
      \
      #text(weight: "bold")[Please box your answer or make your answer bold]
    ],
    [
      Name: Timothy Waldin \
      \
      List anyone you have collaborated with: \
    ]
  )
]

#pagebreak()
== Problem 1

Use induction to prove:

=== (a) $sum_(i=0)^n i^2 = (n*(n+1)*(2n+1))/6$

(Hint: $sum_(i=0)^n i^2 = 0^2 + 1^2 + 2^3 + ... + n^2$)

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof by Induction:*

*Base case:* Let $n = 0$.

LHS: $sum_(i=0)^0 i^2 = 0^2 = 0$

RHS: $(0*(0+1)*(2*0+1))/6 = 0/6 = 0$

LHS = RHS, so the base case holds.

*Inductive hypothesis:* Assume that for some $k >= 0$, we have
$
sum_(i=0)^k i^2 = (k*(k+1)*(2k+1))/6
$

*Inductive step:* We need to prove that
$
sum_(i=0)^(k+1) i^2 = ((k+1)*(k+2)*(2(k+1)+1))/6 = ((k+1)*(k+2)*(2k+3))/6
$

Starting with the left-hand side:
$
sum_(i=0)^(k+1) i^2 &= sum_(i=0)^k i^2 + (k+1)^2 \
&= (k*(k+1)*(2k+1))/6 + (k+1)^2 quad &"(by IH)" \
&= (k*(k+1)*(2k+1))/6 + (6(k+1)^2)/6 \
&= (k*(k+1)*(2k+1) + 6(k+1)^2)/6 \
&= ((k+1)[k(2k+1) + 6(k+1)])/6 \
&= ((k+1)[2k^2 + k + 6k + 6])/6 \
&= ((k+1)(2k^2 + 7k + 6))/6 \
&= ((k+1)(k+2)(2k+3))/6
$

This completes the inductive step.

*Conclusion:* By mathematical induction, $sum_(i=0)^n i^2 = (n*(n+1)*(2n+1))/6$ for all $n >= 0$. *Q.E.D.*
]

#pagebreak()

=== (b) There exists a natural number K such that for every integer $n > k$, $1/n <= 1/100$

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Solution:*

We claim that *$K = 100$* is the natural number that satisfies the property.

*Proof:*

For any integer $n >= 100$, if we divide both sides by $n * 100$, we get:
$
n >= 100 => 1/100 >= 1/n => 1/n <= 1/100
$

Therefore, $K = 100$ satisfies the required property. *Q.E.D.*
]
#pagebreak()

== Problem 2

Find the smallest integer N and prove:
$
forall x, x >= N => 2^x > 100x^2
$

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Smallest Integer N:*

First, we check several values to find the minimum N where $2^x > 100x^2$:

- $x = 14$: $2^14 = 16384$, $100*14^2 = 19600$. False.
- $x = 15$: $2^15 = 32768$, $100*15^2 = 22500$. True
- $x = 16$: $2^16 = 65536$, $100*16^2 = 25600$. True

The smallest integer N is *$N = 15$*.

*Proof by Induction:*

*Base case:* $x = 15$

$2^15 = 32768$ and $100*15^2 = 22500$

Since $32768 > 22500$, the base case holds.

*Inductive hypothesis:* Assume that for some $k >= 15$, we have $2^k > 100k^2$.

*Inductive step:* We need to prove that $2^(k+1) > 100(k+1)^2$.

Starting with the left-hand side:
$
2^(k+1) = 2 * 2^k > 2 * 100k^2 = 200k^2 quad "(by IH)"
$

We need to show that $200k^2 > 100(k+1)^2 = 100(k^2 + 2k + 1) = 100k^2 + 200k + 100$.

$
200k^2 > 100k^2 + 200k + 100 \
100k^2 > 200k + 100 \
k^2 > 2k + 1 \
k^2 - 2k - 1 > 0
$

Using the quadratic formula, $k^2 - 2k - 1 = 0$ when $k = (2 plus.minus sqrt(4+4))/2 = 1 plus.minus sqrt(2)$.

So $k^2 - 2k - 1 > 0$ when $k > 1 + sqrt(2) approx 2.414$.

Since $k >= 15$, this inequality holds for the inductive step.

*Conclusion:* By mathematical induction, $forall x >= 15$, $2^x > 100x^2$. Therefore, *$N = 15$*. *Q.E.D.*
]

#pagebreak()

== Problem 3

=== (a) Write down the steps to move N=3 disks to C.

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Initial state:*
- A: - 3 - 2 - 1 -
- B: - - - - - - -
- C: - - - - - - -

*Step 1:* Move disk 1 from A to C
- A: - 3 - 2 - - -
- B: - - - - - - -
- C: - - - 1 - - -

*Step 2:* Move disk 2 from A to B
- A: - 3 - - - - -
- B: - - - 2 - - -
- C: - - - 1 - - -

*Step 3:* Move disk 1 from C to B
- A: - 3 - - - - -
- B: - - - 2 - 1 -
- C: - - - - - - -

*Step 4:* Move disk 3 from A to C
- A: - - - - - - -
- B: - - - 2 - 1 -
- C: - 3 - - - - -

*Step 5:* Move disk 1 from B to A
- A: - - - 1 - - -
- B: - - - 2 - - -
- C: - 3 - - - - -

*Step 6:* Move disk 2 from B to C
- A: - - - 1 - - -
- B: - - - - - - -
- C: - 3 - 2 - - -

*Step 7:* Move disk 1 from A to C
- A: - - - - - - -
- B: - - - - - - -
- C: - 3 - 2 - 1 -

*Final state reached in 7 steps.*
]

#pagebreak()

=== (b) Prove using induction: for any positive number N, there exists a way to
=== move N disks from pillar A to C according to the hanoi tower's game rules.

#rect(stroke: 1pt, inset: 5pt, width: 100%)[
*Proof by Induction:*

*Base case:* $N = 1$

For a single disk on pillar A, we simply move it directly to pillar C. This is
a valid move and completes the task in 1 step. The base case holds.

*Inductive hypothesis:* Assume that for some $k >= 1$, we can move $k$ disks
from any pillar to any other pillar following the Hanoi Tower rules.

*Inductive step:* We need to prove that we can move $k+1$ disks from pillar A to pillar C.

*Strategy for $k+1$ disks:*

Consider the configuration with $k+1$ disks on pillar A (disk $k+1$ is the
largest at the bottom, and disks $k, k-1, ..., 1$ are stacked above it).

1. *Step 1:* Use the inductive hypothesis to move the top $k$ disks from pillar
   A to pillar B (using pillar C as auxiliary). By the IH, this is possible.
   - Pillar A has only disk $k+1$ (the largest)
   - Pillar B has disks $k, k-1, ..., 1$ (properly stacked)
   - Pillar C is empty

2. *Step 2:* Move disk $k+1$ from pillar A to pillar C. This is valid because
   pillar C is empty and we're only moving the topmost (and only) disk from A.
   - Pillar A is empty
   - Pillar B has disks $k, k-1, ..., 1$
   - Pillar C has only disk $k+1$

3. *Step 3:* Use the inductive hypothesis to move the $k$ disks from pillar B
   to pillar C (using pillar A as auxiliary). By the IH, this is possible.
   Since disk $k+1$ is the largest disk, all $k$ smaller disks can be placed on
   top of it, maintaining the size ordering rule.
   - Pillar A is empty
   - Pillar B is empty
   - Pillar C has all $k+1$ disks properly stacked

This completes the inductive step, showing that if we can move $k$ disks, we can also move $k+1$ disks.

*Conclusion:* By mathematical induction, for any positive integer $N$, there
exists a valid sequence of moves to transfer $N$ disks from pillar A to pillar
C following the Hanoi Tower rules. *Q.E.D.*
]
