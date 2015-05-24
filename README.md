3Alchemy (Tri/FreeAlchemy)
==========================

Recording of the freestyle improvised interactive live mob coding Elixir sessions
done at [TRUG (TriCityRubyUsersGroup)](http://trug.pl) by Szymon Jeż.

* **3Alchemy** stands for free / freestyle alchemy.
* **Alchemy** stands for programming using [Elixir](http://elixir-lang.org).

Goals:

* Learning,
* Teaching,
* Free creativity.

## Session Log

### Session 0 (2015-04-15)

* duration: 1 h
* (not recorded)

Was showing some basic semantics and syntax.

links:

* ["Learn X in Y minutes Where X=elixir"](http://learnxinyminutes.com/docs/elixir/)

### Session 1 (2015-05-20)

* duration: 2.5 h
* command line history: `/priv/history/session1.history`
* code: checkout the first commit (tag: session1)

Has shown:
* how to use `mix` and create a new project using `mix new`,
* how to use `tmuxinator` for `tmux`,
* IEx,
* function, module definition, pattern matching, IO output, etc.
* basic concurrency in Elixir/Erlang (`spawn`, `send`, `receive`),
* processes that do tasks, processes that hold state, server processes,
* `:observer.start`.

The end result was a MessagePingPongRing that allows to create a ring of processes that
exchange messages in turn to each other.
New processes and messages can be added to the Ring at any time.

Sample output:

```
#PID<0.102.0>: #PID<0.100.0> I like
#PID<0.100.0>: #PID<0.101.0> Ruby
#PID<0.101.0>: #PID<0.102.0> Sopot
#PID<0.102.0>: #PID<0.100.0> Gdańsk
#PID<0.100.0>: #PID<0.101.0> I love
#PID<0.101.0>: #PID<0.102.0> Elixr
#PID<0.102.0>: #PID<0.100.0> I don't care
#PID<0.100.0>: #PID<0.101.0> Go
#PID<0.101.0>: #PID<0.102.0> I dislike
#PID<0.102.0>: #PID<0.100.0> Node.js
#PID<0.100.0>: #PID<0.101.0> PHP
```

### Session 2 (2015-06-17)

Agenda:

* Distribution (Nodes)
* Intro to OTP
* GenServer

...

## Acknowledgements

All TRUG organizers and participants
(especially those who stay till the end of the sessions and get highly involved).
