/*
 * ========================================================================
 *
 * cp5main.c ---- A simple main program that includes code for building the
 *                the symbol
 *
 * Programmer --- Avery Hall
 *
 * ========================================================================
 */

#include "symtab.h"
#include "y.tab.h"
#include <stdio.h>

extern struct symboltable symtab;

/*
 * ========================================================================
 * main()
 * ========================================================================
 */

int main()
{
   if (yyparse()) {
     printf("Parse failed.\n");
   }


   int i;
   for(i = 0; i < symtab.size; ++i) {
     printf("%d\n", i);
   }


   return(0);
}
