/* ********************************************************************* */

/* The code between the %{ ... %} brackets below will be placed at the top
 * of the C file that bison creates.  It is a place to put includes and declarations
 * that are best done at the top of the file.
 */


%{

#include<stdio.h>
#include<stdlib.h>


void yyerror(const char* s) {
  fprintf(stderr, "%s\n", s);
};

int yylex();  // forward declaration of yylex, provided by flex

void parseprint(char*);  // forward declaration of printing function

%}

/* Next is the list of tokens this expects from the lexical analyzer.  We also specify
 * for tokens that are binary operations whether they are left-associative or right-associaive.
 * a left-associative operation is one where if we see a - b - c we prefer the interpretation
 * (a - b) - c over a - (b - c).
 */

%token INT
%token FLOAT
%token IDENT

%token EQUALS
%token GREATER
%token LESS

%token LPAREN
%token RPAREN
%left PLUS
%left MINUS
%left TIMES
%left DIVIDE

%token FOR
%token WHILE
%token DO
%token END
%token IF
%token ELSE
%token TO

%token AND
%token NEWLINE


%%

/* After the %% divider we put the grammar rules, which are similar to the CFG grammar rules we
 * will work with in class.  There are a few extra features, that just simplify the specification
 * of the grammar. The LHS of the rule is on the left, followed by a colon.  Then the RHS is to the right.
 * additional rules follow, one per line, with a semi-colon marking the end of a set of rules for a given LHS
 */

S:     L                 // First rule allows a sequence of assignment statements of any length
|      L S
;
L:     END
|      E1 END
|      assignments
|      comparison
|      forLoop
|      if
|      whileLoop
;

/* ARITHMETIC EXPRESSIONS */
E1:    E1 PLUS E1
|      E1 MINUS E1
|      E2
;
E2:    E2 TIMES E2
|      E2 DIVIDE E2
|      E3
;
E3:    INT
|      FLOAT
|      IDENT
|      LPAREN E1 RPAREN
;

/* STATEMENTS */

expression:   assignments expression
|             forLoop expression
|             arithmetic expression
|             whileLoop expression
|             if expression
|             /* empty */
;

assignments:     assign     // First rule allows a sequence of assignment statements of any length
|                assign assignments
;
assign:     IDENT EQUALS E1 END         { parseprint("assign -> id = something"); }
;

forLoop:      FOR IDENT EQUALS INT TO INT DO expression END   { parseprint("for loop"); }
;

whileLoop:    WHILE comparison DO expression END  { parseprint("while loop"); }
;

if:     IF comparison DO expression else { parseprint("if - else"); }
;

else:   ELSE DO expression END
|       END
;


/* COMPARISON */
comparison:     E1 compare E1              {parseprint("comparison");}
|               comparison AND comparison  { parseprint("comparison"); }
;
compare:      GREATER
|             LESS
|             GREATER EQUALS
|             LESS EQUALS
|             EQUALS EQUALS
|             GREATER LESS  /* not equal*/
;


/* TO FIX LATER*/
arithmetic:   E1  /*{ parseprint("arithmetic"); }*/
;

/*line:     '\n'  { parseprint("new line"); }
; */



%%

/* After the next %% divider, we put the code at the end.  I included a printing function, just in case, but
 * the biggest item here is a main to do the parsing. Bison builds a function called yyparse, which parses
 * input, calling the yylex function provided by Flex to get the next token.  If yyparse returns zero, then
 * the parse worked correctly to the end of input.  Other values indicate different problems with the parse.
 */


void parseprint(char* str)
{
  printf("             PARSED: %s\n", str);
}


int main() {
  fprintf(stderr, "Enter statements/expressions to parse:\n");
  int res = yyparse();
  if (res == 0)
    fprintf(stderr, "Successful parsing.\n");
  else if (res == 1)
    fprintf(stderr, "Parsing failed due to incorrect input.\n");
  else if (res == 2)
    fprintf(stderr, "Parsing failed due to lack of memory.\n");
  else
    fprintf(stderr, "Weird value: %d\n", res);
}
