# ProgLang
## Ru description
Здесь будут лабораторные работы по языкам программирования и методам трансляции.
Запустить те или иные программы из лабораторных работ:
Зайти в директорию интересующей нас лабораторной работы.
Скачать программу после используя команду в терминале (Linux) вписать команду (до этого установив gcc, командой на Ubuntu
```sudo apt install gcc```
 или
 ``` sudo apt-get install gcc```, на старых версиях Ubuntu
 , в других дистрибутивах обратиться к документации):
```
gcc <name_of_file>
./a.out
```

Так же будет полезно установить `flex` и `bison`.

Для некоторых например вместе с ./a.out требуются аргументы для запуска:
* В программе lab1_3.c мы задаем аргументы, которые в последующем просто выводятся;
* В программе lab1_4.c мы в аргументах задаем название файла для последующего выполнения программы;
и так далее.

В некоторых других случаях запуск программы осуществляется черзе команду `make <name_of_file>` в частности это относится к 3-ой лабораторной работе

---
__Что выполняет та или иная программа:__
* lab1_1.c - Выводит строку “hello world” в терминал;
* lab1_2.c - Решает линейное уравнение ax+b=c, коэффициенты a, b, с которого задаются при выполнении;
* lab1_3.c - Выводит в терминал набор аргументов вызова исполняемого файла, переданных при вызове программы;
* lab1_4.c - Выводит в терминал содержимое текстового файла, название которого передается при вызове исполняемого файла;
* lab1_5.c - Выводит в начало текстового файла запрошенную при работе программы информацию и после дописать содержимое файла входных данных.
* lab2_1.c - Генерирует массив из рандомных целых чисел и выводит его в консоль в прямом порядке, и записывает в файл в обратном порядке.
* lab2_2.c - Принимает размер произвольного массива, создает его, заполняет случайными числами с плавающей точкой в интервале (0, 1). Выводит этот массив в консоль и записывает в файл в отсортированном виде.
* lab2_3.c - Считывает из входного файла данные о товарах. Сортирует товары по цене и выводит отсортированные данные в выходной файл. (вид строки входного файла <name_of_item> <prize>, где <name_of_item> без пробелов)
* lab2_4.c - Реализовать набор функций по работе со стеком. Для реализации стека воспользоваться структурой: следующий элемент стека хранит ссылку на предыдущий и значение.

   · Реализовать добавление значения в стек.
  
   · Реализовать извлечение значения из стека.

   · Реализовать просмотр верхнего значения стека.

   · Учесть при работе возможность переполнения стека.
  
* lab2_5.c - Вычисляет значение выражения, записанного в постфиксной (обратной польской) записи, считываемого из входного файла. Считать, что выражение может содержать только цифры и знаки «+», «-», «*» и «/». Использовать функции работы со стеком из lab2_4.c
* lab2_6.c - Переводит инфиксной записи арифметического выражения в постфиксную. Исходное арифметическое выражение состоит из цифр, знаков «+», «-», «*», «/» и скобок. При реализации воспользоваться предиктивным анализатором и схемой трансляции. Для реализации программы следует на ее основе

   · составить схему трансляции

   · заменить леворекурсивную грамматику равнозначной праворекурсивной

   · реализовать предиктивный анализатор по составленной грамматике

Используя flex и bison (lab3):
* lab3_1 - Написать программу для генератора лексических анализаторов, выводящую в консоль переданный токен.
* lab3_2 - Описать грамматику, позволяющую вычислять значения арифметических выражений, состоящих из произвольного конечного количества целых чисел и знаков «+» и «-»
* lab3_3 - Описать грамматику, позволяющую проводить трансляцию арифметических выражений, состоящих из вещественных чисел, знаков «+», «-», «*», «/» и скобок из инфиксной записи в постфиксную.
* lab3_4 - Организовать вычисление выражений с использованием абстрактного синтаксического дерева. Для этого описать необходимые структуры и функции, осуществляющие построение абстрактного синтаксического дерева при разборе, а также его рекурсивных обход и вычисление арифметического выражения. В качестве основы грамматики использовать синтаксис арифметических выражений из лекции 3 (Слайд 9).
>При этом типы узлов дерева разбора примут вид:
>```
>%union {
>struct ast *a;
>double d;
>}
>```
>Для реализации необходимо написать код для прототипов функций:
>```
>/* build an AST */
>struct ast *newast(int nodetype, struct ast *l, struct ast *r);
>struct ast *newnum(double d);
>/* evaluate an AST */
>double eval(struct ast *);
>/* delete and free an AST */
>void treefree(struct ast *);
>```
>Где структуры для указателей описаны как:
>```
>/* nodes in the Abstract Syntax Tree */
>struct ast {
>int nodetype;
>struct ast *l;
>struct ast *r;
>};
>struct numval {
>int nodetype; /* type K */
>double number;
>};
>```

Используя ассемблера lc-3(lab4):
* lab4_1 - Написать и запустить программу, выводящую строку Hello World.
* lab4_2 - Написать и запустить программу, принимающую строку пользователя и выводящую ее в терминал.
* lab4_3 - Написать и запустить программу, реализующую сортировку заданного пользователем целочисленного массива из 10 целых чисел.
* lab4_4 - Написать и запустить программу, реализующую сортировку заданной пользователем строки из 10 цифр.
* lab4_5 - Реализовать с использованием flex и bison программу, транслирующую простые инструкции ветвления и цикла в ассемблер lc-3.
## Eng description
Here will be labs of Programming languages and broadcast methods.
Run certain programs from laboratory work:
Go to the directory of the laboratory work that interests us.
Download the program after using the command in the terminal (Linux) enter the command (having previously installed gcc, using the command on Ubuntu
```sudo apt install gcc```
or
```sudo apt-get install gcc``` on old versions Ubuntu
, in other distributions refer to the documentation):
```
gcc name_of_file
./a.out
```

It will also be useful to install `flex` and `bison`.

For some, for example, along with ./a.out, arguments are required to run:
* In the lab1_3.c program we specify arguments that are subsequently simply output;
* In the program lab1_4.c we specify the name of the file in the arguments for subsequent execution of the program;
and so on.

In some other cases, the program is launched using the `make name_of_file` command, in particular this applies to the 3rd laboratory work

---
__What does this or that program do:__
* lab1_1.c - Outputs the string “hello world” to the terminal;
* lab1_2.c - Solves the linear equation ax+b=c, coefficients a, b, from which are specified during execution;
* lab1_3.c - Outputs to the terminal a set of arguments for calling the executable file, passed when calling the program;
* lab1_4.c - Outputs the contents of a text file to the terminal, the name of which is transmitted when the executable file is called;
* lab1_5.c - Outputs the information requested during program operation to the beginning of the text file and then appends the contents of the input data file.
* lab2_1.c - Generates an array of random integers and outputs it to the console in forward order, and writes it to a file in reverse order.
* lab2_2.c - Takes the size of an arbitrary array, creates it, fills it with random floating-point numbers in the interval (0, 1). Outputs this array to the console and writes it to a file in sorted form.
* lab2_3.c - Reads product data from the input file. Sorts products by price and outputs the sorted data to the output file. (type of input file line <name_of_item> <prize>, where <name_of_item> without spaces)
* lab2_4.c - Implement a set of functions for working with the stack. To implement a stack, use the structure: the next element of the stack stores a link to the previous one and a value.

    · Implement adding a value to the stack.
  
    · Implement popping a value from the stack.

    · Implement viewing of the top value of the stack.

    · Take into account the possibility of stack overflow when working.
  
* lab2_5.c - Calculates the value of an expression written in postfix (reverse Polish) notation read from the input file. Consider that the expression can only contain numbers and the signs “+”, “-”, “*” and “/”. Use stack functions from lab2_4.c
* lab2_6.c - Converts infix notation of an arithmetic expression to postfix notation. The original arithmetic expression consists of numbers, signs “+”, “-”, “*”, “/” and parentheses. When implementing, use a predictive analyzer and a translation scheme. To implement the program, it should be based on

    · create a broadcast plan

    · replace left-recursive grammar with an equivalent right-recursive one

    · implement a predictive analyzer based on the compiled grammar

  Using flex and bison (lab3):
  
* lab3_1 - Write a program for a lexical analyzer generator that displays the passed token to the console.
* lab3_2 - Describe a grammar that allows you to calculate the values ​​of arithmetic expressions consisting of an arbitrary finite number of integers and the signs “+” and “-”
* lab3_3 - Describe a grammar that allows you to translate arithmetic expressions consisting of real numbers, signs “+”, “-”, “*”, “/” and parentheses from infix notation to postfix notation.
* lab3_4 - Organize the calculation of expressions using an abstract syntax tree. To do this, describe the necessary structures and functions that construct an abstract syntax tree during parsing, as well as its recursive traversal and calculation of an arithmetic expression. Use the syntax of arithmetic expressions from Lecture 3 (Slide 9) as the basis of grammar.
 In this case, the types of parse tree nodes will take the form:
 ```
 %union {
 struct ast *a;
 double d;
 }
 ```
 To implement it, you need to write code for function prototypes:
 ```
 /* build an AST */
 struct ast *newast(int nodetype, struct ast *l, struct ast *r);
 struct ast *newnum(double d);
 /* evaluate an AST */
 double eval(struct ast *);
 /* delete and free an AST */
 void treefree(struct ast *);
 ```
 Where the structures for pointers are described as:
 ```
 /* nodes in the Abstract Syntax Tree */
 struct ast {
 int nodetype;
 struct ast *l;
 struct ast *r;
 };
 struct numval {
 int nodetype; /* type K */
 double number;
 };
 ```
Using lc-3(lab4) assembler:
* lab4_1 - Write and run a program that prints the string Hello World.
* lab4_2 - Write and run a program that takes the user's line and outputs it to the terminal.
* lab4_3 - Write and run a program that implements sorting of a user-specified integer array of 10 integers.
* lab4_4 - Write and run a program that implements sorting of a user-specified string of 10 digits.
* lab4_5 - Implement a program using flex and bison that translates simple branch and loop instructions into lc-3 assembler.
