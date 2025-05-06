all:
	bison -d cizim.y
	flex cizim.l
	gcc lex.yy.c cizim.tab.c -o cizim