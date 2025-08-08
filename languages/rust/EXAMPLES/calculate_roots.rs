fn roots(a: i32, b: i32, c:i32) -> (f64, f64, i32)
{
    // -b +- root(b^2 -4ac) / 2a
    let (new_a, new_b, new_c) = (a as f64, b as f64, c as f64);
    let deltab: f64 = new_b*new_b - 4.0*new_a*new_c;
// if < 0 no roots
    if deltab < 0.0{
        return (0.0, 0.0, 1)
    } else if deltab == 0.0 {
        let result: f64 = -new_b / (2.0*new_a);
        return (result, result, 0);
    } else {
        return ((-new_b as f64 - deltab) / (2.0*new_a as f64), (-new_b as f64 + deltab) / (2.0*new_a as f64), 0)
    }
// if == 0 1 root
// otherwise 2 roots

}



fn main() {
  let a = 1;
  let result = roots(a,2,3);
  println!("{:?}", result);
  println!("{}",a);
  let result = sum_digits((1234, 9876));
  println!("{:?}", result);
}