fn main() {
  let arr = [-12, 1, 4, -3, 20, -1, -10, -2];
  let x = sum_of_positive_and_negative(&arr);
  println!("Question 1: {:?}", x);
  let y = max_subsequence(&arr);
  println!("Question 2: {:?}", y);
  let z = move_elems_in_array(&arr);
  println!("Question 3: {:?}", z);
}

// Question 1
// find and print the sum of the positive integers, and the sum of the negative integers in a given array
fn sum_of_positive_and_negative(arr: &[i32]) -> (i32, i32) {
  let mut count_positive = 0;
  let mut count_negative = 0;
  
  for &elem in arr.iter() {
    if elem < 0 {
      count_negative += elem;
    } else if elem > 0 {
      count_positive += elem;
    }
  }

  (count_positive, count_negative)
}



// Question 2
// find the subsequence whose elements produce the largest sum
// return a tuple containing the subsequence and the sum
fn max_subsequence(arr: &[i32]) -> (Vec<i32>, i32) {
  let len = arr.len();
  let mut lower = 0;
  let mut upper = len - 1;
  let mut sum = 0;
  let mut biggest_sum = 0;

  for i in 0..len {
    for j in i..len {
      sum += arr[j];
      if sum > biggest_sum {
        biggest_sum = sum;
        lower = i;
        upper = j;
      }
    }
    sum = 0;
  }

  ((&arr[lower..upper + 1]).to_vec(), biggest_sum)
}



// Question 3
// given an array, return an array, where all the negative numbers are moved to the left, and all the positive numbers are moved to the right
// the relative ordering of positve and negative values remains the same
fn move_elems_in_array(arr: &[i32]) -> Vec<i32> {
  let mut negatives = Vec::new();
  let mut positives = Vec::new();
  for &elem in arr.iter() {
    if elem >= 0 {
      positives.push(elem);
    } else {
      negatives.push(elem);
    }
  }

  negatives.extend(positives);
  negatives
}