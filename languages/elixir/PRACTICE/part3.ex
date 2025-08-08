defmodule part3 do
  # Question 1
  # Which of the following Elixir types is similar to a symbol in Smalltalk?
  # 1) atom
  # 2) boolean
  # 3) list
  # 4) tuple
  # 5) More than one of these
  def q1 do
    1
  end



  # Question 2
  # Assume that the input to this function is a tuple containing
  # three integers. Return the greatest possible difference obtainable 
  # by subtracting two of the three numbers. For example, for the 
  # tuple {1, 2, 3}, return 2 (from 3-1).
  def q2(tup) do
    newList = tup |> Tuple.to_list() |> Enum.sort()
    List.last(newList) - hd(newList)
  end



  # Question 3
  # Assume that items is a list. If the length of the list is divisible 
  # by three, return the original list. If not, remove elements from the 
  # front until it is, and then return the resulting list.
  # If the list contains fewer than three elements, return the empty list
  def q3(items) do
    if (rem(length(items), 3) == 0) do
      items
    else
      q2(tl items)
    end
  end
  


  # Question 4
  # Assume that items is a list containing positive numeric values. 
  # Return the sum of all even integers in this list. 
  def q4(items) do 
    if (rem((hd items), 2) == 0) do
      q4((tl items), hd items)
    else
      q4((tl items), 0)
    end
  end

  def q4([h | t], acc) do
    cond do
      length(t) == 0 and rem(h, 2) == 0 -> acc + h
      rem(h, 2) == 0 -> q4(t, acc + h)
      true -> q4(t, acc)
    end
  end

  # alternate solution to q4
  def q4(items) do 
    q4(items, 0)
  end

  def q4([], acc) do
    acc
  end

  def q4([head | tail], acc) when (isinteger(head)) and (rem(head, 2) == 0) do
    q3(tail, acc + head)
  end

  def q4([ | tail], acc) do
    q4(tail, acc)
  end
end

# IO.puts Midterm.q2({1, 2, 3})
# IO.inspect Midterm.q3([1, 2, 3, 4, 5, 6, 7])
# IO.puts Midterm.q4([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])