# Intro To Elixir
###### - functional programming language, motly immutable, rich support for concurrency
###### - everything is an expression, everything evaluates to something
###### - Elixir compiles into Erlang bytecode, Erlang functions can be called from Elixir
###### - emphasizes recrsion and higher order functions, as sopposed to side-effect based looping
###### - Elixir code runs inside lightweight threads of execution
######    - isolated, exchange information via message passing
###### - not uncommon to have hundreds of thousands of processes running concurrently in some virtual machine

## Elixir Shell (iex)
```
/> iex
Interactive Elixir (latest) - press Ctrl+C to exit (type h() ENTE R for help)
iex(1)> 1 + 2
3
iex(2)> IO.puts "Hello World"
Hello World
:ok
```
###### - IO.puts prints to stdout (shell window)
###### - when executing in the shell, return values get echoed
###### - in this case, IO.puts returns the atom :ok

## Elixir Scripts
###### - elixir scripts are used to run your functions or code in Elixir files
###### Elixir File extension: .ex, Elixir Script extension: .exs
##### elixirc .ex
###### - to compile a Elixir file
##### elixir .exs
###### - to run an Elixir script
```
# hello.exs
IO.puts "Hello World"
```
```
/> elixir hello.exs
Hello World
```

## Elixir Syntax
##### Basic Literals
###### - everything in Elixir is an expression, even literals
###### - evaluating a literal simply results in that value
```
iex(1)> 1 ==> 1
iex(2)> "hello" ==> "hello"
iex(3)> true ==> true
iex(4)> 0b10101 ==> 21
iex(5)> 0x1A ==> 26
```

##### Arithemetic
```
iex(1)> 10 / 2 ==> 5.0 # \ operator returns floating point in Elixir
```

##### Math Functions
```
iex(1)> :math.sin(1.0) ==> 0.841470984 # inherits this from Erlang
iex(2)> round 3.58 ==> 4
iex(3)> trunc 3.58 ==> 3
iex(4)> ceil 3.58 ==> 4
iex(5)> floor 3.58 ==> 3
iex(11)> div 10, 3 ==> 3
iex(12)> rem 10, 3 ==> 1
```

##### Testing Type
###### - Elixir is dynamically typed
###### - type errors occur at runtime, not compile time
###### - attempting some operation on incompatible types results in a runtime error
```
iex(1)> is_integer 8 ==> true
iex(2)> is_float 8 ==> false
iex(3)> is_number 0b11011 ==> true
iex(4)> is_binary "cat" ==> true
iex(5)> is_boolean true ==> true
iex(6)> is_atom :hello ==> true
iex(7)> is_nil nil ==> true
iex(8)> is_list [1, 2, 3] ==> true
iex(9)> is_map %{a: 1, b: 2} ==> true
iex(10)> is_tuple {1, 2, 3} ==> true
```

##### Boolean Expressions
###### &&, ||, ! ==> Symbolic/Relaxed Logical Operators, works for all types, use "truthiness"
###### and, or, not ==> Strict Logical Operators, requires Boolean operand on the left side of the operator
```
iex(1)> "gh" && false ==> false
iex(2)> "gh" || false ==> "gh"
iex(3)> true or false ==> false
iex(4)> true or "gh" ==> true
iex(5)> true and "gh" ==> "gh"
iex(6)> 7 or 5 ==> BadBooleanError
```

##### Atoms
###### - a constant whose name is its value, boolean literals are atoms
```
iex> :hello ==> :hello
iex> true ==> true
iex> :hello == :world ==> false
iex> :true == true ==> true
iex> is_boolean(:false) ==> true
```
##### Strings
```
iex> "Hello, \nWorld" ==> "Hello, \nWorld"
iex> IO.puts "Hello\nWorld"
Hello
World
:ok
iex> byte_size "Hello" ==> 5
iex> String.length "Hello" ==> 5
```

##### Interpolation (#{})
```
iex> name = "Vineet"
iex> "Hello, #{name}!"
"Hello, Vineet!"
```
##### Concatenation (<>)
```
iex> name = "Vineet"
iex> "Hello, " <> name
"Hello, Vineet"
```

##### Function Arity
###### arity - the number of arguments a function takes
###### Elixir functions are described in terms of their name and arity with the notation: name/arity
###### Ex: round/1, trunc/1, is_boolean/1, rem/2, div/2

## Collections
### Lists
###### - use [] to define a list of values, values can be anything heterogenous
###### - lists in Elixir are implemented as Linked Lists, with a head and tail
###### hd - fucntion to return the head of the list, the first element of the list
###### tl - function to return the tail of the list, or the rest of the elements
```
iex> [1, 2, 3] ==> [1, 2, 3]
iex> length [1, 2, 3] ==> 3
iex> list = [1, 3.14, true, "Hello", :World] ==> [1, 3.14, true, "Hello", :World]
iex> hd list ==> 1
iex> tl list ==> [3.14, true, "Hello", :World]
iex> hd [1] ==> 1
iex> tl [1] ==> []
iex> list -- [true, "Hello"] ==> [1, 3.14, :World]
iex> list ++ [6] ==> [1, 3.14, :World, 6]
iex> list -- [3.14, 8] ==> [1, :World, 6]
```
#### Printing Lists
###### - IO.puts can't handle arbitrary lists
###### - IO.puts wants a list containing things it can convert into Unicode
##### IO.inspect
###### - prints and returns the list, it still prints charlists
```
iex> x = [1, 2.0, "Hello", :world] ==> [1, 2.0, "Hello", :world]
iex> IO.puts x ==> ArgumentError
iex> IO.inspect x ==> [1, 2.0, "Hello", :world] # prints list
                  ==> [1, 2.0, "World", :world] # returns list
iex> x = [104, 101, 108, 108, 111] ==> 'hello'
iex> IO.inspect x ==> 'hello'
                  ==> 'hello'
iex> IO.inspect (x, charlists: :as_lists) ==> [104, 101, 108, 108, 111]
iex>                                      ==> 'hello'
```

### Tuples
###### - a sequence of values whose elements are stored contiguously in memory
###### - lists and tuples are immutable, operations result in new lists/tuples
###### - bind a new label (or re-bind tuple) to save the result
```
iex> tup = {1, "2", :three} ==> {1, "2", :three}
iex> elem tup, 0 ==> 1
iex> elem tup, 1 ==> "2"
iex> elem tup, 3 ==> ArgumentError
iex> put_elem(tup, 1, 55) ==> {1, 55, :three} # to change an element
iex> tup ==> {1, "2", :three} # original tuple hasn't change, have to bind it to a label to save it
iex> tup = put_elem(tuple, 1, 55)
iex> tup = {1, 55, :three}
```

### Variables
###### - variables in Elixir are immutable
###### Ex: x = 1  --> the value 1 is created in memory, x is a label for the value 1
######     x = 2  --> we are not changing the value 1 in memory
######            --> creating the value at a different place in memory
######            --> and re-binding the label x to the new value 2
######     | 1 | <-- x --> | 2 |
###### - rebinding creates a new name
###### - we can keep using x but, Elixir replaces it with x' under the hood
###### | 1 | <-- x, | 2 | <-- x', | 3 | <-- x'', | 4 | <-- x''', | 5 | <-- x''''

### Pattern Matching
##### = 
###### - this is not the assignment operator, but the math operator
###### Ex: x = 1  --> when a name is on the left-hadn side of the match operator, we bind or re-bind the name
###### Ex: y = 2 ==> 2
######     2 = y ==> 2 // valid expression
######     3 = y ==> MatchError
######     3 = x + 1 ==> 3
##### Names On The Left?
###### - bind or rebind the value on the right
##### Names On The Right?
###### - pattern match with value on the left

#### Matching Lists
##### | (pipe)
###### - seperates list into head and tail, typically used between brackets as a cons operator
###### [head | tail] --> where head is a single element and the tail is the remaining of a list
###### - it is also used to update maps and structs, via the %{map | key: value}
##### _ (underscore)
###### - can never be read frin, value discarded
```
iex> list = [1, 2, 3, 4, 5] ==> [1, 2, 3, 4, 5]
iex> [1 | tail] = list ==> [1, 2, 3, 4, 5]
iex> tail ==> [2, 3, 4, 5]
iex> [2 | tail] = list ==> MatchError
iex> [2 | _] = tail ==> [2, 3, 4, 5]
iex> [2, 3 | test] = tail ==> [2, 3, 4, 5]
iex> test ==> [4, 5]
```

#### Matching Tuples
###### - when matching tuples, the comma is used as a seperator
###### - tuple aren't linked lists, they don't deal with head and tail
###### - comma for tuples, | for lists
```
iex> tup = {:ok, "Hello"} ==> {:ok, "Hello"}
iex> {:ok, value} = tup ==> {:ok, "Hello"}
iex> value ==> "Hello"
iex> {a, b, c} = {:hello, "World", 42} = {:hello, "World", 42}
iex> {a, b} = {:hello, "World", 42} ==> MatchError
```
###### - this is called destructuring. a, b, c, are now bound to individual elements of the tuple

##### Pin Operator (^)
###### - to hold a variable's binding
```
iex> x - 3 ==> 3
iex> ^x - 3 ==> 3
iex> ^x = 2 ==> MatchError
iex> y = 2 ==> 2
iex> [^y, z] = [1, 3] ==> MatchError
iex> z ==> CompileError
iex> [^y, z] = [2, 3] ==> [2, 3]
iex> z ==> 3
```

## Functions
##### Higher Order Functions
###### - can accept a first class function as arguments, and can return a first class function
##### First Class Function
###### - can be passed to higher order functions as arguments, and can be returned from higher order functions
##### Named Functions
###### - named within a module, not first class, cannot be passed as an argument, cannot be referenced
###### - named functions of the same name, can have different arity
##### Modules
###### - modules can contain multiple functions, can be compiled independently, making functions avaliable for later use
```
# HelloWorld.ex
defmodule HelloWorld do
  def hello don
    IO.puts "Hello World"
  end
end

/> elixirc HelloWorld.ex   --> compiled into beam file, can now use in scripts

# Hello.exs
HelloWorld.hello
HelloWorld.hello
HelloWorld.hello

/> elixir Hello.exs
Hello World
Hello World
Hello World

/> iex
iex> HelloWorld.hello
Hello World
:ok
```
##### Return Values In Elixir Functions
###### - the result of the final expression in the funciton is returned
```
defmodule Silly do
  def print() do # function print has 4 expressions, the last expression is returned
    "Hello"
    ","
    " "
    "World"
  end
end

IO.prints Silly.print() --> World
```
##### Private Functions
###### - can only be invoked inside the module it was initialzed in
##### \\ - default operator
```
# Greeter.ex
defmodule Greeter do
  defp hello(), do: "Hello " # can only be invoked inside Greeter module
  def greet(name \\ "Vineet") do # if no argument is powerful, name = "Bill"
    hello() <> name
  end
end

# hello.exs
IO.puts Greeter.greet("Bill") 
IO.puts Greeter.greet()
IO.puts Greeter.hello

/> elixirc Greeter.ex
/> elixir hello.exs
Hello Bill
Hello Vineet
UndefinedFunctionError
```
##### Overloading
```
# Hello.ex
defmodule Hello do
  def hello(), do: "Hello"
  def hello(name), do: "Hello " <> name
  def hello(n1, n2) do
    "Hello " <> n1 <> " " <> n2
  end
end

# Hello.exs
IO.puts Hello.hello()
IO.puts Hello.hello("Vineet")
IO.puts Hello.hello("Vineet", "Bill")

/> elixirc Hello.ex
/> elixir Hello.exs
Hello
Hello Vineet
Hello Vineet Bill
```
##### Anonymous Functions
###### - first class functions, can be created live, inline
###### - delimited by fn and end keywords, invoke the dot operator
```
iex> add = fn a, b -> a + b end
iex> add2 = &(&1 + &2)
iex> add.(1, 2) ==> 3
iex> add.(8, 9) ==> 17
iex> add2.(1, 2) ==> 3
iex> add2.(8, 9) ==> 17
```
##### Pattern Matching
```
# script.exs
handler = fn
  {:ok, msg} -> IO.puts msg
  {:error} -> IO.puts "Error"
  {_} -> IO.puts "Serious Error"
end
handler.({:ok, "Hello"})
handler.({:error})
handler.({:uhoh})

/> elixir script.exs
Hello
Error
Serious Error
```

## Recursion
```
defmodule Length do
  def of([]), do: 0
  def of([_ | t]), do: 1 + of(t)
end
```
```
# script.exs
defmodule UserMath do
  def fib(0), do: 0
  def fib(1), do: 1
  def fib(n), do: fib(n - 1) + fib(n - 2)

  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)
end
IO.puts UserMath.fib(15)
IO.puts UserMath.fact(6)

/> elixir script.exs
610
720
```

## Tail Recursion
```
defmodule UserMath do
  def fac(num), do: fac(num, 1)
  def fac(0, prod), do: prod
  def fac(num, prod), do: fac(num - 1, num * prod)
end