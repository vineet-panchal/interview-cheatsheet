# Control Flow, Ownership, and Lifetimes

## Control Flow

### if/else
###### - as with other imperative languages, the else is optional
```rust
fn main() {
  let num = 3;
  if num > 5 {
    println!("{} is greater than 5", num);
  }
  else {
    println!("{} is less than or equal to 5", num);
  }
}
```
```bash
> rustc main.rs
> main
3 is less than or equal to 5
```

### if/else if/else
###### - we use {} even though there's only one statement per branch
###### - Rust treats these as blocks whose last line can be an expression
```rust
fn main() {
  let temp = 33;
  if temp < 0 {
    println!("Frozen");
  } else if temp < 100 {
    println!("Liquid");
  } else {
    println!("Gas");
  }
}
```
```bash
> rustc main.rs
> main
Liquid
```

```rust
fn main() {
  let temp = 33;
  let state = if temp < 0 { "Frozen" }
              else if temp < 100 { "Liquid" }
              else { "Gas" };
  println("Water is {}!", state);
}
```
```bash
> rustc main.rs
> main
Water is Liquid!
```
###### - let state = {...}; is a statement
###### - {} is an expression that will evaluate to a string
###### - each option is in a scope block {}
###### - the value of a scope block is the last expression
###### - leaving the ; off makes these strings expressions

### While Loops
```rust
fn main() {
  let mut n = 1;
  while n <= 5 {
    println!("{}", n);
    n += 1; // rust understands +=
  }
}
```
```bash
1
2
3
4
5
```

### For Loops
##### Looping Through A List
###### - invoke iter() method of array nums
###### - elem takes the value of each element in the array
```rust
fn main() {
  let nums = [1, 2, 3, 4, 5];
  for elem in nums.iter() {
    println!("{}", elem);
  }
}
```
```bash
1
2
3
4
5
```

##### Looping Through A Range
###### - top of range not included
```rust
fn main() {
  for i in 1..6 {
    println!("{}", i);
  }
  let nums = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  for (index, value) in nums.iter().enumerate() {
    println!("{}: {}", index, value);
  }
  for i in (0..10).rev() {
    println!("{}", nums[i]);
  }
}
```
```bash
1
2
3
4
5
0: 1
1: 2
2: 3
3: 4
4: 5
5: 6
6: 7
7: 8
8: 9
9: 10
10
9
8
7
6
5
4
3
2
1
```

###### - Rust doesn't allow signed itnegers to be used as array indexes
###### - it inferred the type as unsigned, thus checking less than 0 is pointless
```rust
fn main() {
  let nums = [1, 2, 3, 4, 5];
  let mut i = 9;
  loop {
    if i < 0 { break; }
    println!("{}", nums[i]);
    i -= 1;
  }
}
```
```bash
> rustc main.rs
main.rs:9:9: 9:10 warning: comparison `i < 0`
--> main.rs:9:9
|
9 |     if i < 0 { break; }
|         ^~~~~~
|
= note: `#[warn(unused_comparisons)]` on by default
= help: compare with the expected type `usize`
```

```rust
fn main() {
  let nums = [1, 2, 3, 4, 5];
  let mut i = 4;
  loop {
    print!("{}", nums[i]);
    if i == 0 { break; }
    i -= 1;
  }
}
```
```bash
> rustc main.rs

```



## Ownership
###### - Rust has a system of ownership with rules checked at compile time, therefore, the program is not slowed at run-time
##### Three Rules:
###### 1.) each value in Rust has a variable that's called its owner
###### 2.) there can only be one owner at a time
###### 3.) when the owner goes out of scope, the value is dropped

### Strings
###### - string literals are different from regular strings
###### - their size is fixed, encoded directly into the executable
###### - strings not defined as a literal might have unknown size
###### - they are stored on the heap

```rust
fn main() {
  let s1 = "Hello"; // string literals like this are immutable
  let mut s2 = String::from("Hello");
  // strings declared like this can be mutable
  s2.push_str(" World");
  println!("{}", s1);
  println!("{}", s2);
}
```
```bash
> rustc main.rs
> main
Hello
Hello World
```

### Heap Strings
###### - memory for string requested at run time
###### - memory must be returned to the ehap when we're done with the string
```rust
fn main() {
  let mut s = String::from("Hello");
  println!("{}", s);
}
```
###### - calling String::from makes a memory request
###### - in Java we would say: String s = new String("Hello"); to accomplish the same

##### What happens when we no longer need that string?
###### - without garbage collection, we must identify when memory is no longer being used and free it explicitly
###### - this has historically been a difficult programming problem
###### - too early, then variables still in the scope become invalid
###### - too late, then waste memory
###### - Rust has a system of ownership and borrowing to solve this problem
###### - In Rust, memory is automatically returned when the variable that owns it leaves scope
###### - when a variable goes out of scope, Rust calls a special function automatically called drop()
###### - this fundtion is called at the closing }


![Image](https://github.com/user-attachments/assets/98546488-80fd-4738-9311-3722c42d72c8)
![Image](https://github.com/user-attachments/assets/244e658a-9faa-43fd-87d4-27511ada39ec)

###### - there can only be one owner at a time
```rust
fn main() {
  let s1 = String::from("Hello");
  let s2 = s1; // s1 is no longer valid
  println!("{}", s2);
}
```
```bash
> rustc main.rs
> main
error: use of moved value: `s1`
--> main.rs:4:24
|
4 |     let s2 = s1; // s1 is no longer valid
|                        ^--- value moved here
|
= note: move occurred because `s1` has type `String`, which does not implement the
`Copy` trait
```
![Image](https://github.com/user-attachments/assets/793efea4-37cb-42d6-a3e4-a2c70c584bab)

### clone()
###### - if we want to have multiple owners, we can use the clone() method
```rust
fn main() {
  let s1 = String::from("Hello");
  let s2 = s1.clone(); // s1 and s2 are both valid
  println!("{}", s1);
  println!("{}", s2);
}
```
```bash
> rustc main.rs
> main
Hello
Hello
```
![Image](https://github.com/user-attachments/assets/c45bee3b-80c7-49c8-be6b-83cb684f3d98)

### Ownership and Functions
###### - passing an argument moves or copies, just like an assignment:
```rust
fn main() {
  let s = String::from("Hello");
  stringPass(s);
  println!("{}", s); // error: use of moved value
}
fn stringPass(word: String) {
  println!("{}", word);
}
```
```bash
> rustc main.rs
> main
error: use of moved value: `s`
--> main.rs:4:24
|
4 |     println!("{}", s); // error: use of moved value
|                        ^ moved value not valid here
|
= note: move occurred because `s` has type `String`, which does not implement the
`Copy` trait
```
###### - ownership moved from s to word, s is now invalid
###### - this doesn't happen with primitives because they will simply be copied

### Returning Ownership
```rust
fn main() {
  let mut s = String::from("Hello");
  s = string_pass(s);
  println!("{}", s);
}
fn string_pass(word: String) -> String {
  println!("{}", word);
  word
}
```
```bash
> rustc main.rs
> main
Hello
Hello
```
###### - ownership is moved from s to word, then word is returned and moved into s
###### - s is invalid when we move to word, word is invalid when moved to s
###### - but this is allowed because s is mutable
###### - when string_pass reaches }, word has already been moved to s
###### - thus word is invalid and the string on the heap isn't freed

```rust
fn main() {
  let s = String::from("Hello");
  let (len, s1) = string_len(s);
  println!("{} has {} characters", s1, len);
}
fn string_len(word: String) -> (usize, String) {
  (word.len(), word)
}
```
```bash
> rustc main.rs
> main
Hello has 5 characters
```
###### - ownership is moved from s to word, then word is returned as a tuple
###### - the tuple is then moved into len and s1
###### - len() returns the length of array

### Moving vs Borrowing
```rust
fn main() {
  let s = String::from("Hello");
  println!("{} has {} characters", s1, string_len(&s));
}
fn string_len(word: &String) -> usize {
  word.len()
}
```
###### - word is a reference to s, it does not point to the string in the heap
###### - word has no ownership over s, this is called borrowing

```rust
fn main() {
  let mut s = String::from("Hello");
  let len = string_len(&mut s);
  println!("{} has {} characters", s, len);
}
fn string_len(word: &mut String) -> usize {
  word.push_str(", World");
  word.len()
}
```
```bash
> rustc main.rs
> main
Hello, World has 13 characters
```
###### - can only have one mutable borrow at a time:
```rust
fn main() {
  let mut s = String::from("Hello");
  let r = &mut s;
  let len = string_len(&mut s);
  println!("{} has {} characters", s, len);
}
```
```bash
> rustc main.rs
error[E0499]: cannot borrow `s` as mutable more than once at a time
--> src/main.rs:7:14
|
|     let len = string_len(&mut s);
|     word.push_str(", World");
|     ^ first borrow occurs here
|     let r = &mut s;
|     --- second borrow occurs here
```
###### - when the first mutable borrow goes out of scope, we can borrow again:
```rust
fn main() {
  let mut s = String::from("Hello");
  s.push_str(" test1 ");
  let r3 = &mut s;
  r3.push_str(" test2 "); 
  // here r3 is already a refernce, we're not borrowing again
  println!("{}", s);
}
```
```bash
> rustc main.rs
> main
Hello test1 test2
```
###### - using an immutably borrowed value prevents mutable borrow:
```rust
fn main() {
  let mut s = String::from("Hello");
  let r = &s;
  s.push_str(", World");
  println!("{}", r);
}
```
```bash
> rustc main.rs
error[E0505]: cannot move out of `s` because it is borrowed
--> src/main.rs:5:9
|
|     s.push_str(", World");
|     ^^^^^^^^^^^^^^^^^^^^ move occurs because `s` has been borrowed
|     let r = &s;
|     --- borrow of `s` occurs here
```

### Slices
###### - reference to a subset of an array
###### - use a range as an index, second index is not included
```rust
fn main() {
  let a = [1, 2, 3, 4, 5];
  let tail = &a[1..4];
  for n in tail.iter() {
    print!("{} ", n);
  }
}
```
```bash
> rustc main.rs
> main
2 3 4
```

### Slices, Arguments, Functions
```rust
fn main() {
  let nums = [1, 2, 3, 4, 5, 6, 7, 8];
  let subset = get_slice(&nums, 1, 5);
  for n in subset.iter() {
    print!("{} ", n);
  }
}
fn get_slice(a: &[i32], start: usize, end: usize) -> &[i32] {
  &a[start..end]
}
```
###### - indexes must be usize
###### - pass in reference to array
###### - return slice (reference to subarray)
###### - array only exists once in memory
###### - subset and nums point to different parts of the same memory

### String Slices
```rust
fn main() {
  let msg = String::from("Hello, World");
  let hello = &msg[..5]; // same as &msg[0..5]
  let world = &msg[7..]; // same as &msg[7..msg.len()]
  println!("{} {}", hello, world);
}
```
```bash
> rustc main.rs
> main
Hello World
```

## Lifetime

### Memory Safety
###### - Rust is designed to be memory safe
###### - Null or dangling pointers are not permitted

### Dangling References
```rust
fn main() {
  let ref_to_nothing = dangle();
}
fn dangle() -> &String {
  // create String s
  // return a reference to it
  // s goes out of scope when dangle function ends
  let s = String::from("Hello, World");
  &s
}
```
```bash
> rustc main.rs
main.rs:5:18: 5:25 error: use of possibly-uninitialized variable:
--> main.rs:5:18
|
5 |   let ref_to_nothing = dangle();
|                  ^^^^^^^^^^^^^
```

### Lifetimes
##### Lifetime is a very distinct feature of Rust:
###### - every reference in Rust has lifetime
###### - the lifetime of a reference is the scope for which that reference is valid
###### - lifetimes are often implicit and inferred, but can be defined explicitly, just like variable types


