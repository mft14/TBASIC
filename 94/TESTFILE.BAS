10 cls
20 ?:?:?"   Testfile um Laufwerke zu wechseln"
30 ?:?"   Geben Sie den Laufwerksbuchstaben ein : "
40 input"   ";f$
45 ff$=f$+":"
50 shell ff$
60 shell "dir/p"
65 input"   Return drcken!";l$
70 cls:?:?"   Und jetzt wohin zurck ?"
80 input"  "g$
85 gg$=g$+":"
90 shell gg$
100 shell "dir/p"
110 input"   Return drcken !";l$
120 cls:end
