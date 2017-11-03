/*
 * ========================================================================
 *
 * cp4main.c ---- A simple main program used to determine whether parsing in
 *                bison was successful or not.
 *
 * Programmer --- Avery Hall
 *
 * ========================================================================
 */

#include "y.tab.h"
#include <stdio.h>

/*
 * ========================================================================
 * main()
 * ========================================================================
 */

int main()
{
   if (yyparse())
      printf("Parse failed.\n");
   else
      printf("Parse succeeded.\n");

   return(0);

}
