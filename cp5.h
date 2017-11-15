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

#define ST_INT 		  0
#define ST_REAL 		1

#define SK_SCALAR 	0
#define SK_ARRAY  	1

struct symbol {
	char *varname;
	char kind;
	char type;
	void* address;
	struct val v;
};

struct val {

};

extern struct symbol {

	
}
