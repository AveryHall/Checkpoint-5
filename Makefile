cp5:	cp5.l cp5.y main.c cp5.h
	flex cp5.l
	bison -y -d cp5.y
	gcc -o cp5 main.c lex.yy.c y.tab.c -lfl

cp5.c:
	true

clean:
	rm -f core *.o lex.yy.c y.tab.c y.tab.h cp5 cp5.exe
