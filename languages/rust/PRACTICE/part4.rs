fn main() {
  let list = [1, 2, 3, 4, 5];
  println!("Question 1: {}", third_last(&list));
  println!("Question 2: {:?}", every_other(&list));
  println!("Question 3: {}", is_cyclops(101));
  println!("Question 4: {}", domino_cycle(&[(1, 2), (2, 3), (3, 1)]));
}

// Question 1
// given a list, return the third last element
fn third_last(arr: &[i32]) -> i32 {
  arr[arr.len() - 3]
}



// Question 2
// given a list, return a new list containing every other element, starting with the first element
fn every_other(arr: &[i32]) -> Vec<i32> {
  arr.iter().step_by(2).cloned().collect()
}



// Question 3
// a non-negative integer is a cyclops number if its middle digit, and ONLY its middle digit is 0
// return true or false if it is a cyclops number or not
fn is_cyclops(n: i32) -> bool {
  let str_n = n.to_string();
  if str_n.len() % 2 == 0 {
    return false;
  }
  
  let mut count = 0;
  let mid_index = str_n.len() / 2;
  for c in str_n.chars() {
    if c == '0' {
      count += 1;
    }
    if count > 1 {
      return false;
    }
  }
  if count == 1 && str_n.chars().nth(mid_index) == Some('0') {
    return true;
  }
  return false
}



// Question 4
// given a list of tuples, that represent dominos, return true if it is a domino cycle, and false otherwise
// a domino cycle is when each domino ends with the same number the next domino starts with
fn domino_cycle(arr: &[(i32, i32)]) -> bool {
  if arr.len() == 1 {
    return arr[0].0 == arr[0].1;
  }

  // Handle empty list
  if arr.len() == 0 {
      return false;
  }

  // Check if each domino connects to the next one
  for i in 0..arr.len()-1 {
      if arr[i].1 != arr[i+1].0 {
          return false;
      }
  }

  // Finally check if the last domino connects back to the first
  arr[arr.len()-1].1 == arr[0].0
}