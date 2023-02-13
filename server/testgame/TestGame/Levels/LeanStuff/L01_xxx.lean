import TestGame.Metadata

import Mathlib

set_option tactic.hygienic false

Game "TestGame"
World "LeanStuff"
Level 1

Title ""

Introduction
"
Dieses Kapitel führt ein paar Lean-spezifische Sachen ein, die du wissen solltest.

Mathematisch haben diese Sachen keinen Inhalt, aber es ist wichtig, dass du etwas
verstehst wie Lean manche Sachen macht.

Als erstes geht es um implizite und explizite Argumente von Lemmas. **Explizite Argumente**
schreibt man mit runden Klammern `()`, **impliziete Argumente** mit geschweiften `{}`.

Als implizit werden alle Argumente markiert, die Lean selbständig aus dem Kontext
erschliessen und einfüllen kann.

Als Beispiel hier zweimal das gleiche Lemma, einmal ohne impliziten Argumenten und einmal mit
```
lemma not_or_of_imp' (A B : Prop) (h : A → B) : ¬A ∨ B := sorry

lemma not_or_of_imp {A B : Prop} (h : A → B) : ¬A ∨ B := sorry
```

Hat man nun `g : C → D` dann braucht man diese Lemmas mit
`have := not_or_of_imp g` oder `have := not_or_of_imp' C D g`.

Wie man sieht erschliesst Lean die impliziten Argumente automatisch und es wäre deshalb
unnötig, diese jedes Mal explizit angeben zu müssen.

TODO
(Trick mit `@not_or_of_imp` kann man sagen, dass man **alle** Argumente angeben möchte und mir
`not_or_of_imp g (B := D)` könnte man ein spezifisches implizites Argument spezifizieren.
Wenn man diese Tricks braucht, heisst das aber meistens, das etwas nicht optimal definiert
ist.)

TODO
Zudem gibt es noch Argumente in eckigen Klammern `[]`. Dies sind auch implizite
Argumente, die aber von der **Instance Resolution** gefüllt werden sollen. Dies
wird später kommen, aber ein typisches Beispiel ist `(S : Type _) [ring S]` was Lean
sagt, es soll suchen gehen, ob es weiss, dass `S` ein Ring ist.
"

open Set

Statement
    "TODO" : True := by
  trivial

NewTactics rw

#check not_not
#check not_or_of_imp
