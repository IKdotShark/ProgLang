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
Для некоторых например вместе с ./a.out требуются аргументы для запуска:
* В программе lab1_3.c мы задаем аргументы, которые в последующем просто выводятся;
* В программе lab1_4.c мы в аргументах задаем название файла для последующего выполнения программы;
и так далее.
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
For some, for example, along with ./a.out, arguments are required to run:
* In the lab1_3.c program we specify arguments that are subsequently simply output;
* In the program lab1_4.c we specify the name of the file in the arguments for subsequent execution of the program;
and so on.
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
