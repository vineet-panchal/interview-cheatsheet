// Vector of Unique Odd Numbers
// given an array of integers, return a vector containing the unique (only occurrence) odd numbers
fn digit_filter(nums: &[i32]) -> Vec<i32>
{
    // empty list
    let mut my_vec: Vec<i32> = vec!();
    let mut i = 0;

    while i < nums.len()
    {
        let val = nums[i];

        if val % 2 == 1 
        {
            let mut count = 0;
            for item in nums.iter()
            {
                if *item == val{
                    count+=1;
                }
            }
            if count == 1{
                my_vec.push(val);
            }
        }
        i+=1;
    }
    // fill new::Vec()
    // return
    my_vec
}



fn main() {
  let data = [1, 4, 2, 6, 2, 4, 1, 7, 9, 8, 5, 3];
  let result = digit_filter(&data);
  println!("{:?}", result);
}