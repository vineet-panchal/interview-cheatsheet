def linear_search(lst, n):
  for i in range(len(lst)):
    if lst[i] == n:
      return i
  return False

def binary_search(lst, n):
  left = 0
  right = len(lst) - 1
  
  while (left <= right):
    mid = int(left + (right - left) / 2)
    
    if (lst[mid] == n): 
      return mid
    elif (lst[mid] < n):
      left = mid + 1
    elif (lst[mid] > n):
      right = mid - 1
    
  return False

if __name__ == "__main__":
  print(linear_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 0))
  print(binary_search([1, 2, 3, 4, 5, 6, 7, 8, 9, 10], 8))