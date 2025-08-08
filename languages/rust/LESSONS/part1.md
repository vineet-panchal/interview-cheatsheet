# Introduction To Rust and Type Systems

## Type Systems
###### - a set of rules that assigns a property called type to constructs of a program
###### - these constructs include variables, functions, expressions, etc.
###### - the main point of type systems is to reduce bugs

```c
#include <stdio.h>
#include <windows.h>

int main(void) {
  unsigned long long a = 4607182418800017408;
  printf("as integer: %llu\n", a);
  printf("as double: %lf\n", a);
  system("pause");
}
```

## Static vs Dynamic
###### statically typed languages perform type checking at compile time
###### - checked while converting source code to machine (or byte) code
###### dynamically typed languages perform type checking at run-time
###### - checked on the fly while instructions are being executed
###### Statically Typed Languages: C/C++, Java, Haskell, Rust
###### Dynamically Typed Languages: Python, SmallTalk, Elixir

### Advantages and Disadvantages
##### Static:
###### - prevents bugs at compile time
###### - reliably find errors at compile time
###### - code will execute faster if types are assumed to be correct at run time
###### - type-specfic optimization can be performed at compile time
###### Ex: integer arithmetic is typically faster than floating point
##### Dynamic:
###### - compilers run faster
###### - interpreters can dynamically load new code, SmallTalk, MATLAB, iex
###### - easier code reuse

## Introduction To Rust
### Systems Programming Language
###### - in contrast with application programming languages
###### - system software includes things like operating systems, utility software, device drivers, compilers, linkers, etc.
###### - system languages tend to feature more direct access to physical hardware of the computer system

### Rust Syntax
###### - similar to C/C++
###### - blocks of code delimited by {}
###### - familiar control structures supported (if, else, while, for, etc)
###### - supports pattern matching 
###### - no need for return because last expression creates return value

### Memory Safety
###### - rust is designed to be memory safe
###### - null or dangling pointers are not permitted
###### - for linked lists where you need null pointers, rust defines an option type, which can be used to test if a pointer has Some value or None

### Memory Management
###### - rust does not do garbage collection
###### - resource acquisition is initialization, RAII
###### - constructor used to acquire and initalize objects
###### - resource deallocation is done by the destructor
###### - no valid reference to object == no object
###### - up to garbage collector

### Types and Polymorphism
###### - type system includes traits
###### - directly inspired by Haskell's type classes
###### - supports type inference for variables declared with let keyword
###### - compile error if inference fails
###### - keyword mut for mutable variables

### Strongly, staically typed
###### - limited implicit type conversions at compile time

### No "Undefined Behaviour"
###### - null pointer dereferencing, attempt to dereference address 0
###### - use of variable before it's initialized
###### - array index out of bounds, may or may not cause runtime error
###### - signed integer overflow and optimization, ex: x + 1 > x
###### - if overflow is undefined, compiler can just optimize this to simply true
###### - dangerous if x can overflow
###### - forcing compiler to consider overflow means we lose certain optimizations

### The First Program
```rust
// main.rs file 
fn main() {
  println!("Hello, world!");
}
```
```bash
> rustc main.rs
> main
Hello, world!
```
##### println vs println!
###### - the ! indicates we're calling a macro
###### - a standard function call doesn't include !

### Variables
###### - by default, rust variables are immutable
###### - once initialized, can't change
###### - like final or const in other languages
###### - declare using let keyword
```rust
fn main() {
  let x = 5;
  println!("value: {}", x); 
  // curly brace pair in a println acts as a style placeholder
}
```
```bash
> rustc main.rs
> main
value: 5
```
###### - you cannot assign twice to immutable variables
```rust
fn main() {
  let x = 5;
  x = 10;
  println!("value: {}", x);
}
```
```bash
> rustc main.rs
main.rs:3:9: 1 error available (1 error)
--> main.rs:3:9
|
|     x = 10;
|     ^^^^^ cannot assign twice to immutable variable `x`
```

### Constant/Global Variables
###### - use const instead of let
###### - always immutable
###### - can be decalred in global scope, unlike let
###### - must indicate data type, u32'
```rust
const BIN: u32 = 2;
fn main() {
  const BASE: u32 = 10;
  println!("bin: {}", BIN);
  println!("base: {}", BASE);
}
```

### Shadowing In Rust
```rust
fn main() {
  let x = 3;
  let x = x + 1;
  let x = x * 2;
  println!("x: {}", x);
}
```
```bash
> rustc main.rs
> main
x: 8
```

#### Shadowing vs mut
###### - with mut, we're mutating a variable in memory
###### - storing a different value in the same variable
###### - the name still refers to the same place, thus the type must stay the same
###### - with shadowing, we're getting a new variable in memory each time
###### - we're changing what a given name is referring to
###### - we're not changing the existing value

### Data Types
###### - two subsets: scalar and compound
###### Scalar types represent a single value
###### - rust has four: integers, floating-point, booleans, characters
###### Compound types group mulitple values:
###### - two primitive compound types: tuples and arrays

### Scalar Types: Integers
###### - signed integers are stored using 2s complement
###### - architecture will be 32 bits on a 32 bit system, 64 bits on a 64 bit system
###### - when not specified, Rust defaults to i32
| Length | Signed | Unsigned | 
| --- | --- | --- |
| 8-bit | i8 | u8 |
| 16-bit | i16 | u16 |
| 32-bit | i32 | u32 |
| 64-bit | i64 | u64 |
| architecture | isize | usize |

```rust
fn main() {
  let x: u8 = 3;
  let y: i64 = 5;
  let z: isize = 999;
  println!("x: {}", x);
  println!("y: {}", y);
  println!("z: {}", z);
}
```
```bash
> rustc main.rs
> main
x: 3
y: 5
z: 999
```
#### Integer Literals
###### - in addition to just writing the value: 
| Number Literals | Example |
| --- | --- |
| Decimal | 98_222 | 
| Hexadecimal | 0xFF |
| Octal | 0o77 |
| Binary | 0b1111_0000 |
| Underscores | 1_000_000 |
| Byte (u8 only) | b'A' |
###### - bytes can be character literals
##### Notice the _ 
###### - this is a handly visual sugar
###### - hard to count the # of zeroes in 1000000000
###### - Rust will insert spaces to make it easier to read: 1_000_000_000

### Scalar Types: Floating Point
###### - two kinds 32 and 64 bit (float and double, single and double precision)
###### - represented using standard IEEE-754
```rust
fn main() {
  let x: f32 = 1.0/3.0;
  let y: f64 = 1.0/3.0;
  println!("x: {}", x);
  println!("y: {}", y);
}
```
```bash
> rustc main.rs
> main
x: 0.33333334
y: 0.3333333333333333
```
#### Numeric Operations
```rust
fn main() {
  let r1 = 2 + 3 * 6;
  let r2 = 3/4;
  let r3 = 2 % 3.0;
  println!("r1: {}", r1);
  println!("r2: {}", r2);
  println!("r3: {}", r3);
}
```
```bash
> rustc main.rs
> main
error: cannot mod `{integer}` by `{float}`
--> main.rs:5:9
|
5 |     let r3 = 2 % 3.0;
|         ^^^^^^^^^^^^
|
= note: expected `integer` found `{float}`
```
```rust
fn main() {
  let r1 = 2 + 3 * 6;
  let r2 = 3/4;
  let r3 = 2 % 3;
  println!("r1: {}", r1);
  println!("r2: {}", r2);
  println!("r3: {}", r3);
}
```
```bash
> rustc main.rs
> main
r1: 20
r2: 0
r3: 2
```
#### Mixed Expressions
```rust
fn main() {
  let r1 = 3/4;
  let r2 = 3/4.0;
  let r3: f64 = 3/4;
  println!("r1: {}", r1);
  println!("r2: {}", r2);
  println!("r3: {}", r3);
}
```
```bash
> rustc main.rs
> main
error: cannot divide `{integer}` by `{float}`
--> main.rs:2:9
|
2 |     let r2 = 3/4.0;
|         ^^^^^^^^^^^^
|
= note: expected `integer` found `{float}`
```

#### Casting: as type
```rust
fn main() {
  let r1: f64 = 3/4;
  let r2 = 3 as f64/4 as f64;
  println!("r1: {}", r1);
  println!("r2: {}", r2);
}
```
```bash
> rustc main.rs
> main
error: mismatched types
--> main.rs:2:9
|
1 |     let r1: f64 = 3/4;
|         ^^^^^^^^^^^^^^^
|
= note: expected `f64` found `{integer}`
```
```rust
fn main() {
  let r2: 3 as f64/4 as f64;
  println!("r2: {}", r2);
}
```
```bash
> rustc main.rs
> main
r2: 0.75
```

### Scalar Types: Boolean
###### - true, false
```rust
fn main() {
  let b1 = true;
  let b2: bool = false;
  println!("b1: {}", b1);
  println!("b2: {}", b2);
}
```
```bash
> rustc main.rs
> main
b1: true
b2: false
```

### Scalar Types: Characters
###### - rust supports unicode
```rust
fn main() {
  let c1 = 'Z';
  let c2 = '\u{00C5}';
  println!("c1: {}", c1);
  println!("c2: {}", c2);
}
```
```bash
> rustc main.rs
> main
c1: Z
c2: Å
```

### Compound Types: Tuples
###### - tuples can be heterogeneous, and we don't need to specify a type, because Rust can infer it
```rust
fn main() {
  let vals1 = (8, 3.14, '!');
  let vals2: (i32, f64, char) = (8, 3.14, '!');
}
```

#### Accessing Elements In Tuples
###### - access elements by destructuring
```rust
fn main() {
  let tup = (42, 3.141592, '!');
  let (x, y, z) = tup;
  println!("{}, {}, {}", x, y, z);
}
```
```bash
> rustc main.rs
> main
42, 3.141592, !
```
###### - you can also access elements directly
```rust
fn main() {
  let tup = (42, 3.141592, '!');
  println!("{}, {}, {}", tup.0, tup.1, tup.2);
}
```
```bash
> rustc main.rs
> main
42, 3.141592, !
```

```rust
fn main() {
  let tup = (42, 3.141592, '!');
  println!("{}, {}, {}", tup.0, tup.1, tup.2, tup.3);
}
```
```bash
> rustc main.rs
> main
error: out of bounds
--> main.rs:5:9
|
5 |     println!("{}, {}, {}", tup.0, tup.1, tup.2, tup.3);s
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|
= note: the index `3` is out of bounds for this kind of index
= note: the len of the tuple is 3
```

### Compound Types: Arrays
###### - arrays are homogeneous, zero-indexed, fixed in size
```rust
fn main() {
  let arr = [1, 2, 3, 4, 5];
  println!("{:?}", arr);
  println!("{}, {}, {}, {}, {}", arr[0], arr[1], arr[2], arr[3], arr[4]);
}
```
```bash
> rustc main.rs
> main
[1, 2, 3, 4, 5]
1, 2, 3, 4, 5
```

#### Arrays Of Tuples
```rust
fn main() {
  let nums = [(1, 'a'), (2, 'b'), (3, 'c')];
  println!("{}, {}", nums[0].0, nums[0].1);
}
```
```bash
> rustc main.rs
> main
1, a
```
###### - tuple types must be the same
```rust
fn main() {
  let nums = [(1, 'a'), (2, 'b'), (3, 42)];
  println!("{}, {}", nums[0].0, nums[0].1);
}
```
```bash
> rustc main.rs
error: mismatched types
--> main.rs:5:9
|
5 |     println!("{}, {}", nums[0].0, nums[0].1);
|         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
|
= note: expected `char`, found `i32`
```

### Types and Literals Summary
##### 4 Scalar Types:
###### Integer ==> u8, u16, u32, u64, usize, i8, i16, i32, i64, isize
###### Floating Point ==> f32, f64
###### Boolean ==> bool(true, false)
###### Character ==> Unicode: 'Z', 'a', '&', '\u{00C5}', etc.

##### 2 Compound Types:
###### Tuple ==> heterogeneous
###### Array ==> homogeneous

###### - rust supports other data structures as well, but they are not base types

### Strings
```rust
fn main() {
  let word1 = "He\nllo";
  let word2 = "Rust is \"fun\"";
  println!("{}", word1);
  println!("{}", word2);
}
```
```bash
> rustc main.rs
> main
He
llo
Rust is "fun"
```

### Functions
#### Main Function
###### - returns nothing, accepts no arguments
###### - convention for naming functions is snake_case
###### - words seperated by underscores
```rust
fn main() {
  like_main_but_not_as_good();
}
fn like_main_but_not_as_good() {
  println!("Hello, world!");
}
```
```bash
> rustc main.rs
> main
Hello, world!
```

#### Parameters
##### identifier: type
###### - parameters are seperated by commas
###### - indicating type is mandatory
```rust
fn main() {
  print_val(5);
  print_two_vals(5, 3.14);
}

fn print_val(n: i32) {
  println!("{}", n);
}

fn print_two_vals(n1: i32, n2: f64) {
  println!("{}, {}", n1, n2);
} 
```
```bash
> rustc main.rs
> main
5
5, 3.14
```

###### - arguments called for a function have to match the type of the parameters, otherwise there will be an error for mismatched types
```rust
fn main() {
  print_val(5);
  print_two_vals(5, 3);
}
fn print_val(n: i32) {
  println!("{}", n);
}
fn print_two_vals(n1: i32, n2: f64) {
  println!("{}, {}", n1, n2);
}
```
```bash
error[E0308]: mismatched types
--> src/main.rs:8:34
|
|             println!("{}, {}", n1, n2);
|                                  ^ expected f64, found i32
|
= note: expected type `f64`
found type `i32`
```

### Statements and Expressions
###### - rust is primarily expression based, but still has statements
##### Two types of statements:
###### - declaration statements return nothing
###### - expression statements return empty tuple()
###### Ex: let x = 6; // this is a declaration statement
###### - this does not return a value, we cannot do the following:
###### let y = (let x = 6);
###### Ex: 5 + 2; // this is an expression statement
###### - this expression is evaluated, but the result is ignored (not saved);
###### 5 + 2; // is an expression, it evaluates to 7
###### y = 5+2 // is an expression statement, it returns (), but the result of the nested expression 5+2 is saved to y
```rust
fn main() {
  let mut x: i32;
  let mut y: i32;
  x = (y = 8);
}
```
```bash
error[E0308]: mismatched types
--> src/main.rs:5:14
|
|             x = (y = 8);
|              ^ expected i32, found ()
|
= note: expected type `i32`
found type `()`
```
###### - variable y gets re-assigned
###### - the expression statement (y = 8) returns an empty tuple in Rust
###### - can't assign an empty tuple to a variable declared to hold i32
```rust
fn main() {
  let mut x: i32 = 5;
  println!("{}", x);
  let y = x = 3;
  println!("{}", x);
  println!("{:?}", y); // put :? inside curly braces to print tuples and arrays
}
```
```bash
5
3
()
```

### Scope Blocks as Expressions
```rust
fn main() {
  let x = 5;
  let y = {
    let z = 3;
    z + 1
  };
  println!("{} {}", x, y);
}
```
```bash
5 4
```

### Return Value
###### - the last line should be an expression, no semi-colon
##### -> type
###### - explicitly indicate return type
###### - result of expression gets returned
```rust
fn main() {
  println!("{}", plus_five(8));
}

fn plus_five(n: i32) -> i32 { // define return type in the function statement
  n + 5   // you cannot put a semi-colon on the return statement
}
```
```bash
13
```