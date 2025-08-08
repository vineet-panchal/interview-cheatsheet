# Nine functions are described below. Functions 1-4 do not require recursion at all, while
# functions 5-8 do. Your solutions for these functions should be tail recursive. 

# 1) firstTwoEqual?/1 – This function accepts a list as input. It should return true if the
# first two elements of the list are the same, and false otherwise. If the input list contains
# fewer than two elements, you should also return false.

# 2) nextNineNine/1 – This function accepts a list as input. It should insert the integer 99
# into the second position of the list and return the resulting list. If the input list is empty,
# return the :error atom.

# 3) frontToBack/1 – This function accepts a list as input. It should remove the head
# from the list and append it to the back of the list. Return the resulting list. If the input
# list is empty, return the :error atom.

# 4) canBeTriangle?/1 – This function will receive a tuple as an argument. It should
# return true if the elements of this tuple could be the side lengths of a triangle, and false
# otherwise. This means that if the function receives as input anything other than a 3-
# tuple, return false. If the function receives a 3-tuple, but the elements are not numeric,
# return false also.
# Beyond the above, for example, the numbers 3, 4, 5 could represent the side lengths of
# a triangle, but 1, 2, 5 could not. (To see why this is the case, try and draw a triangle with
# side lengths 1, 2, and 5. Use a ruler.)

# 5) isAscending?/1 – This function should return true if the elements of the input list
# are strictly ascending, and false otherwise. Each element must be strictly larger than
# (not merely equal to) the element that precedes it. Note that the empty list is
# ascending, as is every list containing only a single element.

# 6) onlyOddDigits?/1 – This function should return true if the provided integer
# argument contains only odd digits (1, 3, 5, 7, 9) and false otherwise. Note that the digit
# '0' is considered even. Hint: The functions rem/2 and div/2 will serve you well here.

# 7) catStrings/1 – This function accepts a list that can contain values of any type. You
# should return the concatenation of all the strings in the list. For example, if the input is
# [5, 3, 7, “cat”, 9, “dog”, “horse”, -5, “mouse”], you would return “catdoghorsemouse”

# 8) filterStrings/1 – This function accepts a list that can contain values of any type.
# Build and return a new list with all the strings removed.
# For example, if the input is [5, 3, 7, “cat”, 9, “dog”, “horse”, -5, “mouse”], you would
# return [5, 3, 7, 9, -5].

defmodule part1 do
  def firstTwoEqual(items) do
   case items do
      [] -> false
      [_] -> false
      _ ->
        val1 = hd items
        val2 = hd (tl items)
        case val1 do
          ^val2 -> true
          _ -> false
        end
    end
  end



  def nextNineNine(items) do
    case items do
      [] -> :error
      _ -> [hd items, 99 | tl items]
    end
  end

  # alternate solution for nextNineNine
  def nextNineNine(items) do
    if items == [] do
      :error
    else
      head = hd items
      tail = tl items
      items = [head] ++ [99] ++ tail
      items
    end
  end



  def frontToBack(items) do
    if items == [] do
      :error
    else
      h = hd items
      items = tl items
      items ++ [h]
    end
  end

  # alternate solution to frontToBack
  def frontToBack([]) do
    :error
  end

  def frontToBack([first | tail]) do
    tail ++ [first]
  end



  def canBeTriangle(tup) do
    if length(tup) != 3 do
      false
    else 
      canBeTriangle?(tup)
    end
  end

  def canBeTriangle?({a, b, c}) do
    (a + b > c) and (b + c > a) and (a + c > b) 
  end

  # alternate solution
    def canBeTriangle?({a, b , c}) do
    (a + b > c) and (a + c > b) and (b + c > a)
  end

  def canBeTriangle?(_) do
    false
  end


  
  def isAscending(items) do
    cond do
      items == [] -> true
      items == [_] -> true
      hd(items) > hd(tl(items)) -> isAscending(tl(items))
      true -> false
    end
  end

  # alternate solution to isAscending
  def isAscending?(items) do
    case items do
      [] -> true
      [_] -> true
      _ ->
      head1 = hd items
      head2 = hd tl items
      if head1 >= head2 do
        false
      else
        t = tl items
        isAscending?(t)
      end
    end
  end



  def onlyOddDigits(n) do
    cond do
      n == 0 -> false
      n == 1 -> true
      rem(n, 2) == 1 -> onlyOddDigits(div(n, 10))
      true -> false
    end
  end

  # alternate solution to onlyOddDigits
  def onlyOddDigits?(n) do
    onlyOddDigits?(n, true)
  end

  def onlyOddDigits?(0, _result) do
    true
  end

  def onlyOddDigits?(n, true) do
    digit = rem(n, 10)
    cond do
      rem(digit, 2) == 0 -> false
      div(n, 10) == 0 -> true
      true -> onlyOddDigits?(div(n, 10), true)
    end
  end



  def catStrings(items) do
    catStrings(items, "")
  end

  def catStrings([], res) do
    res
  end

  def catStrings([h | t], res) do
    if is_binary(h) do
      catStrings(t, res <> h)
    else
      catStrings(t, res)
    end
  end

  # alternate solution to catStrings
  def catStrings(list) do
    catStrings(list, "")
  end

  def catStrings([], acc) do
    acc
  end
 
  def catStrings([head | tail], acc) when is_binary(head) do
    catStrings(tail, acc <> head)
  end

  def catStrings([_head | tail], acc) do
    catStrings(tail, acc)
  end



  def filterStrings(items) do
    filterStrings(items, [])
  end

  def filterStrings([], acc) do
    acc
  end

  def filterStrings([h | t], acc) do
    if is_binary(h) do
      filterStrings(t, acc)
    else
      filterStrings(t, acc ++ [h])
    end
  end

  # alternate solution to filterStrings
  def filterStrings(items) do
    filterStrings(items, [])
  end

  defp filterStrings(items, acc) do
    cond do
      items == [] -> acc
      is_binary((hd items)) -> filterStrings((tl items), acc)
      true -> filterStrings((tl items), acc ++ [(hd items)])
    end
  end
end