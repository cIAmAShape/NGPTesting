# Intro to Bash

Bash (Bourne-Again SHell) is a command-line interpreter, shell, and scripting language used almost ubiquitously across Unix-base and many macOS systems. Much of the function of bash is based around managing an operating system. Created by Brian Fox in around 1988, BASH has since received continuous development [throughout its history](https://developer.ibm.com/tutorials/l-linux-shells/) and to the present. 

Bash is a very helpful language to learn. It provides a very powerful and direct way to communicate with your computer without using a GUI. However, its power is also a weakness: there are no "undo" buttons when moving, removing, copying, or otherwise manipulating files or data. It is also ***not*** a good "general purpose" language - it lacks advanced data structures, has primative error handling, and its use cases are very limited. Always write bash scripts with this in mind. This guide will definietly not cover *everything*, as that is impossible to do in a single, small-scale excersize. If you are interested further in more complicated bash topics, the greatest place to start is [the official bash documentation](https://www.gnu.org/savannah-checkouts/gnu/bash/manual/bash.html).

It is recommended not to learn bash as your first programming "language" - rather, use it as a supplement to another language you already know. Bash (and sh) is a "command-line interpreter and shell" first and a "language" second.  


## The very basics: Handling and printing output

The best place to start when learning bash is expriementing with how bash handles input and output. Not only do you learn how to print to screen, but it gives you a taste of the *power* than bash has. If you go to the ***hello*** subdirectory, you will notice a simple file titled hello.sh. To run this, simply type
```
 $ sh hello.sh
```
Note that the proper file extension for a bash script is *".sh"*. This is not strictly neccesary for the script to run, but it marks the file as a *shell script*, or a script executed by the Unix/macOS/whatever shell interpreter. The file extension is moreso used so that the user or reader knows the intended use of the file. Some programmers might even use a *".bash"* extension to be more specific. 

Once you have run the script, it should print something like this to terminal:

```
Hello World!
...
...
...
...
...
Goodbye, World!
```
If you take a look at the contents of the file, you will notice it uses the "echo" command to print to the screen. This is not the only way print output - we will discuss more on this in the **String Manipulation** section. 



This is nice and all, but not very interesting. There is so much more we could be doing with this file.

Let's say, for example, we want to save this information to a file. That's easy! We can use the ">" operator to send the contents to any file(s) of our choice. **But be warned,** as this operator will *overwrite* all of the contents of any file with that name. If we try to send the output of this file to an existing file titled "**important-data-do-not-delete.txt**", then congratulations! We have just overwritten some important data. Hope you had a backup!

Now, let's actually try to send some output somewhere. As mentioned before, we can redirect the output of hello.sh by doing
```
sh hello.sh > output.txt
```
If the file output.txt did not exist before, now it does! Taking a look inside of that new file will most definietly have the output you are looking for. But say we instead want not to *overwrite* and file, but *add information to the end* of a file? We can do that to, with the concationation ">>" operator:
```
sh hello.sh >> output.txt
```
We have just added to the end of the file. This is especially useful if you, say, need to sort and add data from multiple data files to a centralized file for easy reading. 

There is one last output-manipulation operator which is perhaps the **most important** one to know: the "|" or "pipe" operator. It allows you to take standard ouput *(stdout)* from one bash script/command and use it as standard input *(stdin)* for another. I like to think of it as "sending" the output from once place directly into another. For example, if we wanted to count how many words are printed to the screen when running `hello.sh`, we could "pipe" the printed output into `wc`, a command that counts words: 
```
sh hello.sh | wc -w
#Notice the -w flag. It specifics to wc to count only words and nothing else (it can count lines, bytes, characters, etc.)
```
Note that pipes can be stacked as many times as you want. You can take the output from `command1 | command2` and directly pipe it to `command3`, all in one line! `command1 | command2 | command3`. There are (obviously) more commands than just `wc`, of which we will discuss in **String Manipulation**

## Variables, Parameters, and Flags

Variables in bash are quite a bit different than many other programming languages. In general, there are three primary variable types: **Scalar Variables**, **Array Variables**, and **Environment Variables**. 

### Scalar Variables

Scalar variables are what comes to mind when we think about the most basic variables, such as strings or integers. They hold only *single* values. The format to declare a scalar variable is shown below:
```
#!/bin/bash

my_string="This is a string"
my_num=3
```
Notice that *there is **no** whitespace* between the variable name and the value. This is important; with whitespace, bash would (for example) read `my_num = 3` as attempting to run a command named `my_num` with `=` and `3` as *parameters*, not assigning them as a *value* in a variable. 

This is also a good time to mention variable types. In bash all variables are generally *untyped* unless declared explicitly. In the example above, the system actually treats `my_num` as a string, not an integer. This can be especially annoying when we need to perform arithmetic on a variable. Bash also *does not* natively support floats. More on this in the **Arithmetic** section.

To refrence a variable at any part in your code, use the `$` symbol in combination with a *brace* `{}` to keep the variable "encapsulated", like so: . 
```
#!/bin/bash

my_string="This is a string"
my_num=3
echo "My string is ${my_string} and my number is ${my_num}"
```
Note that encapsulation is not strictly neccesary, but highly recommended. Without it, bash will attempt to read all characters past the `$` symbol (excluding spaces) as the name of the variable. So if you do not have whitespace between where you are trying to print the variable and the next part of the string, it will fail.
```
echo "$my_string123"  #Results in an error, as the variable is not findable. 
echo "$my_string 123"  #Echoes "my_string 123" to screen (with whitespace)
echo "${my_string}123"  #Echoes "my_string123" to screen
```


You can also "declare" a variable to be a specific type using the `declare --flag` operation, if you wish to fully type your variables. I will not go into fine detail with variable decleration for scalar variables, but if you wish to know more then [this page](https://tldp.org/LDP/abs/html/untyped.html) from **The Linux Documentation Project** has a great exploration of this topic.

|flag| Description of flag operation |
|----|---------------------------------------------------------------------------------------------------|
| -i | Declare a variables as an integer. Arithmetic expressions inherently handled and evaluated.|
| -a | Declare as an indexed array. This is assumed if not declared. More on this in **Array Variables** |
| -A | Declare as an associative array. More on this in **Array Variables**|
| -r | -r: Declare a variable as read-only, meaning its value cannot be changed.|
| -x | -x: Mark a variable for export to the environment. More on this in **Environment Variables**|
| -p | -p: Print the attributes and value of each variable. Used for checking variable types|

### Array Variables

In addition to typical scalar variables, bash can also handle 1-dimensional arrays. Since everything including arrays are technically untyped (unless they are declared beforehand), an "array" in bash can feature both strings *and* integers. While one could definietly argue that this would fail the strict definition of an array (I personally would not disagree), remember: **everything is untyped to begin with**. Those "integers" in the array are really just strings.

Arrays as variables are typically declared using the following format:
```
my_array=(data1 data2 data3 data4)  #Space between data points,
```
If not explicitly declared using a `declare` operator (like in the example above), bash assume the array is an indexed array. Much like 

### Environment Variables



### Special Variables and Declerations

 (include the shebang here)



## Comparisons and If/Else statements

## Loops

## String Manipulation 

## Functions

## So, why do we use Bash anyway? When is it used in HPC?

## The challenge

## Additional Notes, Reading, and Cheatsheet
[The Linux Documentation Project](https://tldp.org/)
