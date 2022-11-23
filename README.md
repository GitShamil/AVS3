# 1. соответствие переменных адресам стека
main.c

1) -84[pbp] = argc
2) -88[rbp] = argv[1]
3) -96[rbp] = argv[0]
4) -80[rbp] = argv[2]
4) -72[rbp] = argv[3]
5) -4[rbp] = i
6) -24[rbp] = input
7) -48[rbp] = begin
8) -56[rbp] = end
9) -64[rbp] = time_spent
10) -32[rbp] = output
11) -72[rbp] = accuracy
12) LC0 = max_accuracy
13) LC3 = 1e-15
14) -40[rbp] = rand_number
15) LC6 = 3259.0
16) LC3 = 3.0
17) LC8 = 1e-14
18) -16[rbp] = exp

countExp.s
1) -40[rbp] = accuracy
2) -8[rbp] = exp
3) -12[rbp] = n
4) -24[rbp] = fact

# 2. Использование программы и общая информация
Программа состоит из 2-х единиц компиляции. 1-ая единица это main, вторая countArrayB. 
У программы есть 3 режима работы через консоль
1) ./answer.exe           (- это запуск без параметров argv[1] и тогда будет ввод и вывод в консоль
2) ./answer.exe 1         (- argv[1] = 1 тогда будут данные браться из файла input.txt и класться в output.txt
2.1) ./answer.exe 1 name.txt (- argv[1] = 1 and argv[2] = "name.txt" then data would be got from name.txt and put to ouput.txt)
2.2) ./answer.exe 1 name.txt name2.txt (- argv[1] = 1 and argv[2] = "name.txt" then data would be got from name.txt and put to name2.txt)
3) ./answer.exe 2         (- argv[1] = 2 рандомный ввод и вывод в консоль
Компилировал в ассемблер с такими параметрами
gcc -masm=intel \
    -fno-asynchronous-unwind-tables \
    -fno-jump-tables \
    -fno-stack-protector \
    -fno-exceptions \
    ./code.c \
    -S -o ./code.s



# 3. рефакторниг
1) удалил бесполезную часть с конца файла
2) убрал бесполезную работу когда сначала кладут в rax потом в rsi из rax, я стал класть сразу в rax
3) во время больших циклов клал i,j,h в регистры вместо того чтобы каждый раз дергать из стека
main.s. Я хранил данные в регистрах вместо того чтобы постоянно обращаться к стеку.
1. r12d = i.       (-4[rbp] in main)
countexp.s
2. xmm3 = 1.0  
3. xmm4 = 4.0  
4. xmm5 = accuracy
5. xmm6 = exp
6. xmm7 = fact
это улучшило производительность. Я вообще не обращался к стеку в функции countExp, все было в регистрах.
4) убрал бесполезные строки когда в регистр записывается значение которое там уже было и не могло измениться

# 4. результаты тестов.
![image](https://user-images.githubusercontent.com/113286731/203658080-0fe1cb01-53ff-4713-86ce-9946ba694dac.png)



оптимизационные функция для размера
gcc -masm=intel     -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions             -ffunction-sections -Wl,--gc-sections -Os -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables  -ffunction-sections -Wl,--gc-sections -fno-asynchronous-unwind-tables -Wl,--strip-all  ./name.c     -S -o ./name.s


отимизационные функции для скорости
gcc -masm=intel     -fno-asynchronous-unwind-tables     -fno-jump-tables     -fno-stack-protector     -fno-exceptions            -m64 -Ofast -flto -march=native -funroll-loops   ./name.c     -S -o ./name.s
