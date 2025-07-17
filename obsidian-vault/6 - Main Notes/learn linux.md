2025-07-14 16:03
Status: #baby 
Tags: [[cli]] [[dev]] [[learning]]


# Learn Linux

#### Useful commands

| Command   | Description                                                        | Usage        |
| --------- | ------------------------------------------------------------------ | ------------ |
| `whoami`  | print out the username to the console                              | `whoami`     |
| `expr`    | evaluate an expression and print out the result to the console     | `expr 1 + 3` |
| `history` | Print out the history of commands the user have types in the shell | `history`    |
#### 1 - Terminal

Historically, a `terminal` meant a physical device, essentially a keyboard and a screen, where you can type a command on the keyboard and get an output on the screen.

These days, it's a `terminal emulator`, i.e. a program that can emulate a physical terminal. It's a program that lets the user type commands into a window on a computer.

#### 2 - Shell

If the `terminal` is the program where the user types commands and get outputs, the `shell` is the program that interprets the commands entered.

The main job of the `shell` is to interpret commands and execute them. Shell are often referred to `REPL`, which stands for:

`Read`: read commands
`Eval (Evaluate)`: evaluate commands, even by running other commands on the computer
`Print`: print out the result/output of the commands
`Loop`: give a new prompt to receive new commands, repeat

Shells can also be programming languages, optimized for running other programs or creating small scripts, but not for building large applications.

#### 3 - Variables

To set a variable, `name="Tony"`.
Note that there is no empty space before and after `=` like with Python.

Set these to variables:

```
language="Python"
date="1991"
creator="Guido Van Rossum"
```

What is the command to print out the sentence below to the console? `Python was created by Guido Van Rossum, and first release in 1991.`

Response: `echo "$language was created by $creator, and first release in $date."`

# References

[[Boot dev - Learn Linux]]

[[Bash Documentation]]