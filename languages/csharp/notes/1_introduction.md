# Introduction To C#

- C# serves as a general purpose cross-platfrom language that supports both object-oriented and functional programming paradigms.
- It can be used to build apps that run on desktops, mobile devices, and the web, as well as games, and even PowerShell cmdlets
- it is the main language iused for .NET development
- it is a typed language


## Hello World

```cs
Console.WriteLine("Hello World");
```

## C# Syntax

***;*** -> end of every line
**{ }** -> used for code blocks
**( )** -> used for parameters and expressions
**[ ]** -> used for arrays and attributes
**" "** -> used for strings
**//** -> single line comments
**/* */** -> multi-line comments
**.** -> used for member access and decimal points

```cs
Console.WriteLine("Please enter your name: ");
string name = Console.ReadLine();
Console.WriteLine("Hello " + name);
```

## The Project Structure

- ***\bin*** -> contains compiled files and runtime components
- ***\obj*** -> contains intermediate files during compilation
- ***\Properties*** -> contains assembly information and other settings
- ***Program.cs*** -> contains the main entry point of the application
- ***[ProjectName].csproj*** -> contains project configuration and dependencies


