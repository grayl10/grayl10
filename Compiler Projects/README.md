# Compiler Project
**Objectives**

  The primary objective of this assignment   is give students experience with creating software using Regular Expressions and Context Free Grammars. While it is unlikely that students will create a compiler during their professional software development careers, the tools and algorithms learned from this project can be applied to a wide range of data formatting and data processing problems. This project will also increase students' general problem solving and programming skills.

**Overview**    
  The result of this project will be a partial compiler for a simple programming language. Your application will convert high level code into assembly level code. To keep the project manageable (completable), both the high level language and the assembly language will be psuedo-languages. The project will be completed in stages. The first stage is to write regular expressions for Lex to use in creating a lexical anayzer. In other words, break a program into a series of tokens. The second phase is writing a grammar that can be used by YACC to create a parser. Once we can break the program into different types of statments, the third phase is to output assembly code.



  
## High-Level Language
  Our **high-level language** is somewhat similar to Pascal. It will not be a fully executable language. The language does not have input or output. It has no for loops, no multiplication, no comments. The only data type is integers, and variables are not declared (see project part four). The language will be case-sensative (using only small letters makes the regular expressions shorter). It does have loops and decisions. Loops are done with while statements. Decisions can be either if-then or if-then-else statements.

  **Loops**
  
  > **while** *conditions* **do** *statements* **endwhile;**

  **Decisions**

  > **if** *condition* **then** *statements* **endif;**

  > **if** *condition* **then** *statements*  **else** *statements* **endif;**
  
  **Conditions**

  > *operand* *operator* *operand*
  with the following comparison operators
  <     <=      >     >=      <>      ==
    
  **Assignment Statements**
    
  > *variable* **=** *math expression;*
  
  with the following math expressions:

  > **+** **-**



### Assembly Language
  The assembly code created by your project will similar to 8086 Assembly. Since our high level language does not include IO, there is no need for the assembly language to include interupts for IO. Our architecture has eight registers - R1, R2, R3, ...R8. Memory locations can be referenced by name.

  **Mov dest, src**
  > The **MOV** command moves data from the source(**src**) to the destination(**dest**). The destination can be either memory locations or registers. The source can be a register, memory location, or an integer constant. Register-to-register moves are allowed, but direct memory-to-memory moves are not allowed.
  
  **ADD dest, src** and **SUB dest, src**

  > The **ADD** command adds src and dest and places the result in dest. Dest must be a register. Src can be an integer constant, register, or a memory location. The same rules apply for subtraction.
  
  **JMP label**
    
  > The jump command jumps unconditionally to label.
  
  **CMP src**
    
  > The compare command set a flag inside the ALU that can then be used for conditional branching. The first argument of the comparison is hardwired to be R8. The source of the second argument is another register, a memory location, or an integer constant.
  
  **Branch Conditional Label**
    
  > Immediately after using the CMP command, the assembly program can branch based on the result of that comparison.

   > The following possible branch commands in our language:
   
    BEQ - branch if the operands of the comparioson were equal

    BNE - branch not equal

    BLT - branch if R8 was less than src

    BGT - branch if R8 was greater than src

    BLE - branch if R8 was less than or equal to src

    BGE - branch if R8 was greater than or equal to src



# Part 1
  Create a stand-alone Lex file that will convert code composed of our high-level language into a series of tokens. For example, given the input of the left, your Lexical Analyzer should create similar ouput to the block on the right.

    while a < b do                    WHILE
                                      VAR
                                      LT
                                      VAR
                                      DO
      if foo == bar then              IF
                                      VAR
                                      EQ
                                      VAR
                                      THEN
        bob = fred + 99;              VAR
                                      ASSIGN
                                      VAR
                                      PLUS
                                      NUM
                                      SEMI
                                      continue....
      else
        bob = 37;
      endif;
    endwhile;
  
  We do not want the lexical analyzer to ignore unusual characteristics, such as ( or { or *. If it encounters an unknown character, then it needs to output a token. For example, output a **JUNK** token.





# Part 2
  Now that we have tokens, lets check syntax so that we know the parser is doing something, output a notice for every valid statement. When your parser finds a syntax error, output an error message with a line number. Given the input on the left, your parser should output notices similar to those on the right.

    while a < b do                          valid assignment
      if foo > bar then                     valid assignment
        bob = fred + 99;                    valid assignment
      else                                  valid if then else
        bob = 37;
      endif;
    endwhile;                               valid while


  **Suggestions:**

  Your first task will be to get your previous Lex file to work with YACC. So, start by declaring all the tokens in your YACC file. Run "yacc -d" on that file to create y.tab.h . Change your lex file so that it includes that y.tab.h file and change your Lex file so that instead of "printf("IF\n");" it has "return IF;" .

  Don't try to build the entire grammar at once. Build a grammar rule for simple assignments, like "bob = joe;" then see if you can build a rule to find multiple statements, like "bob = joe; fred = 99;". Then try to match complex math expressions like "a = b + 99;" and "a = b + c + d - 77;"

  Once you can recognize multiple valid assignments, try while loops that have assignments inside the loop. I would save if-then and if-then-else for last.


# Part 3
  Now that we can find valid assignment statments and valid loops, output assemby code that matches those statements.
  I suggest you start with assignment statements. Take a statment like "a=b+c+d;" and draw the parse tree that your grammar creates for that input. Also, write out the assembly that matches that code. Then figure out how each branch of the parse tree matches the assembly. That tells you what each rule should output.
  I thought while loops were easier to create than if-then or if-then-else. Once you figure out a template for while loops, then if-then should be similar. if-then-else was a bit of a pain.
  Make sure your project can handle an if-then after another if-then. In other words, the labels you use for the first if-then should be different than the labels for the second if-then. Hint: use a counter.
  You do NOT have to correctly create labels for nested if-then or nested while loops. You should still output valid assembly, but your labels might not be correct. (YACC has a way to do that, but it is beyond the scope of this project.)
  Given the input on the left your project should create assembly code similar to that on the right.

    total = 0;                                          MOV R1, 0
                                                        MOV total, R1
    fib = 5;                                            MOV R1, 5
                                                        MOV fib, R1
    while fib > 0 do                            wtop 1: MOV R8, fib
                                                        MOV R7, 0
                                                        CMP R7
                                                        BLE end1
      total = total + fib;                              MOVE R1, total
                                                        ADD R1, fib
                                                        MOV total, R1
      fib = fib - 1;                                    MOV R1, fib
                                                        SUB R1, 1
                                                        MOV fib, R1
                                                        JMP wtop1
    endwhile;                                      end1:





