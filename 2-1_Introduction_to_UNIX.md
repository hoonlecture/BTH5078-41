# Introduction 

## What is Unix ?
- Multiuser operating system
- Linux: free version of this type of operating system
  - Red Hat Enterprise Linux, Ubuntu, and CentOS
- Used on high-end workstations, database servers, webservers and managing shared resources 
- Standard features include: Security, reliability, scalability
  - Can supports 100s of users at a time

## What is a terminal?

A terminal is the program that is used to access files on your laptop/computer that is sitting in front of you (local machine) or access to files on a supercomputer in a different location (remote machine). You can access a terminal on a Mac or Windows machine as described below. **in this class we are going to use local machine**

## Terminal Terminology
When working in a terminal, it is helpful to know some basic terminology for when asking for help or describing a problem.
![terminal.jpg](https://www.dropbox.com/s/4x172zmyhl3jify/terminal.jpg?dl0&raw=1)

- **Prompt**: The text next to where you type your commands prompts can be modified to include addtional information like hostname or current folder location
- **Command**: the function or script you are trying to run.
- **Argument**: added to a Command to modify the output there is always a space between a command an the argument
- **Standard Out**: the result of a command
- **Standard Error**: the error of a failed command


# Getting started

Lets start with opening the terminal. 
Type in the two following commands and hit the ↵ (`Enter`) key


| *Command* | *Function*              | *Syntax/example usage*               |
|-----------|-------------------------|--------------------------------------|
| `mkdir`   | make directory          | `mkdir` DIRECTORY                    |
| `pwd`     | print working directory | `pwd`                                |
| `cd`      | change directory        | `cd`~ or `cd` #home directory        |
|           |                         | `cd` .. #previous (parent directory) |
| `ls`      | list contents           | `ls` [OPTIONS] DIRECTORY             |

This section will introduce you to some basic file/directory navigation

## **mkdir – Make Directory Command**

Let’s make a new directory (folder) called unixTutorial. To create a directory, the `mkdir` (`m`a`k`e `dir`ectory) command can be used. Type in the next command and hit the ↵ (`Enter`) key. Notice there is a space between the mkdir command and the filename we supply to the mkdir command

```bash
mkdir unixtutorial
```

**NOTE:** Unlike PC/Mac folders, in Unix it is better to not include spaces in names for directories. (the underscore “_” can be used to replace any spaces you might want).

Once you hit return, you will not see anything it will just give you a new prompt and if you try to type it again you will get an error message. Go ahead and try this if you want.

```bash
$ mkdir unixTutorial
mkdir: cannot create directory ‘unixTutorial’: File exists
```

## **pwd – Path of Working Directory**

At this point you might be feeling like you are completely blind because you can’t see the result of what you did. So let me teach you a few more commands and change that. This command will tell you where you are.

```bash
$ pwd
```

In my case this returns the following results. what do you see on your terminal

```bash
/Users/seunghyunkang
```

What this is telling me is that I am in a directory named seunghyunkang which is in a directory named User.

## **`cd` – Change Directory**

You will recall we made a directory called unixTutorial above. We can change to that directory using the `cd` command.

```bash
$ cd unixTutorial
```

Now if we type the path of working directory command `pwd` we get the following

```bash
$ pwd
/Users/seunghyunkang/unixTutorial
```

I am now in a directory called unixTutorial which is a subdirectory of seunghyunkang which is a subdirectory of Users.

To change back to the previous directory we can type in the full path like so.

```bash
$ cd /Users/seunghyunkang/
```

or we can use `..` which refers to the directory above the one you are in and type this.

```bash
$ cd ..
```

**NOTE:** Present directory is represented as `.` (dot) and parent directory is represented as `..` (dot dot).

Try this out with the following commands

```bash
$ cd
$ cd unixTutorial
$ pwd
$ cd ..
$ pwd
$ cd ..
$ pwd
$ cd ..
$ pwd
$ cd
$ cd unixTutorial
$ pwd
```

**TIP**: You can type in first few letters of the directory name and then press `Tab` to auto complete rest of the name (especially useful when the file/directory name is long). This only works when there are unique matches for the starting letters you have typed. If there is more than one matching files/directories, pressing `Tab` twice will list all the matching names.

# **File creation and editing**

---

## **`ls` (list) command**

Now that we know how to move between directories, The contents of a directory can be viewed using `ls`. If no directory name is provided then `ls` will list all the contents of the present directory.

```bash
$ ls
$ ls .
$ ls DIRECTORY
```

Everyone should currently be in their unixTutorial directory that they just created, which is empty so the `ls` command will return you to a new prompt without anything written to standard out.

## nano - Text editor more like a GUI

Nano opens up and will feel like a typical text editor you are familiar with. Arrow keys can be used navigate the text. Below are some additional shortcuts.

To exit nano you type this series of keys – hit ctr x press y for yes to save and hit enter. Nano tells you how to exit along with many of the following shortcuts at the bottom of your screen and will step you through how to exit and save.

| *Command*    | *Function*              |
|--------------|-------------------------|
| `ctrl+o`     | save file               |
| `ctrl+x`     | close file              |
| `ctrl+/`     | go to end of the file   |
| `ctrl+a`     | go to start of the line |
| `ctrl+e`     | go to end of the line   |
| `ctrl+c`     | show line number        |
| `ctrl+_`     | go to line number       |
| `ctrl+w`     | find matching word      |
| `alt+w`      | find next match         |
| `ctrl+`      | find and replace        |

##### **Exercise: Copy and paste the following text into a file named myFirstfile.txt**

```
The greatest challenge is sifting through all the data that is generated by the
simulation.  In fact, it is impossible.  Impossible because to record every
event everywhere in the artificial universe would take more hard drive space
than was physically possible to create given Earth's dwindling resources.
Therefore, my life's greatest achievement was to encode a method to filter the
data, so only the most relevant events related to what we want is recorded. In
our case, that means space travel.  But not just any space travel, space travel
between galaxies.
```
Start by copying the text above using your mouse then in a terminal use nano to create a file named myFirstfile.txt

```bash
$ nano myFirstfile.txt
```
Paste your text and then hit `ctr x` press `y` for yes to save and hit `enter`, which will return you to the prompt. This will save the file with the text in it.


## VIM

`vim` is another text editor that when you are more comfortable with the unix command line, it will be worth your time to learn. Many first time Unix users type in `vim` to enter the editor and get stuck in the editor as it is less intuitive than nano. I will not go into great detail in this introductory tutorial but want to provide you with resources to explore on your own. There is a command line like feature in this editor that a user can use to execute very powerful text editing functions.

| Vim      | Very Basic Usage                                                             |
|----------|------------------------------------------------------------------------------|
| `esc`    | Hitting escape will take you back to the original state when you opened vim. |
| `i`      | insert mode: In this mode it is possible to add/edit the text                |
| `esc:wq` | hitting escape then typing `:` `w` `q`will write(save) the file and quit     |

Copying and pasting work like other editors as long as you are in the insert mode.

 * [Things-about-vim-i-wish-i-knew-earlier](https://blog.petrzemek.net/2016/04/06/things-about-vim-i-wish-i-knew-earlier/)
 * [Learn-Vim-Progressively](http://yannesposito.com/Scratch/en/blog/Learn-Vim-Progressively/)
 * [Vim-adventures](https://vim-adventures.com/)


# Viewing file contents

Easy to remember these commands using this sentence.

A `cat` has a `head` and a `tail`, `more` or `less`

| File/Directory operations |                                |            |
|---------------------------|--------------------------------|------------|
| `cat`                     | catalog file contents          | `cat`FILE  |
| `head`                    | show first few lines of a file | `head`FILE |
| `tail`                    | show last few lines of a file  | `tail`FILE |
| `more`                    | view file (with less options)  | `more`FILE |
| `less`                    | view file (with more options)  | `less`FILE |
| `seq`                     | write a sequence of numbers    | `seq`1110  |


## `seq` - short for sequence of number

To fully appreciate the commands for viewing the contents of a file let’s create a file with the numbers from 1 to 100. Execute the following command and put it into a file named `numSeq.txt`

```bash
$ seq 1 1 100
#copy the output then use nano
$ nano numSeq.txt
#make sure there is no extra empty lines at the end of the file.
```


## `cat` - concatenate and print files

This command will print out the entire file. Try it out with the numSeq.txt file. You should see all 100 numbers print to the screen.


## `head` - head of the file

This command will give you the first 10 lines of a file. Try it out with the numSeq.txt file.

```bash
$ head numSeq.txt
$ head -n 5 numSeq.txt
```
The `-n` parameter tells the `head` function to printout in this case 5 lines instead of the default 10 lines.


## `tail` - tail of the file

This command will give you the last 10 lines of a file. Try it out with the numSeq.txt file.
```bash
$ tail numSeq.txt
$ tail -n 5 numSeq.txt
```


## `more` - command to step through a file one screen length at a time using the spaceabar.hit`q`to quit the file before reaching the end.
```bash
$ more numSeq.txt
```


## `less` - similar to the more command but lets you scroll backwards as well.
```bash
$ less numSeq.txt
```
| less navigation    |                 |
|--------------------|-----------------|
| `q`                | quit            |
| `u`                | up one screen   |
| `d` or `space bar` | down one screen |
| `g`NUM             | got to line NUM |


# Renaming, copying and deleting files and directories

| File/Directory operations |                        |                        |
|---------------------------|------------------------|------------------------|
| *Command*                 | *Function*             | *Syntax/example usage* |
| `touch`                   | create file            | `touch`FILE            |
| `mkdir`                   | make directory         | `mkdir`DIRECTORY       |
| `rmdir`                   | remove empty directory | `rmdir`DIRECTORY       |
| `rm`                      | remove file(s)         | `rm`FILE               |
| `cp`                      | copy files/directories | `cp`SOURCE DESTINATION |
| `mv`                      | move files/directories | `mv`SOURCE DESTINATION |


## `touch`command

This command is used to quickly create many empty files.

```bash
$ touch AA.txt
$ touch BB.txt
$ touch CC.txt
$ touch 1.txt
$ touch 2.txt
$ touch 3.txt
```
Now if you use the `ls` command the standard output will be
```bash
$ ls
1.txt 2.txt 3.txt AA.txt BB.txt CC.txt
```
You can also create multiple files using this command.
```bash
touch DD.txt EE.txt GG.txt 4.txt 5.txt 6.txt
```
The standard output now returns
```bash
$ ls
1.txt 2.txt 3.txt 4.txt 5.txt 6.txt AA.txt BB.txt CC.txt DD.txt EE.txt GG.txt
```

## **`mkdir`- Make Directory**

We have already discussed the mkdir command but here is a brief review. For this section of the tutorial we are going to make four folders named Numbers, Letters, Deleteme and Deleteme2.

```bash
$ mkdir Numbers
$ mkdir Letters
$ mkdir Deleteme
$ mkdir Deleteme2
$ mkdir Deleteme3
$ ls
```
Let’s also put a couple of files in the Deleteme and Deleteme2 folders. We can accomplish this by using the touch command and a local path to where we want the file. Up to this point we have put all the files into the same folder we are in. In this example we will create an empty file named deleteme.txt and deleteme2 in the subfolders Deleteme and Deleteme2.
```
$ touch Deleteme/deleteme.txt
$ touch Deleteme/deleteme1.txt
$ touch Deleteme2/deleteme2.txt
$ touch Deleteme2/deleteme3.txt
```
You can verify its there by using the ls command
```bash
#ls will show you the subfolder Deleteme and Deleteme2 exists
$ ls

#ls Deleteme will show you the contents of the subfolder Deleteme
$ ls Deleteme
$ ls Deleteme2
$ ls Deleteme3
```

**Warning about deleting files and directories**
In Unix there is no undo command. If you delete a file it is gone. There is no trash bin. The next two commands are very powerful commands and cna lead to unfortunate losses if not used with care. With that said you can only delete files you have created. So it is impossible to delete someone else files without permission.

## **`rmdir` - Remove Directory**

This command can remove an empty directory

Let’s remove the extra Deleteme2 directory using this command
```bash
$ ls
$ rmdir Deleteme3
$ ls
```
The ls commands show the before and after usage of this command.

Now try to delete the Deleteme folder
```
$ rmdir Deleteme2
```
It will return
```
rmdir: Deleteme2: Directory not empty
```
In order to remove this directory with the rmdir command you would have to delete all the files and folders in the directory. However, you can use the remove (rm) command instead.

## `rm` - Remove file

In this example, we will remove the file deleteme3.txt in the Deleteme2 directory.
```bash 
$ ls Deleteme
$ ls Deleteme2
$ rm Deleteme2/deleteme3.txt
$ ls Deleteme2
$ ls Deleteme
```

##### **Exercise: Remove the deleteme2.txt file.**
Now, having deleted both files from Deleteme2 directory we can use the rmdir command to delete the folder.
```bash
$ rmdir Deleteme2
```
If however, we do not want to go through and delete all the files we can also use the rm command to delete a folder without emptying it.
```bash
$ ls
$ rm -r Deleteme
$ ls
```
The `-r` is a parameter that attempts to remove directories as well as other types of files


## `mv` - move command

Move is used to move files to a different location and to rename a file.

If we look in our unixTutorial directory using the ls command There should only be the following files and folders.

```bash
1.txt           3.txt           5.txt           AA.txt           CC.txt           EE.txt           Letters         myFirstfile.txt
2.txt           4.txt           6.txt           BB.txt           DD.txt           GG.txt           Numbers         numSeq.txt
```
Let’s clean this up by moving all of the numbered txt files into Numbers and all the Letter txt files into Letters
```bash
$ mv 1.txt Numbers
$ mv 2.txt 3.txt Numbers
$ mv 4.txt 5.txt 6.txt Numbers
```
As you can see you can move more than one file at a time into a folder by listing multiple files before the directory you wish to move them to.

**Exercise: Put all the letter files into the Letters directory**
The second function for the mv command is to rename a file. If you look inside the Letters directory, you will see that one of the letter.txt files is not in sequence.
```bash
$ ls Letters
AA.txt BB.txt CC.txt DD.txt EE.txt GG.txt
```
If we wanted to rename GG.txt to FF.txt we would do the following.
```bash
$ cd Letters
$ ls
$ mv GG.txt FF.txt
$ ls
```

## `cp` - copy command

The `cp` command can be used to duplicate a file
```bash
$ ls  
$ cp myFirstFile.txt mySecondfile.txt
$ ls
```
You can verify it is a copy by `cat`ing the file, or you can use `more` or `less`
```bash
$ cat myFirstfile.txt
$ cat mySecondfile.txt
```
You can also use the `-l` long format parameter that modifies the `ls` command to get more information about the files such size, date of creation, and ownership. As you can see with the following commands in the 5th column, the files are the same size (563 bytes).
```
$ ls -l myFirstfile.txt mySecondfile.txt
```
To copy a folder you have to add the `-r` parameter to copy recursively (copy all files in a folder and subfolders of subfolders etc)
```bash
$ cp -r Letters Letters_copy
```
Verify to yourself that the contents of the folder was copied correctly
```bash
$ ls -l Letters
$ ls -l Letters_copy
```


# Counting, Sorting and Redirecting Output

Up to this point we have learned individual commands that give you roughly the same kind of ability as you would using your mouse in in IOS or Windows operating systems. From this point forward however, you will start to understand the power of being able to combine commands on the command line to execute more complex tasks and save time.

| `wc`                | word count                             | `wc`FILENAME                                   | `wc` FILENAME |
|---------------------|----------------------------------------|------------------------------------------------|---------------|
| `sort`              | sort files                             | `sort` FILE1 `>` SORTED_FILE1                  |               |
| `uniq`              | display unique lines                   | `uniq` [OPTIONS] INFILE `>` OUTFILE            |               |
| cmd1 `\|` cmd2      | send output of cmd1 to cmd2            | cat FILENAME `\|` sort `\|` uniq               |               |
| `tr`                | translate or transliterate a file      | `tr` [OPTIONS] “STRING1” “STRING2” `<` INFILE  |               |
| `shuf`              | Generate random permutations           | `shuf` FILENAME                                |               |

| **PIPES, REDIRECTS** |                             |
|----------------------|-----------------------------|
| *Command*            | *Function*                  |
| cmd `<` file         | use file as input           |
| cmd `>` file         | write output to file        |
| cmd `>>` file        | append output to file       |
| cmd1 `\|` cmd2       | send output of cmd1 to cmd2 |

## `wc` - word count

This function will give you the number of lines, the number of words and the number of characters in a file.

The file numSeq.txt for example we created earlier and we know there are 100 lines and 100 words (ie numbers). Use the following command to confirm this and to also determine the number of characters this file has.
```bash
$ wc  numSeq.txt
```
The wordcount (`wc`) output can be modified with parameters to give you just the line count (`-l`), just the word count (`-w`) or just the character count (`-c`).
```bash
$ wc -l numSeq.txt
$ wc -c numSeq.txt
$ wc -w numSeq.txt
```
**Note** The `-c` assumes that the characters are single byte if you are using multibyte characters you will want to use `-m`

## `tr` - translate

This command can take any individual character and replace it with another character

For example, it can be useful to replace the output of the `seq` command with a comma separate list of numbers. This command is a little different than other commands as it requires that the command requires standard output as the input rather than a filename. To do this, we will use the `<` redirect symbol.
```bash
$ tr '\n' ',' < numSeq.txt
```
The above command means translate new line characters \n into commas take input < from file numSeq.txt

Your output will look like this.
```bash
1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,
```


## | - Pipe redirect

Pipe can be found on different keyboards as shown below by the yellow boxes. Pipe `|` is extremely powerful tool. It can take the output of one command and pass it to the next command without having to write to a file in between.

For example we could repeat the last `tr` command by using the pipe `|` as follows.
```bash
$ cat numSeq.txt | tr '\n' ','
```
The above command first uses `cat` to put the contents of the file to standard out and then pipe’s `|` it to the translate `tr` command. If you are having trouble finding the `|` on the keyboard see the yellow highlighted keys below.

![KEYBORAD1](https://user-images.githubusercontent.com/86759935/128298596-c064f3a4-66a4-4b06-a96d-a57a337aa18c.png)
![KEYBOARD2](https://user-images.githubusercontent.com/86759935/128298676-d80bd4df-f613-4eb4-917c-431ddd346c52.png)


## `shuf` - shuffle

**NOTE:** If you are running this in IOS rather than on a linux machine you will need to use `gshuf` or `alias shuf=gshuf` for the above commands to run properly.

**NOTE2:** You may need to install core utilities using `brew install coreutils`

Generate random permutations of lines of the file supplied.

Let’s use this command to shuffle our numSeq.txt file and then output into a new file using another redirect symbol `>`. Let’s repeat this process but instead of overwriting the new file we append `>>` the standard output to the numSeqRandom.txt file.
```bash
$ shuf numSeq.txt > numSeqRandom.txt
$ shuf numSeq.txt >> numSeqRandom.txt
```
The first command will shuffle the contents of numSeq.txt and then redirect `>` the standard output to a new file named numSeqRandom.txt. The second command will append the same content to the file rather than over writing the file. Let’s confirm we have 200 randomly sorted lines.
```bash
$ wc -l numSeqRandom.txt
```

##### **Exercise: Use `nano` to add 1e-10 and 1e10 to the top of the numSeqRandom.txt file. We will show you how to sort all the numbers in the next section.**


## `sort` - sort a file by lines, alpha numerically

We can use this command to sort the shuffled numSeqRandom.txt file
```bash
$ sort numSeqRandom.txt | head
1
1
10
10
100
100
11
11
12
12
```
Above, we sorted the numSeqRandom.txt file and then piped the output to head showing the first 10 lines rather than all 200 lines.

Unfortunately, this isn’t sorted numerically as we expect. To do that we use the `-n` parameter.
```bash
1
1
1e-10
1e10
2
2
3
3
4
4
```
This is closer but the `-n` parameter doesn’t handle the scientific notation in order to correctly sort this, we will need to use the `-g` general numerical sort parameter.
```bash
$ sort -g numSeqRandom.txt | head
1e-10
1
1
2
2
3
3
4
4
5
```
That worked but how do we remove the duplicates.


## `uniq` - Unique command to remove duplicates of adjacent (presorted) lines

`uniq` will remove duplicate lines but only if the file is sorted first.
```bash
$ wc numSeqRandom.txt
$ uniq numSeqRandom.txt | wc -l
```
The above comamnd fails with the same number or close to the same number of line as the original file.
```bash
$ wc numSeqRandom.txt
$ sort -g numSeqRandom.txt | uniq | wc -l
```
However, when we sort first we remove all the duplicate numbers and should have 102 lines.


## Counting lines `uniq -c`

If we wanted to know how many of each number there was in this file we could use the `-c` parameter for the `uniq` command.
```bash
# sort -g numSeqRandom.txt | uniq -c | head
   1 1e-10
   2 1
   2 2
   2 3
   2 4
   2 5
   2 6
   2 7
   2 8
   2 9
```
The first number represents the number of times the line was found (its frequency).

##### **Exercise: Identify the 5 most used words in myFirstfile.txt. (Hint: cat,tr,sort, uniq, sort, tail, |)**
```bash
$ cat myFirstfile.txt  | tr ' ' '\n' | sort | uniq -c | sort -n | tail -n 4
  4 is
  4 space
  5 the
  5 to
```
If that last line looks intimidating, build it up one command at a time and see what each output produces.
```bash
$ cat myFirstfile.txt | head
$ cat myFirstfile.txt | tr ' ' '\n' | head
$ cat myFirstfile.txt | tr ' ' '\n' | sort | head
$ cat myFirstfile.txt | tr ' ' '\n' | sort | uniq -c | head
$ cat myFirstfile.txt | tr ' ' '\n' | sort | uniq -c | sort -n | head
$ cat myFirstfile.txt | tr ' ' '\n' | sort | uniq -c | sort -n | tail -n 4
```
It is through this method that a long Unix ‘one-liner’ can be created. By looking at the standard output and seeing what each command does you can tweek each command using parameters until you get the desired output.

# Find and Replace

| `grep`     | search a pattern                                  | `grep` [OPTIONS] “PATTERN” FILENAME                 |
|------------|---------------------------------------------------|-----------------------------------------------------|
| `sed`      | stream editor                                     | `sed 'OPERATION/REGEXP/REPLACEMENT/FLAGS'` FILENAME |
| `*`        | variable used to represent many characters        | `ls` *.txt                                          |
| `?`        | variable used to represent any one character      | `ls` ?.txt                                          |

## `grep` - global regular expression print

This command will replace your find command in a text document.
```bash
$ grep "space" myFirstFile.txt
$ grep "space" myFirstFile.txt | wc
2
```
This will print the lines where it finds the word “space” in it.

If you wanted to print every occurrence of the word then you can use the ‘-o’ parameter. You might want to use that to count the number of times a word occurred in a file.
```bash
$ grep -o "space" myFirstFile.txt
$ grep -o "space" myFirstFile.txt | wc
```
Some other commonly used parameters.
| `-i`      | ignore case                                            |
|-----------|--------------------------------------------------------|
| `-v`      | invert matching, i.e. select non-matching lines        |
| `-c`      | print only the count of matching lines                 |
| `-n`      | prefix the output with line number                     |


## `history` - gives a history of recently used Unix commands

Browse all your previously used commands by typing `history` on your terminal (typically, last 500 commands will be saved in this file).

It is often convenient to find a command or oneliner by searching your history. Try these oneliners.
```bash
$ history | grep myFirstFile | tail -n 5
$ history | grep -i myfirst | tail -n 5
$ history | grep -i myfirst | grep -v space | grep uniq
```
You can also recall your previous commands by pressing ↑ or ↓ arrow keys.


## `?` and `*` - variables to represent one or many chracters

First, let’s undo our sorting of numbers and letters by using the * variable that represents all letters repeated for as many times
```bash
$ mv Numbers/*.txt .
$ mv Letters/*.txt .
$ ls
```
Here is an easier way using variables. You will notice that all the numbers have a single character and all the letters have two characters. We can use the `?` variable to represent any single character. Therefore, all the Number files will have this pattern: `?.txt` and all the Letter text files will have this pattern: `??.txt`

First, verify this with the `ls` command
```bash
$ ls ??.txt
$ ls ?.txt
```
Then repeat the sorting using the `mv` command
```bash
$ mv ??.txt Letters
$ mv ?.txt Numbers
```
And we are done.


## `sed` - stream editor
Most common use of `sed` is to substitute text, matching a pattern. The syntax for doing this in `sed` is as follows:
```bash
$ sed 'OPERATION/REGEXP/REPLACEMENT/FLAGS' FILENAME
```
Let’s replace the word galaxies with the word universes in myFirstFile.txt
```bash
$ sed 's/galaxies/universes/g' myFirstfile.txt
```
We can either write it to a new file like this.
```bash
$ sed 's/galaxies/universes/g' myFirstfile.txt > myFirstfile2.txt
```
or we can edit the file inplace using the `-i`, meaning the change will take effect in the file without the generation of a new file.
```bash
$ sed -i 's/galaxies/universes/g' myFirstfile.txt
```

# The Unix manual pages and soft links

## `man` - manuel

This command will provide a description of a unix command and list the parameters that can be used to modify its behavior. To exit the manual for a command you press `q` like you do in the `less` command.
```bash
$ man ls
$ man cat
$ man more
$ man less
```

## `ln` - link

Creating a symbolic link can be very useful when you need the same file in multiple locations. This command will create a link to the file without actually duplicating the file. All the unix commands will still work on the symbolic link as if it were a copy of the file in the folder.
```bash
$ cd Numbers
$ ls
$ ln -s ../myFirstFile.txt
$ ls
$ ls -l
```
You can see that you now have a new “file” which is really a pointer that is linked to the real file which is up one directory (`.. `)

**NOTE**
  
  * The rm utility removes symbolic links, not the files referenced by the links.
  * Remote copying of files and folders may copy only the symbolic link and not the file it is linked to unless specified as a parameter. 
```bash
$ rm myFirstFile.txt
```
This will not affect the file in unixTutorial but will remove it from the subfolder Numbers.


# Further Reading

  * [Summary of Unix commands](https://bioinformaticsworkbook.org/Appendix/Unix/UnixCheatSheet.html#gsc.tab=0)
