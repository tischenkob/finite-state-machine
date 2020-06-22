# finite-state-machine
Finite state machine (State&amp;Command patterns implementation) in GDScript with separate classes representing actions

Includes three abstract classes: StateMachine, State, Action

Adding a new character mechanic is as simple as:
1) dropping an `Action` child-node in a `State` node in a `StateMachine` node
2) overriding `_update(delta)` or `handle_input(event)`

Character
--StateMachine
----State1
------Action1
------Action2
----State2
------Action1
------Action3
