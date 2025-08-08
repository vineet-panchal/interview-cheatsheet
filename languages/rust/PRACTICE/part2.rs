fn main() {
  let x = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  let y = [1, 1, 2];
  let mut z = vec![1, 2, 3, 4, 5];
  next_nine_nine(&mut z);
  println!("Question 1: {}", first_two_equal(&y));
  println!("Question 2: {:?}", z);
  front_to_back(&mut z);
  println!("Question 3: {:?}", z);
  println!("Question 4: {}", can_be_triangle((3, 4, 5)));
  let v = [1, 2, 3];
  println!("Question 5: {:?}", is_ascending(&v));
  let mut n = 1379;
  println!("Question 6: {}", only_odd_digits(&mut n));
}

// Question 1
// given a list, return true if the first two elements of the list are the same, and false otherwise
// if the list is less than two elements, return false
fn first_two_equal(arr: &[i32]) -> bool {
  if arr.len() < 2 {
    return false;
  } 
  arr[0] == arr[1]
}



// Question 2
// given a list, insert the integer 99 into the second position of the list, and return the list
// if the list is empty, return error
fn next_nine_nine(vector: &mut Vec<i32>) {
  vector.insert(1, 99);
}



// Question 3
// given a list, remove the first element of the list and append it to the back, and return the list
fn front_to_back(vector: &mut Vec<i32>) {
  if vector.len() > 0 {
    let first = vector[0];
    vector.remove(0);
    vector.push(first);
  }
}



// Question 4
// given a tuple of Integers
// return true if the elements of the tuple could be side lengths of a triangle, and false otherwise
// if the function receives a 3-tuple, return false
fn can_be_triangle(tup: (i32, i32, i32)) -> bool {
  let (x, y, z) = tup;
  (x + z > y) && (x + y > z) && (y + z > x)
}



// Question 5
// return true if all the elements of the input list are strictly ascending, and false otherwise
// an empty list, and a single element list is ascending
fn is_ascending(arr: &[i32]) -> bool {
  if arr.len() < 2 {
    return true;
  } 

  let len = arr.len() - 1;

  for i in 0..len {
    if !(arr[i] < arr[i + 1]) {
      return false;
    }
  }

  return true
}



// Question 6
// return true if the given number only contains odd digits, and false otherwise
fn only_odd_digits(n: &mut i32) -> bool {
  if *n < 0 {
    return false;
  }

  if *n == 1 {
    return true;
  }

  while *n > 1 {
    *n = *n / 10;
    if *n % 2 == 0 {
      return false;
    }
  }

  return true
}