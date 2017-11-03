%{

/*
 * ========================================================================
 *
 * cp4parser.y ---- A simple version of our parser for the Slic language
 *        which should match the regular expressions of our language
 *        using the tokens defined in our flex scanner. This
 *		    iteration additionally should successfully build a
 *		    symbol table for the variables defined in the data
 *		    data section of an input Slic program
 *
 * Programmer ---   Avery Hall
 *
 * ========================================================================
 */

#include <stdio.h>
#include <stdlib.h>

%}

%union{
   char  *cptr;
   int    ival;
   float  rval;
}

%token        RWMAIN
%token        RWDATA
%token        RWALGORITHM
%token        RWEXIT
%token        RWINTEGER
%token        RWREAL
%token        RWIF
%token        RWELSE
%token        RWCOUNTING
%token        RWUPWARD
%token        RWDOWNWARD
%token        RWTO
%token        RWWHILE
%token        RWREAD
%token        RWPRINT
%token        RWEND
%token <cptr> VARNAME
%token        SEMICOLON
%token        COLON
%token        COMMA
%token        COMMENT
%token        ADDOP
%token        SUBOP
%token        MULTOP
%token        DIVOP
%token        MODOP
%token        LTOP
%token        LEQOP
%token        GTOP
%token        GEQOP
%token        EQOP
%token        NEQOP
%token        ANDOP
%token        OROP
%token        NOTOP
%token        RPAREN
%token        LPAREN
%token        RSQBRAC
%token        LSQBRAC
%token        ASSIGNOP
%token        CARRIAGERETURN
%token        FLTCONST
%token        STRCONST
%token        INTCONST
%token        NEWLINE
%token        IGNORE


%%

prog          : mainstmt datasect algrsect endmainstmt
              ;

mainstmt      : RWMAIN SEMICOLON
              ;

endmainstmt   : RWEND RWMAIN SEMICOLON
              ;

datasect      : RWDATA COLON decstmtlist
              | RWDATA COLON
              ;

decstmtlist   : decstmt decstmtlist
              | decstmt
              ;

decstmt       : typename COLON decitemlist SEMICOLON
              ;

typename      : RWREAL
              | RWINTEGER
              ;

decitemlist   : decitem COMMA decitemlist
              | decitem
              ;

decitem       : VARNAME
              | VARNAME LSQBRAC INTCONST RSQBRAC
              ;

algrsect      : RWALGORITHM COLON statementlist
              ;

statementlist : statement statementlist
              | statement
              |
              ;

statement     : RWEXIT SEMICOLON
              | varref ASSIGNOP expr SEMICOLON
              | whilestmt statementlist endwhilestmt
              | countupstmt statementlist endcountstmt
              | countdownstmt statementlist endcountstmt
              | ifstmt statementlist endifstmt
              | elsestmt statementlist
              | readstmt
              | printstmt
              ;

varref        : VARNAME
              | VARNAME LSQBRAC expr RSQBRAC
              ;

whilestmt     : RWWHILE expr SEMICOLON
              ;

endwhilestmt  : RWEND RWWHILE SEMICOLON
              ;

countupstmt   : RWCOUNTING VARNAME RWUPWARD expr RWTO expr SEMICOLON
              ;

countdownstmt : RWCOUNTING VARNAME RWDOWNWARD expr RWTO expr SEMICOLON
              ;

endcountstmt  : RWEND RWCOUNTING SEMICOLON
              ;

ifstmt        : RWIF expr SEMICOLON
              ;

elsestmt      : RWELSE SEMICOLON
              ;

endifstmt     : RWEND RWIF SEMICOLON
              ;

readstmt      : RWREAD varref SEMICOLON
              ;

printstmt     : RWPRINT printlist SEMICOLON
              ;

printlist     : printitem COMMA printlist
              | printitem
              ;

printitem     : expr
              | STRCONST
              | CARRIAGERETURN
              ;

expr          : expr ANDOP bool
              | expr OROP bool
              | NOTOP bool
              | bool
              ;

bool          : bool LTOP exp
              | bool LEQOP exp
              | bool GTOP exp
              | bool GEQOP exp
              | bool EQOP exp
              | bool NEQOP exp
              | exp
              ;

exp           : exp ADDOP term
              | exp SUBOP term
              | term
              ;

term          : term MULTOP factor
              | term DIVOP factor
              | term MODOP factor
              | factor
              ;

factor        : SUBOP unit
              | unit
              ;

unit          : LPAREN expr RPAREN
              | number
              ;

number        : INTCONST
              | FLTCONST
              | varref
              ;


%%

int yyerror()
{
   printf("Called yyerror()\n");
   return;
}
