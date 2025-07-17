# Intro to Bash

Bash (Bourne-Again SHell) is a command-line interpreter, shell, and scripting language used almost ubiquitously across Unix-base and many macOS systems. Much of the function of bash is based around managing an operating system. Created by Brian Fox in around 1988, BASH has since received continuous development [throughout its history](https://developer.ibm.com/tutorials/l-linux-shells/) and to the present. 

Bash is a very helpful language to learn. It provides a very powerful and direct way to communicate with your computer without using a GUI. However, its power is also a weakness: there are no "undo" buttons when moving, removing, copying, or otherwise manipulating files or data. Always write bash scripts with this in mind. 


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
If you take a look at the contents of the file, you will notice it uses the "echo" command to print to the screen. This is not the only way print output - we will discuss more on this in the **strings and string searching** section. 

This is nice and all, but not very interesting. There is so much more we could be doing with this file.

Let's say, for example, we want to save this information to a file. That's easy! We can use the ">" operator to send the contents to any file(s) of our choice. **But be warned,** as this operator will *overwrite* all of the contents of any file with that name. If we try to send the output of this file to an existing file titled "**important-data-do-not-delete.txt**", then congratulations! We have just overwritten some important data. Hope you had a backup!

Now, let's actually try to send some output somewhere. As mentioned before, we can redirect the output of hello.sh by doing
```
sh hello.sh > output.txt
```
If the file output.txt did not exist before, now it does! Taking a look inside


## Variables

## Arithmetic

## Comparisons and If/Else

## String Searching

## Loops

## So, why do we use Bash anyway? When is it used in HPC?

## The challenge
