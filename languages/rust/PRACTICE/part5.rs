fn main() {
  let lst = [5, 4, 5, 1];
  println!("Question 1: {}", count_peaks(&lst));
  let list = [1, 1, 2, 4, 5, 5, 5, 5, 7, 9, 9, 1, 1];
  println!("Question 2: {:?}", remove_runs(&list));
  let mut list1 = [1, 2, 3, 4, 5];
  println!("Question 3: {}", count_and_remove_primes(&mut list1));
  println!("Updated List: {:?}", list1);
}

// Question 1
// given a reference to an input array, count the number of peaks in the array
// a peak is defined as an element flanked on either side by elements smaller than itself
// the first nad last elements of an array can still be considered peaks, if the single element adjacent to it is smaller
fn count_peaks(items: &[i32]) -> u32 {
  let mut count: u32 = 0;
  if items[0] > items[1] {
    count += 1;
  }
  if items[items.len() - 1] > items[items.len() - 2] {
    count += 1;
  } 

  for i in 1..(items.len() - 1) {
    if (items[i - 1] < items[i]) && (items[i + 1] < items[i]) {
      count += 1;
    }
  }
  count
}



// Question 2
// given a reference to an array of integers
// return a vector where runs of identical integer values have been reduced to a single instance of that integer
fn remove_runs(items: &[i32]) -> Vec<i64> {
  let mut result: Vec<i64> = Vec::new();  
  for elem in items.iter() {
    if result.is_empty() {
      result.push(*elem as i64);
    }
    else if result[result.len() - 1] != *elem as i64 {
      result.push(*elem as i64);
    }
  }
  result
}



// Question 3
// given a mutable reference to an array
// iterate through the array and determine if each number is prime
// if the number is prime, set that element to 0
// return the count of primes that were found and set to 0 in this way
fn count_and_remove_primes(items: &mut [u32]) -> u32 {
  let mut count: u32 = 0;
  for i in 0..items.len() {
    if is_prime(items[i]) {
      items[i] = 0;
      count += 1;
    }
  }
  count
}
fn is_prime(n: u32) -> bool {
  if n <= 1 {
    return false;
  }
  if n == 2 {
    return true;
  }
  if n % 2 == 0 {
    return false;
  }
  let mut i = 3;
  while i * i <= n {
    if n % i == 0 {
      return false;
    }
    i += 2;
  }
  return true;          
}



// Question 4
fn safe_squares_rooks(n: u8, rooks: &[(u8, u8)]) -> u32 {
  let mut row_safe = vec![true; n as usize];
  let mut col_safe = vec![true; n as usize];

  for &(row, col) in rooks {
      row_safe[row as usize] = false;
      col_safe[col as usize] = false;
  }

  let safe_row_count = row_safe.iter().filter(|&&safe| safe).count() as u32;
  let safe_col_count = col_safe.iter().filter(|&&safe| safe).count() as u32;

  safe_row_count * safe_col_count
}