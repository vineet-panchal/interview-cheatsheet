# Deductive Databases

- A deductive database is a database system that uses logic programming to infer new information from existing data. 
- It combines the capabilities of a traditional database with the reasoning power of logic programming languages like Prolog.

## Example: Deductive Airline Reservation System
```prolog
flight(ac103, boeing376).
% there is a daily flight AC103 on plane boeing376

departure(ac103, toronto, 635).
% flight AC103 departs from Toronto at 6:35am

arrival(ac103, montreal, 735).
% flight AC103 arrives in Montreal at 7:35am

reserved(mary, ac103, 20, 9, 2022).
% mary is booked on flight AC103 on September 20, 2022
```

### Simplifying Assumptions
1. All flights have same daily schedule, 7 days a week.
2. No overnight flights
  - departure time shoudl be after arrival time
3. times all specified in the same time zone

### Find 'Bad' Flights
```prolog
improperFlightPlane(P, C, ID1, ID2) :-
    flight(ID1, P),
    flight(ID2, P),
    not ID1 = ID2,
    arrival(ID1, C, T1),
    departure(ID2, C, T2),
    T1 > T2

% improperFlightPlane(P, C, ID1, ID2) 
% is true if plane P has two flights ID1 and ID2 that both stop in city C
% and the arrival time of flight ID1 is later than the departure time of flight ID2
% (i.e., the plane cannot make it in time)
```

***Updated KB***:
```prolog
flight(Id, Plane).
departure(Id, Loc, Time).
arrival(Id, Loc, Time).
reserved(Name, Id, D, M, Y).
improperFlightPlane(P, C, ID1, ID2).
```

### Find Connections
```prolog
possibleConnecting(ID1, ID2, C) :- 
  flight(ID1, P1),
  flight(ID2, P2),
  arrival(ID1, C, T1),
  departure(ID2, C, T2),
  T2 > T1,
  timeDiff(T1, T2, D),
  D >= 50.

% helper method to calculate time difference
timeDiff(T1, T2, D) :- 
  H1 is T1 // 100,
  M1 is T1 mod 100,
  H2 is T2 // 100,
  M2 is T2 mod 100,
  X1 is 60 * H1 + M1,
  X2 is 60 * H2 + M2,
  D is X2 - X1.

% possibleConnecting(ID1, ID2, C)
% is true if there is a possible connection between flight ID1 and flight ID2 in city C
% such that the arrival time of flight ID1 is at least 30 minutes before the departure
```

***Updated KB***:
```prolog
flight(Id, Plane).
departure(Id, Loc, Time).
arrival(Id, Loc, Time).
reserved(Name, Id, D, M, Y).
improperFlightPlane(P, C, ID1, ID2).
possibleConnecting(ID1, ID2, C).
timeDiff(T1, T2, D).
```

### Conflicting Reservations
```prolog
badReservations(N, ID1, ID2) :- 
  reserved(N, ID1, D, M, Y),
  reserved(N, ID2, D, M, Y),
  not ID1 = ID2,
  departure(TD1, CD1, TD1),
  arrival(ID1, CA1, TA1),
  departure(ID2, CD2, TD2),
  TD1 =< TD2,
  TD2 =< TA1.

% badReservations(N, ID1, ID2)
% is true if person N has two reservations ID1 and ID2 on the same day
% such that the departure time of flight ID2 is between the departure and arrival times of flight ID1
```

***Updated KB***:
```prolog
flight(Id, Plane).
departure(Id, Loc, Time).
arrival(Id, Loc, Time).
reserved(Name, Id, D, M, Y).
improperFlightPlane(P, C, ID1, ID2).
possibleConnecting(ID1, ID2, C).
timeDiff(T1, T2, D).
badReservations(N, ID1, ID2).
```

### Use Exactly Two Planes
```prolog
twoPlaneConnection(P1, P2, L1, CL, L2) :-
  flight(ID1, P1),
  flight(ID2, P2),
  departure(ID2, L1, TD1),
  arrival(ID2, L2, TA2),
  arrival(ID1, CL, TA1),
  departure(ID2, CL, TD2),
  TD2 > TA1,
  timeDiff(TA1, TD2, D),
  D >= 50.

twoPlaneConnection(P1, P2, C1, CL, L2) :- 
  possibleConnecting(ID1, ID2, CL),
  departure(ID1, L1, T1),
  arrival(ID2, L2, T2).

% twoPlaneConnection(P1, P2, L1, CL, L2)
% is true if there is a connection between location L1 and location L2
% with a layover in city CL using exactly two planes P1 and P2
```
