# Learning The C# Syntax

## C# Statements
- Statements are actions that make a program do things
- statements are executed in a certain order, by default, that would be vertically. 
- That would be the first statement, then second, then third, ...
- The order is called the Flow Of Execution, however, the flow won't always be the same when different statements could be called next
- a statement always ends with a semicolon
- in c-sharp, whitespace and linespace doesn't matter, a statement just has to close with a semi-colon

```cs
// example of a statement
Console.WriteLine("Hello World");

// linespace and whitespace doesn't matter
Console.WriteLine("Hello World")

;
```

## C# Identifiers
- Identifier are names used to describe values
- since, c-sharp is a typed language, meaning data types should be declared and determined at compile time
- identifiers can contain letters, underscores, or numbers
- however, the first character needs to be either an digit or underscore

```cs
// examples of identifiers
string input = Console.ReadLine();
string _input2 = Console.ReadLine(); // allowed
string 2_input = Console.ReadLine(); // not allowed
```

## Comments
```cs
// single-line comments

/* 
multi-line
comments
*/
```

## C# Keywords
- C# comes with a number of keywords
- keywords are reserved words that have a special function
- C# comes with more than 70 keywords

```cs
// primitive data types
bool    // boolean data type for true/false values
byte    // 8-bit unsigned integer
char    // 16-bit Unicode character
decimal // precise decimal numbers (128-bit)
double  // 64-bit floating point number
float   // 32-bit floating point number
int     // 32-bit integer
long    // 64-bit integer
short   // 16-bit integer
string  // text data type
uint    // unsigned 32-bit integer
ulong   // unsigned 64-bit integer
ushort  // unsigned 16-bit integer

// access modifiers
public    // accessible from anywhere
private   // only accessible within same class
protected // accessible in same class and derived classes
internal  // accessible within same assembly

// declaration keywords
abstract  // declares incomplete class or method
class     // declares a class
const     // declares constant value
delegate  // declares delegate type
enum      // declares an enumeration
event     // declares an event
explicit  // declares explicit type conversion
implicit  // declares implicit type conversion
interface // declares an interface
namespace // declares scope for identifiers
new       // creates object or hides inherited member
override  // provides new implementation of virtual member
readonly  // declares read-only field
sealed    // prevents inheritance
static    // declares member belongs to type itself
struct    // declares a structure
this      // refers to current instance
virtual   // declares method can be overridden
void      // indicates no return value
var       // implicitly typed variable

// control flow
if       // conditional branching
else     // alternative branch
switch   // multiple branch selection
case     // switch statement label
default  // default switch label
while    // loop while condition is true
do       // do-while loop
for      // loop with counter
foreach  // iterate through collection
in       // foreach iterator
return   // exit method with value
break    // exit loop or switch
continue // skip to next iteration
goto     // jumps to label

// error handling
try     // begins error handling block
catch   // handles exceptions
finally // always executes after try/catch
throw   // raises an exception

// other
as       // type conversion
base     // access base class
checked  // enables overflow checking
is       // type checking
null     // no reference
object   // base type of all types
operator // declares operator
out      // parameter passing
params   // variable number of parameters
ref      // reference parameter
sizeof   // size of type
typeof   // gets type information
unchecked // disables overflow checking
using    // imports namespace or disposes resources
where    // generic type constraint
yield    // iterator state machine
```

## C# Variables
- a variable holds a value
- it is created in a declaration statement along with a data type

```cs
int age; // declaration statement
int Age; 
// these two are different variables

age = 25; // assignment statement
```

## Working with Built-In Types
- C# is a strongly typed language
- every variable has a type
- used to store information
- expressions will return a value of a specified type

### Using Data Types In C#
- depending on the data type, some data is stored on the heap, and some is stored on the stack.
- there are two types of data types in C#: Predefined Types and User-defined Types

### Predefined Types In C# 
- predefined types include: bool, int, float, double, decimal, char, etc.
- more predefined types: byte (sbyte), short (ushort), object, string

### Using the Built-In Data Types
```cs
int a = 2;
int b = a + 3; 
// a + 3 is an expression

bool c = true;
```

- C# types lead to type safety
- once defined, the variable can't change its type later on

```cs
int c = 3; 
c = true; // error
```

```cs
// examples
int monthlyWage = 1234;
int months = 12, bonus = 1000; // multiple declaration statements in one line
bool isActive = true;
double rating = 99.25;
int hoursWorked;
hoursWorked = 125;
hoursWorked = 148; // invalid
monthlyWage = true; // invalid
```

### Constants in C#
- create a constant value that could never be changed

```cs
const double rate = 0.07;
```

### Strings and String Methods in C# 
- contains text
- stored as a list of character objects

```cs
string name = "Vineet Panchal";
string emptyString = "";

string 
multiLineString = @"This is a
multi-line string";

// String methods
string text = "Hello, World!";
text.Length;           // 13
text.ToUpper();       // "HELLO, WORLD!"
text.ToLower();       // "hello, world!"
text.Substring(0, 5); // "Hello"
text.Replace("l", "x");// "Hexxo, Worxd!"
text.Contains("World");// true
text.StartsWith("H"); // true
text.EndsWith("!");   // true
text.Trim();         // Removes whitespace from start and end
text.Split(',');     // ["Hello", " World!"]
string.Concat("A", "B"); // "AB"
string.Join("-", new[]{"A","B"}); // "A-B"
text.IndexOf("o");    // 4
text.LastIndexOf("o"); // 7
text.PadLeft(15);     // "  Hello, World!"
text.PadRight(15);    // "Hello, World!  "
text.Remove(5);       // "Hello"
text.Insert(5, "!");  // "Hello!, World!"
string.IsNullOrEmpty(text);    // false
string.IsNullOrWhiteSpace(text); // false
```

## C# Operators

```cs 
// examples of operators
double ratePerHour = 12.34;
int numberOfHoursWorked = 165;

double currentMonthWage = ratePerHour + numberOfHoursWorked + bonus;

ratePerHour += 3; // ratePerHour = ratePerHour + 3

int numberOfEmployees = 15;
numberOfEmployees++; 
```

## Int, Char, and Double Methods
```cs
// =========================
// Integer (int) Methods
// =========================
int num = 42;

// Parsing & Conversion
int.Parse("123");                // Convert string to int
int.TryParse("123", out num);    // Safe parse
Convert.ToInt32("123");          // Convert object/string to int

// Comparison
num.CompareTo(50);   // -1 if less, 0 if equal, 1 if greater
num.Equals(42);      // true

// Formatting
num.ToString();       // "42"
num.ToString("D4");   // "0042" (decimal, padded)

// Static Methods
int.MinValue;        // -2,147,483,648
int.MaxValue;        //  2,147,483,647

// =========================
// Character (char) Methods
// =========================
char c = 'A';

// Checking character types
char.IsDigit(c);         // false
char.IsLetter(c);        // true
char.IsLetterOrDigit(c); // true
char.IsLower(c);         // false
char.IsUpper(c);         // true
char.IsWhiteSpace(' ');  // true
char.IsPunctuation('.'); // true
char.IsSymbol('$');      // true
char.IsControl('\n');    // true
char.IsNumber('5');      // true

// Conversion
char.ToLower(c);   // 'a'
char.ToUpper(c);   // 'A'

// Classification with Unicode
char.GetNumericValue('9'); // 9
char.GetUnicodeCategory(c); // UnicodeCategory.UppercaseLetter

// =========================
// Double Methods
// =========================
double d = 3.14159;

// Parsing & Conversion
double.Parse("3.14");                 // Convert string to double
double.TryParse("3.14", out d);       // Safe parse
Convert.ToDouble("3.14");             // Convert object/string

// Comparison
d.CompareTo(5.0);   // -1 if less, 0 if equal, 1 if greater
d.Equals(3.14159);  // true

// Formatting
d.ToString();          // "3.14159"
d.ToString("F2");      // "3.14" (2 decimal places)
d.ToString("E");       // "3.141590E+000"

// Special Values
double.MinValue;       // Smallest possible double
double.MaxValue;       // Largest possible double
double.Epsilon;        // Smallest positive Double > 0
double.NaN;            // Not a Number
double.PositiveInfinity;
double.NegativeInfinity

// Static Methods (via System.Math)
Math.Round(d);         // 3
Math.Floor(d);         // 3
Math.Ceiling(d);       // 4
Math.Sqrt(16);         // 4
Math.Pow(2, 3);        // 8
Math.Abs(-3.5);        // 3.5
Math.Sin(0);           // 0
Math.Cos(0);           // 1
Math.Tan(0);           // 0
```

### Date and Time Types
```cs
DateTime hireDate = new DateTime(2022, 3, 28, 14, 30, 0);

DateTime exitDate = new DateTime(2025, 12, 11);

DateTime startDate = hireDate.AddDays(15);

DateTime currentDate = DateTime.Now;
bool areWeInDst = currentDate.IsDaylightSavingTime();

DateTime startHour = DateTime.Now;
TimeSpan workTime = new TimeSpan();
DateTime endHJour = startHour.Add(workTime);

Console.WriteLine(startHour.ToLongDateString());
Console.WriteLine(endHour.ToShortTimeString());
```

## Casting

```cs
int numberOfHoursWorked = 165;
long veryLongMonth = numberOfHoursWorked; // valid

double d = 1234567.89;
int x = (int) d;

int intVeryLongMonth = (int) veryLongMonth;
```