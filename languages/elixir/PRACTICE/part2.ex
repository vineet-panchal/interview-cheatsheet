# Five functions are described below. You should use tail recursion.

# 1) catNestedStrings/1 – This function accepts a list that can contain values of any
# type. You should return the concatenation of all the strings in the list. This question is
# the same as the previous lab, but this time there can be nested lists. For example, if the
# input is: [5, 3, 7, “cat”, 9, [“dog”, [“horse”, -5]], “mouse”], you should still return
# “catdoghorsemouse”

# 2) filterNestedStrings/1 – This function accepts a list that can contain values of
# any type. Build and return a new list with all the strings removed. This question is the
# same as the previous lab, but this time there can be nested lists. For example, if the
# input is: [ 5, 3, 7, “cat”, 9, [ “dog”, [ “horse”, -5 ] ], “mouse” ], you should return
# [ 5, 3, 7, 9 [ [ -5 ] ] ]

# 3) tailFib/1 – This function accepts an integer argument, n, and returns the nth
# Fibonacci number. Assume the first two Fibonacci numbers are 1 and 1. That is,
# tailFib(1) == 1, tailFib(2) == 1. There is no tailFib(0). Your tail-recursive implementation
# must avoid the double recursive call. No O(2n)!

# 4) giveChange/2 – This function accepts an amount of money, and a list of coin values
# (in descending order). The function should return a list containing the minimum number
# of coins necessary to represent the money amount. The returned list should be in
# descending order. If it is not possible to make change for the amount with the provided
# list of coins, you should return the :error atom. Several examples are below.

# amount:   coins:                expected result:
# 64        [50, 25, 10, 5, 1]    [50, 10, 1, 1, 1, 1]
# 100       [42, 17, 11, 6, 1]    [42, 42, 11, 1, 1, 1, 1, 1]
# 64        [50, 25, 10, 5]       :error

# You may assume the coin values are provided such that the greedy solution will always
# be correct. Subtract the largest coin possible at each step.

# 5) reduce/3 – Consider MyEnum.reduce. You will add an implementation that handles the optional 3rd
# argument to initialize acc.

# For example – the following two examples, exactly as written, should work correctly:
# Lab4.reduce([1, 2, 3], fn(x, acc) -> x+acc end)
# Lab4.reduce([1, 2, 3], 10, fn(x, acc) -> x+acc end)

# You may use helper functions if you wish, so long as the user can invoke your function
# from the outside world as seen above.

defmodule part2 do
  def catNestedStrings(items) do
    catNestedStrings(items, "")
  end

  def catNestedStrings([], acc) do
    acc
  end

  def catNestedStrings([h | t], acc) do
    cond do 
      is_list(h) -> catNestedStrings(h, acc)
      is_binary(h) -> catNestedStrings(t, acc <> h)
      true -> catNestedStrings(t, acc)
    end
  end

  # alternate solution for catNestedStrings
    def catNestedStrings(items) do
    catNestedStrings(items, "")
  end

  def catNestedStrings([], acc) do
    acc
  end

  def catNestedStrings([head | tail], acc) when is_list(head) do
    catNestedStrings(head ++ tail, acc)
  end

  def catNestedStrings([head | tail], acc) when isbinary(head) do
    catNestedStrings(tail, acc <> head)
  end

  def catNestedStrings([ | tail], acc) do
    catNestedStrings(tail, acc)
  end



  def filterNestedStrings(items) do
    filterNestedStrings(items, [])
  end

  def filterNestedStrings([], acc) do
    Enum.reverse(acc)
  end

  def filterNestedStrings([head | tail], acc) do
    case head do
      head when is_binary(head) -> filterNestedStrings(tail, acc)
      head when is_list(head) -> filterNestedStrings(tail, [filterNestedStrings(head) | acc])
      _ -> filterNestedStrings(tail, [head | acc])
    end
  end


  
  def tailFib(n) when n == 1 or n == 2 do
    1
  end
  
  def tailFib(n) do
    tailFib(n, 1, 1)
  end

  def tailFib(1, a, _b) do
    a
  end

  def tailFib(2, _a, b) do
    b
  end

  def tailFib(n, a, b) do
    tailFib(n-1, b, a + b)
  end



  def giveChange(n, coins) do 
    giveChange(n, coins, [])
  end

  def giveChange(0, _coins, acc) do
    Enum.reverse(acc)
  end

  def giveChange(_amount, [], _acc) do
    :error
  end

  def giveChange(amount, [coin | rest], acc) do
    coinAmount = div(amount, coin)
    if (coinAmount > 0) do
        giveChange(amount - coinAmount * coin, rest, List.duplicate(coin, coinAmount) ++ acc)
      else
        giveChange(amount, rest, acc)
    end
  end



  def reduce(items, fun) do
    reduce(items, nil, fun)
  end

  def reduce([], acc, _fun) do
    acc
  end

  def reduce([head | tail], nil, fun) do
    reduce(tail, head, fun)
  end

  def reduce([head | tail], acc, fun) do
    reduce(tail, fun.(head, acc), fun)
  end
end