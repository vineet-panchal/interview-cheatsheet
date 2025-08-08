def binarySearch(val, vec, pos=0):
  """
  Perform a binary search on a sorted list (vec) to find the index of val.
  If found, return the index; otherwise, return None.
  """
  
  length = len(vec)
  if length == 0:
    return None  # Base case: empty list, return None
  if length == 1:
    return pos if vec[0] == val else None  
    # If only one element, check if it's the target

  midpt = length // 2  # Compute the midpoint index
  midel = vec[midpt]   # Get the middle element

  if val < midel:
    return binarySearch(val, vec[:midpt], pos)  
    # Search in the left half
  elif val > midel:
    return binarySearch(val, vec[midpt + 1:], pos + midpt + 1) 
    # Search in the right half
  else:
    return pos + midpt  # Element found, return index
  

def selectionSort(vec, comp):
  length = len(vec)    
  for cur in range(length - 1): 
  # Iterate over all elements except the last one
    best_idx = cur 
    # Assume current index is the best (smallest or largest depending on 'comp')

    for j in range(cur + 1, length):  
    # Iterate over the unsorted part of the list
      if comp(vec[j], vec[best_idx]): 
      # Use comparison function to find the best element
        best_idx = j  # Update best index

    vec[cur], vec[best_idx] = vec[best_idx], vec[cur]  
    # Swap the best element with the current element

  return vec  # Return sorted list


  
if __name__ == "__main__":
  print(binarySearch(2, [1, 2, 3, 4, 5]))  # Output: 
  vec = [64, 25, 12, 22, 11]
  ascending = selectionSort(vec[:], lambda x, y: x < y)  # Sort in ascending order
  descending = selectionSort(vec[:], lambda x, y: x > y)  # Sort in descending order

  print("Sorted in ascending order:", ascending)  # Output: [11, 12, 22, 25, 64]
  print("Sorted in descending order:", descending)  # Output: [64, 25, 22, 12, 11]
  
