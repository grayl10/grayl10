# Compiler Project
  **Objectives**

  > The primary objective of this assignment   is give students experience with creating software using Regular Expressions and Context Free Grammars. While it is unlikely that students will create a compiler during their professional software development careers, the tools and algorithms learned from this project can be applied to a wide range of data formatting and data processing problems. This project will also increase students' general problem solving and programming skills.

  > **Overview**    
    The result of this project will be a partial compiler for a simple programming language. Your application will convert high level code into assembly level code. To keep the project manageable (completable), both the high level language and the assembly language will be psuedo-languages.
    The project will be completed in stages. The first stage is to write regular expressions for Lex to use in creating a lexical anayzer. In other words, break a program into a series of tokens. The second phase is writing a grammar that can be used by YACC to create a parser. Once we can break the program into different types of statments, the third phase is to output assembly code.

  > **The High-Level Language**
    Our pseudo-high-level language is somewhat similar to Pascal. It will not be a fully executable language. The language does not have input or output. It has no for loops, no multiplication, no comments. The only data type is integers, and variables are not declared (see project part four). The language will be case-sensative (using only small letters makes the regular expressions shorter).
    It does have loops and decisions. Loops are done with while statements. Decisions can be either if-then or if-then-else statements.
  
   **Loops**

      the following format:
      **while** *conditions* **do** *statements* **endwhile;**

  **Decisions**

      the following formats:
      **if** *condition* **then** *statements* **endif;**
      **if** *condition* **then** *statements* **else** *statements* **endif;**
  
  **Conditions**
      the following format:
      *operand* *operator* *operand*

      valid comparison operators in our language:
      <   <=    >   >=    <>    ==
    
  **Assignment Statements**
      the following format:
      *variable* **=** *math expression;*

      valid math expressions in our language:
        +   -




  > **The Assembly Language**
    The assembly code created by your project will similar to 8086 Assembly. Since our high level language does not include IO, there is no need for the assembly language to include interupts for IO.
    Our architecture has eight registers - R1, R2, R3, ...R8. Memory locations can be referenced by name.

  **Mov dest, src**
    The **MOV** command moves data from the source(**src**) to the destination(**dest**). The destination can be either memory locations or registers. The source can be a register, memory location, or an integer constant. Register-to-register moves are allowed, but direct memory-to-memory moves are not allowed.
  
  **ADD dest, src**
  **SUB dest, src**
    The **ADD** command adds src and dest and places the result in dest. Dest must be a register. Src can be an integer constant, register, or a memory location. The same rules apply for subtraction.
  
  **JMP label**
    The jump command jumps unconditionally to label.
  
  **CMP src**
    The compare command set a flag inside the ALU that can then be used for conditional branching. The first argument of the comparison is hardwired to be R8. The source of the second argument is another register, a memory location, or an integer constant.
  
  **Branch Conditional Label**
    Immediately after using the CMP command, the assembly program can branch based on the result of that comparison.

    The following possible branch commands in our language:
      BEQ - branch if the operands of the comparioson were equal
      BNE - branch not equal
      BLT - branch if R8 was less than src
      BGT - branch if R8 was greater than src
      BLE - branch if R8 was less than or equal to src
      BGE - branch if R8 was greater than or equal to src



## Part 1
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




