/*
 * ========================================================================
 * 
 * cp5.h -------- A header file to be used in conjunction with our bison
 *		  parser; contains #defines and global declarations.
 * 
 * Programmer --- Avery Hall
 * 
 * ========================================================================
 */

#define SYMTYPE_INT 		0
#define SYMTYPE_REAL 		1

#define SYMTYPE_REAL_ARRAY 	2
#define SYMTYPE_INT_ARRAY 	3

struct symbol {
	char *var_name;
}
