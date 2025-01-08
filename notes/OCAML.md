# ***Syntax***
## ***Table-of-Contents:***
1. Variables and Constants
2. Functions 
-----------------------------------

$$ Variables-and-Constants $$

`Let` ***binding:***
> Used to define a variable or constant:
>> ```
>> (*for comments*)
>> let x = 5 ;; (* binds x to 5 *) 
>> let name = "Ocaml" ;; (* binds name to "Ocaml" *)
>>```
> `let` creates an ***immutable*** binding by default. To make it ***mutable***, use `ref`

------------------------------------------
$$ Functions $$

***Function Definition:***
> Functions are defined using `let` and `in`
>>```
>>let add x y = x + y;;
>>```
> ***Anonymous Function (Lambdas):***
>>```
>> let f = fun x -> x + 1 ;;
>>```
> ***Pattern Matching*** 
>>```
>> let rec factorial n = 
>> match n with
>> | 0 -> 1
>> | _ -> n * factorial(n - 1) (*_ means default essentially or remaining*)
>>```
------------------------------------------
$$ Conditionals $$

> ***If-Else:***
>>```
>> let x  = 10 in
>> if x > 5 then "Greater" else "Smaller" ;;
>>```
---------------------------------------
$$ Tuples $$

***Tuple Definition:***
>
>>```
>> let t = (1, "hello", 3.14) ;;
>>```
> Ocaml tuples are accessed via pattern matching or destructuring
>>```
>> let (a, b, c) = t ;; (* a = 1, b = "hello", c = 3.14)
>>```
-------------------------------------------
$$ Lists $$

***List Definition:***
>>```
>> let lst = [1; 2; 3; 4] ;; (*semicolon separates elements in a list*)
>>```
> ***List Operations:***
>> 
>>```
>> let head = List.hd lst ;; (* gets the first element of the list *)
>> let tail = List.tl lst ;; (* gets the list excluding the first element *) 
>>```
> ***List Cons Operator (to build a list):***
>>```
>> let lst2 = 0 :: lst ;; (* prepends 0 to the list lst *)
>>```
> ***List Comprehension:***
>>```
>> let lst2 = List.map (fun x -> x * 2) lst ;; (* doubles each element in lst *)
>>```
-----------------------------------------
$$ Records $$

***Record Definition:***
>>```
>> type person = { name: string; age: int};;
>> let p = { name = "Andrew", age = 19 } ;;
>>```
> ***Accessing Record Fields:***
>>```
>> let name = p.name ;;
>> let age = p.age ;;
>>```
> More about what we *can* do with them later...
-----------------------------------------
$$ Arrays $$

***Array Definition:***
>>```
>> let arr = [|1; 2; 3 |] ;; (* array of integers *)
>>```
> ***Array Access:***
>>```
>> let x = arr.(0) ;; (* accesses the first element *)
>>```
-----------------------------------------
$$ Type-Definitions $$

***Type Definition:***
>>```
>> type person = { name: string; age: int } ;;
>>```
> ***Variant Types (Algebraic Data Types, e.g., Option):***
>>```
>> type 'a option = None | Some of 'a ;; 
>>```
-----------------------------------------
$$ Modules $$

***Modules Definition:***
>>```
>> module Math = struct
>>   let add x y = x + y ;;
>> end ;;
>>```
> ***Accessing a Module's Function:***
>>```
>> module Make = functor (M: sig val n: int end) -> struct
>>  let multiply_by_n x = x * M.n ;;
>> end ;;
>>```
-----------------------------------------
$$ Exception-Handling $$

***Defining and Rasining Exceptions:***
>>```
>> exception MyException as string ;;
>> raise (MyException "Something went wrong") ;;
>>```
>***Handling Exceptions:***
>>```
>> try
>> (* code that might raise an exception *)
>>  let x = 1 / 0 in
>>  print_endline "No Exception"
>> with
>> | Division_by_zero -> print_endln "Caught division by zero"
>>```
-----------------------------------------
$$ Loops $$

> ***For Loop:***
>>```
>> for i = 1 to 10 do
>> print_endline (string_of_int i)
>> done ;;
>>```
> ***While Loop:***
>>```
>> let i = ref 0 ;;
>> while !1 < 10 do
>>  print_endline (string_of_int i)
>>  i := !i + 1
>> done ;;
>>```
-----------------------------------------
$$ Pipes-and-Composition $$

> ***Pipes (`|>`operator)***:
>>```
>> let result = 5 |> (fun x -> x + 1) |> (fun x -> x * 2) ;;
>>```
-----------------------------------------
$$ Array-Iteration $$

>***Array Iteration:***
>>```
>> Array.iter (fun x -> print_endline (string_of_int x)) arr ;;
>>```
-----------------------------------------
$$ Comments $$

>***Single-Line Comment:***
>>```
>> (* This is a single-line comment *)
>>```
>***Multi-Line Comment:***
>>```
>> (* This is a multi-line
>>      comment *)
>>```
-----------------------------------------
$$ Module-Aliases $$

>***Alias of Module:***
>>```
>> module M = Math ;;
>> M.add 2 3 ;;
>>```
-----------------------------------------
$$ Type-Parameters (Generic-Types) $$

***Polymorphnic Types:***
>>```
>> let id x = x ;; (* 'x' can be of any type, returning x itself *)
>>```
