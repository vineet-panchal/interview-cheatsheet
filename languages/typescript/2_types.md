# Types In TypeScript

## Built-in Types

TypeScript provides several built-in types to represent common data types.

- `number`: Represents both integer and floating-point numbers.
- `string`: Represents text data.
- `boolean`: Represents true/false values.
- `void`: Represents absence of any type, commonly used for functions that do not return a value.
- `null` and `undefined`: Represent absence of value.
- `any`: Represents any type, opting out of type checking.
- `unknown`: Represents any value but safer than `any`.
- `never`: Represents values that never occur (e.g., function that always throws).

```typescript
let num: number = 42;
let floatNum: number = 3.14;
let negativeNum: number = -10;

let str: string = "Hello, TypeScript!";
let multiLineStr: string = `This is a
multi-line string`;
let concatenatedStr: string = "Hello" + " " + "World";

let flag: boolean = true;
let isFalse: boolean = false;
let comparison: boolean = 5 > 3;

let nothing: void = undefined;
function logMessage(): void {
  console.log("This function returns nothing");
}

let n: null = null;
let u: undefined = undefined;
let maybeUndefined: string | undefined = undefined;
```

## The `any` Type

The `any` type disables type checking and allows any value to be assigned.

```typescript
let anything: any = 5;
anything = "Now a string";
anything = true;
anything = { key: "value" };
anything = [1, 2, 3];
anything = () => console.log("function");

// Accessing properties/methods without type checking
anything.toUpperCase(); // No error, even if anything is not a string
anything.push(4); // No error, even if anything is not an array
```

Use `any` sparingly as it defeats the purpose of TypeScript's type safety. It's useful when migrating JavaScript code or working with dynamic data.

```typescript
// Example: Working with JSON.parse
const jsonString = '{"name": "John", "age": 30}';
const parsed: any = JSON.parse(jsonString);
console.log(parsed.name); // Access properties dynamically
```

## Arrays

Arrays can be typed in two ways:

```typescript
let numbers: number[] = [1, 2, 3, 4, 5];
let strings: Array<string> = ["a", "b", "c"];
let booleans: boolean[] = [true, false, true];

// Multi-dimensional arrays
let matrix: number[][] = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
];

// Array of objects
interface User {
  id: number;
  name: string;
}

let users: User[] = [
  { id: 1, name: "Alice" },
  { id: 2, name: "Bob" },
  { id: 3, name: "Charlie" }
];

// Using array methods with type safety
numbers.push(6); // OK
numbers.push("7"); // Error: Argument of type 'string' is not assignable to parameter of type 'number'

strings.map(s => s.toUpperCase()); // OK
strings.map(s => s.length); // OK, returns number[]
```

Arrays can hold any type if typed as `any[]`:

```typescript
let mixed: any[] = [1, "two", true, { key: "value" }, [1, 2, 3]];
```

## Tuples

Tuples are fixed-length arrays with specified types for each element.

```typescript
let tuple: [string, number];
tuple = ["hello", 10]; // OK
tuple = [10, "hello"]; // Error: Type 'number' is not assignable to type 'string'

// Accessing tuple elements
let name: string = tuple[0];
let age: number = tuple[1];

// Destructuring tuples
let [personName, personAge] = tuple;
console.log(personName, personAge); // "hello" 10
```

Tuples can have optional elements and rest elements:

```typescript
let optionalTuple: [string, number?];
optionalTuple = ["hello"]; // OK
optionalTuple = ["hello", 42]; // OK

// Rest elements in tuples
let restTuple: [string, ...number[]];
restTuple = ["coordinates", 1, 2, 3, 4]; // OK
restTuple = ["point", 10]; // OK

// Named tuples (for better readability)
let person: [name: string, age: number, isEmployed: boolean];
person = ["Alice", 30, true];
```

## Enums

Enums allow defining a set of named constants.

```typescript
enum Color {
  Red,
  Green,
  Blue,
}

let c: Color = Color.Green;
console.log(c); // 1 (default starts from 0)
console.log(Color.Red); // 0
console.log(Color[0]); // "Red" (reverse mapping)
```

You can assign custom values:

```typescript
enum Status {
  Success = 200,
  NotFound = 404,
  ServerError = 500,
}

console.log(Status.Success); // 200
```

String enums:

```typescript
enum Direction {
  Up = "UP",
  Down = "DOWN",
  Left = "LEFT",
  Right = "RIGHT",
}

let move: Direction = Direction.Up;
console.log(move); // "UP"
```

Const enums (compiled away, better performance):

```typescript
const enum Size {
  Small = 1,
  Medium = 2,
  Large = 3,
}

let shirtSize: Size = Size.Medium;
```

## Functions

Functions can have typed parameters and return types.

```typescript
function add(a: number, b: number): number {
  return a + b;
}

const greet = (name: string): void => {
  console.log(`Hello, ${name}!`);
};

function multiply(x: number, y: number): number {
  return x * y;
}

console.log(add(5, 3)); // 8
console.log(multiply(4, 7)); // 28
```

Optional and default parameters:

```typescript
function log(message: string, userId?: string): void {
  console.log(message, userId || "Not signed in");
}

log("User logged in"); // "User logged in Not signed in"
log("User logged in", "user123"); // "User logged in user123"

function multiply(a: number, b: number = 1): number {
  return a * b;
}

console.log(multiply(5)); // 5
console.log(multiply(5, 2)); // 10
```

Rest parameters:

```typescript
function sum(...numbers: number[]): number {
  return numbers.reduce((total, n) => total + n, 0);
}

console.log(sum(1, 2, 3)); // 6
console.log(sum(10, 20, 30, 40)); // 100

function concatenate(separator: string, ...strings: string[]): string {
  return strings.join(separator);
}

console.log(concatenate("-", "a", "b", "c")); // "a-b-c"
```

Function types:

```typescript
let mathFunction: (x: number, y: number) => number;
mathFunction = add;
mathFunction = multiply;
// mathFunction = greet; // Error: void is not assignable to number

interface MathOperation {
  (x: number, y: number): number;
}

let operation: MathOperation = (a, b) => a - b;
```

Function overloads:

```typescript
function format(value: string): string;
function format(value: number): string;
function format(value: string | number): string {
  if (typeof value === "string") {
    return `"${value}"`;
  } else {
    return value.toFixed(2);
  }
}

console.log(format("hello")); // ""hello""
console.log(format(3.14159)); // "3.14"
```

## Objects

Objects can be typed with interfaces or inline types.

```typescript
interface Person {
  name: string;
  age: number;
  isEmployed?: boolean; // optional property
}

const person: Person = {
  name: "Alice",
  age: 30,
};

const employee: Person = {
  name: "Bob",
  age: 25,
  isEmployed: true,
};

// Error: Property 'name' is missing
// const invalidPerson: Person = { age: 20 };
```

Inline type:

```typescript
const car: { make: string; year: number } = {
  make: "Toyota",
  year: 2020,
};

const book: { title: string; author: string; pages?: number } = {
  title: "TypeScript Handbook",
  author: "Microsoft",
};
```

Nested objects:

```typescript
interface Address {
  street: string;
  city: string;
  zipCode: string;
}

interface Company {
  name: string;
  address: Address;
  employees: number;
}

const company: Company = {
  name: "Tech Corp",
  address: {
    street: "123 Main St",
    city: "Anytown",
    zipCode: "12345",
  },
  employees: 100,
};
```

Readonly properties:

```typescript
interface Config {
  readonly apiUrl: string;
  readonly timeout: number;
  debug: boolean;
}

const config: Config = {
  apiUrl: "https://api.example.com",
  timeout: 5000,
  debug: false,
};

// config.apiUrl = "new url"; // Error: Cannot assign to 'apiUrl' because it is a read-only property
config.debug = true; // OK
```

## Advanced Types

### Type Aliases

Type aliases create a new name for a type.

```typescript
type ID = string | number;

let userId: ID = "abc123";
userId = 123;
// userId = true; // Error

type Point = {
  x: number;
  y: number;
};

const origin: Point = { x: 0, y: 0 };
const point: Point = { x: 10, y: 20 };
```

### Union Types

Union types allow a variable to hold one of several types.

```typescript
function printId(id: number | string) {
  console.log("ID:", id);
}

printId(101);
printId("202");

// Type guards
function printIdSafe(id: number | string) {
  if (typeof id === "string") {
    console.log("String ID:", id.toUpperCase());
  } else {
    console.log("Number ID:", id.toFixed(0));
  }
}

printIdSafe("abc"); // "String ID: ABC"
printIdSafe(123); // "Number ID: 123"
```

Discriminated unions:

```typescript
interface Circle {
  kind: "circle";
  radius: number;
}

interface Square {
  kind: "square";
  sideLength: number;
}

type Shape = Circle | Square;

function getArea(shape: Shape): number {
  switch (shape.kind) {
    case "circle":
      return Math.PI * shape.radius ** 2;
    case "square":
      return shape.sideLength ** 2;
  }
}

const circle: Circle = { kind: "circle", radius: 5 };
const square: Square = { kind: "square", sideLength: 10 };

console.log(getArea(circle)); // 78.53981633974483
console.log(getArea(square)); // 100
```

### Intersection Types

Intersection types combine multiple types into one.

```typescript
interface BusinessPartner {
  name: string;
  credit: number;
}

interface Identity {
  id: number;
  name: string;
}

type Employee = BusinessPartner & Identity;

const e: Employee = {
  id: 1,
  name: "John",
  credit: 200,
};

// All properties must be present
// const invalid: Employee = { name: "Jane" }; // Error: missing id and credit
```

Multiple intersections:

```typescript
interface Serializable {
  serialize(): string;
}

interface Loggable {
  log(): void;
}

type SerializableAndLoggable = Serializable & Loggable;

class DataManager implements SerializableAndLoggable {
  serialize(): string {
    return "serialized data";
  }

  log(): void {
    console.log("Logging data");
  }
}
```

### Literal Types

Literal types allow specifying exact values a variable can hold.

```typescript
let direction: "left" | "right" | "up" | "down";

direction = "left"; // OK
direction = "right"; // OK
// direction = "forward"; // Error

function setAlignment(align: "left" | "center" | "right") {
  console.log("Alignment set to:", align);
}

setAlignment("center"); // OK
// setAlignment("justify"); // Error
```

Template literal types:

```typescript
type EventName = "click" | "hover" | "focus";
type EventHandler<T extends EventName> = `on${Capitalize<T>}`;

type ClickHandler = EventHandler<"click">; // "onClick"
type HoverHandler = EventHandler<"hover">; // "onHover"
```

### Nullable Types

By default, `null` and `undefined` are assignable to all types unless `--strictNullChecks` is enabled.

You can explicitly allow null or undefined using union types:

```typescript
let canBeNull: string | null = "hello";
canBeNull = null;
// canBeNull = undefined; // Error with strictNullChecks

let canBeUndefined: string | undefined = "world";
canBeUndefined = undefined;

function processValue(value: string | null | undefined): string {
  return value ?? "default";
}

console.log(processValue("test")); // "test"
console.log(processValue(null)); // "default"
console.log(processValue(undefined)); // "default"
```

### Optional Chaining

Optional chaining allows safe access to nested properties that might be null or undefined.

```typescript
interface Customer {
  name: string;
  address?: {
    street?: string;
    city?: string;
  };
}

const customer: Customer = {
  name: "Bob",
};

console.log(customer.address?.street); // undefined, no error
console.log(customer.address?.city); // undefined, no error

// Chaining with function calls
interface User {
  profile?: {
    settings?: {
      theme?: string;
    };
  };
}

const user: User = {};

console.log(user.profile?.settings?.theme); // undefined

// Optional chaining with arrays
const arr: (string | undefined)[] = ["a", undefined, "c"];
console.log(arr[1]?.toUpperCase()); // undefined
console.log(arr[0]?.toUpperCase()); // "A"

// Optional chaining with method calls
interface Calculator {
  add?: (a: number, b: number) => number;
}

const calc: Calculator = {};
console.log(calc.add?.(5, 3)); // undefined
```

## Summary

TypeScript's type system is rich and expressive, allowing you to write safer and more maintainable code. Understanding these types and how to use them effectively is key to leveraging TypeScript's power. Practice with these examples to become proficient in TypeScript typing.
