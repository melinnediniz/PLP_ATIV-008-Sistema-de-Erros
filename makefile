calc: calc.y calc.l
	bison -d calc.y
	flex -o calc.l.c calc.l
	gcc -o calc calc.l.c calc.tab.c -ll -lm 

clean:
	rm -f *.c *.h calc

