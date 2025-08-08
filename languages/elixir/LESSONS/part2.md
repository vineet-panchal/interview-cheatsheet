# Elixir

## Enum
###### - a set of algorithms for operators on lists
##### Enum.all?
###### - entire collection must evaluate to true for a given condition
```
# script.exs
vals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
IO.puts Enum.all?(vals, fn(n) -> n < 5 end)
IO.puts Enum.all?(vals, fn(n) -> n >= 0 end)
IO.puts Enum.all?(vals, fn(n) -> n < 18 end)

/> elixir script.exs
false
true
true
```
```
defmodule MyEnum do
  def all(lists, f), do all(list, f, true) end
  def all([], _, res), do res end
  def all([h|t], f, res), do all(t, f, f.(h) and res) end
  def all(_, _, false), do false end
end
```

##### Enum.any?
###### - any value in collection must evaluate to true for a given condition
```
# script.exs
vals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
IO.puts Enum.any?(vals, fn(n) -> n == 2.2 end)
IO.puts Enum.any?(vals, fn(n) -> n > 5 end)
IO.puts Enum.any?(vals, fn(n) -> n < 18 end)

/> elixir script.exs
false
true
true
```
```
defmodule MyEnum do
  def any(lists, f), do all(list, f, false) end
  def any(_, _, true), do true end
  def any([], _, res), do res end
  def all([h|t], f, res), do any(t, f, f.(h) or res) end
end
```

##### Enum.map
###### - apply a function on every element
```
# script.exs
vals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
IO.puts Enum.map(vals, fn(n) -> n + 1 end)
IO.puts Enum.map(vals, fn(n) -> n * 2 end)
IO.puts Enum.map(vals, fn(n) -> n * n end)

/> elixir script.exs
[1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
[0, 2, 4, 6, 8, 10, 12, 14, 16, 18]
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
```
```
defmodule MyEnum do
  def map(list, f), do map(list, f, []) end
  def map([], _, res), do res end
  def map([h|t], f, res), do map(t, f, res ++ [f.(h)]) end
end
```

##### Enum.reduce
###### - distil collection to single value based on some function
```
# script.exs
vals = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
IO.puts Enum.reduce(vals, fn(n, acc) -> n + acc end)
IO.puts Enum.reduce(vals, fn(n) -> n * acc end)
IO.puts Enum.reduce(vals, fn(n) -> n - acc end)
IO.puts Enum.reduce(vals, fn(n) -> acc - n end)

/> elixir script.exs
45
0
-5
-45
```
```
defmodule MyEnum do
  def reduce(list, f), do reduce((tl list), f, hd list) end
  def reduce([], _, res), do res end
  def reduce([h|t], f, res), do reduce(t, f, f.(h, res)) end
end
```

## Streams
###### - like Enum, but lazy, they share many functions
###### - think of stream as a recipe for producing the transformed list
###### - a new list that is generated for every Enum call, but there is one new generated for every recipe
##### |> (pipe-arrow)
###### - use pipe-arrows to connect transformations
```
list = [1, 2, 3, 4, 5]
r1 = Stream.map(list, &(&1 + 1)) |> 
     Stream.map(&(& * 3)) |>
     Enum.map(&(&1 / 2))
IO.inspect r1 

/> elixir script.exs
[3.0, 4.5, 6.0, 7.5, 9.0]
```
###### - you have to use a Enum call for the last transformation for a new list
###### - you can use Enum.to_list, to use all stream transformations
```
list = [1, 2, 3, 4, 5]
r1 = Stream.map(list, &(&1 + 1)) |>
     Stream.map(&(& * 3)) |>
     Stream.map(&(&1 / 2))
IO.inspect(Enum.to_list r1)

/> elixir script.exs
[3.0, 4.5, 6.0, 7.5, 9.0]
```

## Control Structures
### if/else
###### - doesn't support pattern matching
```
name = 42
if String.valid?(name) do
  IO.puts "Hi, #{name}"
else
  IO.puts "That's not a name"
end

# if String.valid?(name), do: "Hi, #{name}", else: "World"
# if (String.valid?(name), do: "Hi, #{name}", else: "World")
# if (String.valid?(name), [{do: "Hi, #{name}"}, {else: "World"}])

/> elixir script.exs
That's not a name
```
### cond
###### - Elixir can only compare two clauses with if/else. for more use cond, doesn't support pattern matching
```
temp = 42
cond do
  temp <= 0 -> "Solid"
  temp < 100 -> "Liquid"
  true -> "Gas" # always have a catch/default call
end
```

### case
###### - case condition can pattern match
```
tup = {:ok, "Hello World"}
case tup do
  {:ok, result} -> result
  {:error} -> "Uh oh!"
  _ -> "Catch all"  # without catch all, we'd get an error if no match was found
end
```
```
# test.exs
pi = 3.14
IO.puts pi
case "apple pie" do
  pi -> IO.puts "Tasty " <> pi
  _ -> IO.puts "#{pi} is not tasty"
end

/> elixir test.exs
3.14
Tasty apple pie
```

