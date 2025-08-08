fn main() {
  let n = 10;
  println!("{}", fibonnaci(n));
}

// Question 1
// calculate the nth fibonacci number
fn fibonnaci(n: i32) -> i32 {
  if n <= 1 {
    return n;
  }
  return fibonnaci(n - 1) + fibonnaci(n - 2);
}



// Question 2
// 


