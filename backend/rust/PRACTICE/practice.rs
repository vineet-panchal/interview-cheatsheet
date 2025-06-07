// Question 1
// given an array of integers, calculate and return the number of directional maximums
// a directional maximum is a number that is greater than its two neighbors
// an element is considered a maximum left if it is greater than the element to its left
// elements at the start of the array are maximum lefts
// an element is considered a maximum right if it is greater than the element to its right
// elements at the end of the array are maximum rights
// Ex: [4, 6, 2, 7], elements 4, 6, and 7 are considered left maximums, and element 7 is considered a maximum right
// return the total number of directional maximums which is 4 in this example
// Test 1 ==> Input: [4, 6, 2, 7]     Output: 4
// Test 2 ==> Input: [20, 21, 5, 4, 3, 23, 22]      Output: 5
// Test 3 ==> Input: [50, 1, 1, 1, 0, 2, 1, 50]      Output: 2


fn dir_max(nums: &[i32]) -> i32 {
  // Get left maxes
  let left_tup = left_max(nums);
  // Get right maxes
  let right_tup = right_max(nums);

  left_tup.0 + right_tup.0
}


fn left_max(arr: &[i32]) -> (i32, i32) {
  // Takes an array as input. Returns a tuple containing
  // the number of left maxes in this list and the maximum value
  // in the list - don't need to search for the max each time
  // Returns: (# left max, max value in list)
  if arr.len() == 0 {
      // Error case
      (-1, -1)
  }
  else{
      if arr.len() == 1 {
          // Base case
          (1, arr[0])
      }
      else {
          // Recursive case
          let result = left_max( &arr[0.. (arr.len()-1) ]);
          if result.1 < arr[arr.len()-1] {
              // New max
              (result.0+1, arr[arr.len()-1])
          }
          else {
              // Not a new max, keep values
              (result.0,result.1)
          }
      }
  }
}

fn right_max(arr: &[i32]) -> (i32, i32) {
  // Takes an array as input. Returns a tuple containing
  // the number of right maxes in this list and the maximum value
  // in the list - don't need to search for the max each time
  // Returns: (# left max, max value in list)

  // Same structure as left_max, but now we recurse with the
  // back half of the array
  if arr.len() == 0 {
      // Error case
      (-1, -1)
  }
  else{
      if arr.len() == 1 {
          // Base case
          (1, arr[0])
      }
      else {
          // Recursive case
          let result = right_max( &arr[ 1.. arr.len() ]);
          if result.1 < arr[0] {
              // New max
              (result.0+1, arr[0])
          }
          else {
              // Not a new max, keep values
              (result.0,result.1)
          }
      }
  }
}





// Question 2
// create a structure to represent the number of coins in your hand in quarters, dimes, nickels, and pennies (integers)
// create a method that, given the current structure of coins, create a new instance of the structure with an idead set of coins to represent the same currency
// using the largest coins as much as possible (which is also the fewest)
// create another method that takes two collections fo coins and produces an ideal set of coins

struct Change {
  quarters: i32,
  dimes: i32,
  nickels: i32,
  pennies: i32
}

impl Change{
  fn optimize(&self) -> Change {
      let total = 25 *  self.quarters + 10 * self.dimes + 5 * self.nickels + 1 * self.pennies;
      let new_q = total / 25;
      let new_d = (total % 25) / 10;
      let new_n = ((total % 25) % 10) / 5;
      let new_p = total % 5;
      Change{quarters: new_q, dimes: new_d, nickels: new_n, pennies: new_p}
  }
  fn merge_coins(&self, other: Change) -> Change {
      let total_q = self.quarters + other.quarters;
      let total_d = self.dimes + other.dimes;
      let total_n = self.nickels + other.nickels;
      let total_p = self.pennies + other.pennies;
      let new = Change{quarters: total_q, dimes: total_d, nickels: total_n, pennies: total_p};
      new.optimize()
  }
  fn display(&self) {
      println!("q: {} d: {} n: {} p: {}", self.quarters, self.dimes, self.nickels, self.pennies);
  }
}





// Question 3
// given a list of elements ints, determine if the list is a palindrome or not
// return true or false accordingly
// Test 1 ==> Input: [1, 2, 3, 4, 4, 3, 2, 1]       Output: True
// Test 2 ==> Input: [1]       Output: True
// Test 3 ==> Input: [1, 2, 3, 4, 1]      Output: False
// Test 4 ==> Input: [1, 2, 3, 4, 2, 1]       Output: False
fn palindrome(nums: &[i32]) -> bool {
  let rev_nums: Vec<i32> = nums.iter().rev().cloned().collect();
  nums == rev_nums.as_slice()
} 


// second solution to Question 3
fn palindrome_2(nums: &[i32]) -> bool {
  // Base case
  if nums.len() == 0 || nums.len() == 1 {
      true
  }
  // Recursive case
  else {
      if nums[0] == nums[ nums.len() - 1 ] {
          palindrome_2( &nums[1 .. (nums.len() -1)])
      }
      else{
          false
      }
  }
}





// Question 4
// There are two contestants in this game.
// Each contestant has two attributes: energy level and stomach capacity.
// Burgers with varying heat levels are continuously rolling out on a conveyor belt. For example, the heat levels could be [1, 2, 4, 7, 5, 3].
// The heat level of a burger determines how much energy a contestant consumes when eating it and the points they gain.
// Eating a burger consumes two units of a contestant’s stomach capacity.
// When a burger reaches the end of the conveyor belt, the contestant with higher energy (provided they have enough energy and capacity) grabs and eats the burger. (Note: However, a contestant with a lower energy level may eat the burger if the opponent no longer has enough stomach capacity to eat anymore)
// If both contestants have the same energy, the heat level of the burger determines who gets it. If the heat level is odd, Contestant 1 gets the burger. If it’s even, Contestant 2 gets it.
// If neither contestant has enough energy or capacity to eat the burger, it falls off the conveyor belt and is not eaten.
// The game ends when there are no more burgers left. The contestant with more points is declared the winner.
// Write a function called "eat" which implements this. The function definition is provided below:
// eat :: [Int] -> Int -> Int -> Int -> Int -> String
// eat food energy1 capacity1 energy2 capacity2
// where food is a list representing the conveyor belt holding the burgers with varying heat levels, and energy1, capacity1, energy2, capacity2 are integer values. Return the points for each contestant and the winner (as a String) when there is no more food left (Eg. "POINTS 1: 6, POINTS 2: 8, WINNER: 2").

fn eat(food: &[i32], mut energy1: i32, mut capacity1: i32, mut energy2: i32, mut capacity2: i32) -> String {
  // Params defined to be mutable so they can be updated within this function.
  let mut points1 = 0;
  let mut points2 = 0;

  for item in food.iter(){

      // Contestant 1 gets the food
      if energy1 > energy2 && capacity1 >= 2 && energy1 >= *item {
          energy1 -= *item;
          capacity1 -= 2;
          points1 += *item;
      }
      // Contestant 2 should but can't eat it, but Contestant 1 can
      else if energy2 > energy1 && capacity2 < 2 && capacity1 >= 2 && energy1 >= *item {
          energy1 -= *item;
          capacity1 -= 2;
          points1 += *item;
      }
      // Contestant 2 gets the food
      else if energy2 > energy1 && capacity2 >= 2 && energy2 >= *item {
          energy2 -= *item;
          capacity2 -= 2;
          points2 += *item;
      }
      // Contestant 1 should but can't eat it, but Contestant 2 can
      else if energy1 > energy2 && capacity1 < 2 && capacity2 >= 2 && energy2 >= *item {
          energy2 -= *item;
          capacity2 -= 2;
          points2 += *item;
      }
      // Matching energy - need to check if odd or even
      else if energy1 == energy2 && energy1 >= *item {

          // Contestant 1 not enough capacity
          if capacity1 < 2 && capacity2 >= 2{
              energy2 -= *item;
              capacity2 -= 2;
              points2 += *item;
          }
          // Contestant 2 not enough capacity
          else if capacity2 < 2 && capacity1 >= 2{
              energy1 -= *item;
              capacity1 -= 2;
              points1 += *item;
          }
          // Odd, Contestant 1 has enough
          else if *item % 2 == 1 && capacity1 >= 2 {
              energy1 -= *item;
              capacity1 -= 2;
              points1 += *item;
          }
          else if *item %2 == 0 && capacity2 >= 2 {
              energy2 -= *item;
              capacity2 -= 2;
              points2 += *item;
          }
          // else {
          //     println!("Error, this shouldn't happen");
          // }
      }

      // If none of the above conditions are met:
      // Nobody has the energy or capacity to eat food, discarded
      // No work to do, next iteration
      // else{
      //     println!("Nobody ate this item: {}", *item);
      // }

  }
  let points1_string = points1.to_string();
  let points2_string = points2.to_string();
  let mut winner_string = String::from("1");
  if points2 > points1 {
      winner_string = String::from("2");
  }
  format!("POINTS 1: {points1_string}, POINTS 2: {points2_string}, WINNER: {winner_string}")
}





// Question 5
// create function that receives an integer less than 100 as input
// return the number of factors for this number that are prime numbers
// this total should not include the factor 1 (because 1 is not a prime number) or the number itself 
// i.e. 7 is a prime number, and also a factor of 7
fn is_prime(val: i32) -> bool {
  // Determines if a given number is prime
  for i in 2..(val) {
      if val % i == 0 {
          return false
      }
  }
  true
}

fn prime_factors(num: i32) -> i32 {
  // Iterates through all possible factors
  // and determines if the factor is prime
  let mut count = 0;
  for i in 2..(num) {
      if num % i == 0 && is_prime(i) {
          count += 1;
          println!("Factor: {}", i);
      }
  }
  count
}





// Question 6
// given a list of integers, locate the local maximums
// a local max is a number that is greater than its immediate neighbours on both sides
// return a tuple containing the sum of the local maxs and the sum of the index values where these maxumums occur
// assume index values start at 1
fn local_maximums (numbers: &[i32]) -> (i32, i32) {
  // Check if len = 0
  if numbers.len() == 0 {
      return (0,0)
  }
  // Check if len = 1
  else if numbers.len() == 1 {
      return (numbers[0], 1)
  }
  else {
      let mut sum = 0;
      let mut i_sum = 0;

      // Examine all except first and last
      for i in 1..(numbers.len() - 1) {
          if numbers[i-1] < numbers[i] && numbers[i+1] < numbers[i] {
              // New local maximum
              sum += numbers[i];
              i_sum += i as i32 + 1;  // offset the index to account for index starting at 1
          }
      }

      // After checking all middle elements, check the first and last elements
      if numbers[0] > numbers[1] {
          sum += numbers[0];
          i_sum += 1;
      }
      if numbers[numbers.len()-1] > numbers[numbers.len()-2] {
          sum += numbers[numbers.len()-1];
          i_sum += numbers.len() as i32;
      }
      (sum, i_sum)
  }
}




fn main() {
  // Question 1 Tests
  let sample_1 = [4, 6, 2, 7];
  let max_count = dir_max(&sample_1);

  println!("{}", max_count); // 4

  // Left:        *   *            *
  let sample_2 = [20, 21, 5, 4, 3, 23, 22];
  // Right:                        *   *
  let max_count = dir_max(&sample_2);

  println!("{}", max_count); // 5

  // Left:        *              
  let sample_3 = [50, 1, 1, 1, 0, 2, 1, 50];
  // Right:                             *
  let max_count = dir_max(&sample_3);

  println!("{}", max_count); // 2


  // Question 2 Tests
  let mut purse1 = Change{quarters: 1, dimes: 1, nickels: 7, pennies: 67};
  purse1.display();
  purse1 = purse1.optimize();
  purse1.display();

  let purse2 = Change{quarters: 0, dimes: 1, nickels: 14, pennies: 2};
  purse2.display();

  let result = purse1.merge_coins(purse2);
  result.display();


  // Question 3 Tests
  let test_3_sample_1 = [1,2,3,4,5,6,5,4,3,2,1]; // true
  let test_3_sample_2 = [1,2,3,4,4,3,2,1];       // true
  let test_3_sample_3 = [1];                     // true
  let test_3_sample_4 = [1,2,3,4,1];     // false
  let test_3_sample_5 = [1,2,3,4,2,1];   // false
  let test_3_pass_1 = palindrome(&test_3_sample_1);
  let test_3_pass_2 = palindrome(&test_3_sample_2);
  let test_3_pass_3 = palindrome(&test_3_sample_3);
  let test_3_fail_4 = palindrome(&test_3_sample_4);
  let test_3_fail_5 = palindrome(&test_3_sample_5);
  println!("Pass: {} {} {}", test_3_pass_1, test_3_pass_2, test_3_pass_3);
  println!("Fail: {} {}", test_3_fail_4, test_3_fail_5);


  // Question 4 Tests
  let res1 = eat(&[6,3,18,2,5,1,9], 26, 12, 12, 14);
  println!("Actual: {}", res1);
  println!("Expect: POINTS 1: 16, POINTS 2: 10, WINNER: 1");
  println!("----------------");
  let res1 = eat(&[1,1,1,1,1,1,7,5], 20, 13, 14, 10);
  println!("Actual: {}", res1);
  println!("Expect: POINTS 1: 6, POINTS 2: 12, WINNER: 2");



  // Question 5 Tests
  let mut result = prime_factors(84);
  println!("84 has {} prime factors.", result);
  result = prime_factors(19);
  println!("19 has {} prime factors.", result);
  result = prime_factors(99);
  println!("99 has {} prime factors.", result);



  // Question 6
  let res = local_maximums( &[10, 1, 3, 4, 2, 7, 5, 2, 3, 2, 5] );
  println!("{}, {}", res.0, res.1);
  let res = local_maximums( &[1,2,1] );
  println!("{}, {}", res.0, res.1);
  let res = local_maximums( &[5] );
  println!("{}, {}", res.0, res.1);

}
