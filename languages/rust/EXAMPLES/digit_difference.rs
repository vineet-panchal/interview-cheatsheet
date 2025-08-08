// given a tuple of two integers, calculate the sum of the absolute difference between the corresponding digits and return the sum
// if one integer has more digits than the other, use 0 as the missing digit
fn main() {
  let mut arr = [1,23,4,5];
  let mut new = &mut arr[1..3];
  new[0]= 99;
  println!("{:?}", new);
  println!("{:?}", arr);
}

fn sum_digits(nums: (i32, i32)) -> i32 {
  // 100124
  // 014325
  // 1 - 
  // 0 - 
  let mut val1 = nums.0;
  let mut val2 = nums.1;
  let mut result = 0;
  while val1 > 0 || val2 > 0 {
      let (r1, r2) = (val1 % 10, val2 %10);
      let diff = (r1-r2).abs();
      result += diff;
      val1 /= 10;
      val2 /= 10;
  }
  result
}