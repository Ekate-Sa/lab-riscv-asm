# lab-riscv-asm
ifmo uni / syntacore llc "SoC design" course work

## Задание
| Номер варианта  | Задание | Передача параметров |
| --- | --- | --- |
| 8  | Найти сумму элементов главных диагоналей(N = 4, M = 4)  | По ссылке |

## Ход работы
1. Написана программа на Си - **main.c**. Из репозитория с примером выполнения ЛР-1 был взят **makefile**.
2. 
```
katesaal@katesaal-virtual-machine:~/work/lab1-riscv-asm$ PATH=/home/katesaal/riscv-tools/riscv-gcc-10.2.0-gbbc9263-210318T1412/bin:$PATH
katesaal@katesaal-virtual-machine:~/work/lab1-riscv-asm$ make -f makefile
```
3. В результате выполнения были получены :
- **lab1.elf** - результирующий исполняеый файл
- **lab1.dump** - дамп-файл программы на Си
