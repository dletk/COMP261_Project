
/* ********************************************************************* */

/* The code between the brackets below will be included verbatim at the
 * top of the C file flex creates.  This includes any needed include
 * files and a few declarations...
 */

%{
#include<stdio.h>
#include<stdlib.h>


// Included to allow information about tokens from Bison file to propagate to here
#include "myLang.tab.h" // Leave commented out until Milestone Two


void printer(char*);  // Forward declaration of printing function


%}


/* After the verbatim code, we may declare names that correspond to
 * common patterns that will show up in the rules.  A lot may be
 * done here, but I typically keep this simple, and let the rules
 * handle everything else
 */

arithmetics [+, -, *, /, (, )]
digit	[0-9]
alpha	[_,a-z,A-Z]


/* Below the %% are the "rules" for the lexical analyzer.  They are
 * a sequence of regular expressions on the left, and a fragment
 * of C code on the right.  The code may do anything you like, but
 * any procedures you need for it should be declared at the bottom
 * of the file.
 */
%%

{alpha}({alpha}|{digit})*	{ printer("Identifier"); return IDENT;}
[+|-]?{digit}+	 	{ printer("Integer"); return INT;}
"="                     { printer("Equals");return EQUALS;}
({alpha}({alpha}|{digit})*)"+"   {printer("Identifier Plus");}
([+|-]?{digit}+)"+"   {printer("Integer Plus");}
[+|-]?{digit}+"."{digit}+"+"   {printer("Float Plus");}
({alpha}({alpha}|{digit})*)"-"   {printer("Identifier Minus");}
([+|-]?{digit}+)"-"   {printer("Integer Minus");}
[+|-]?{digit}+"."{digit}+"-"   {printer("Float Minus");}
({alpha}({alpha}|{digit})*)"*"   {printer("Identifier Times");}
([+|-]?{digit}+)"*"   {printer("Integer Times");}
[+|-]?{digit}+"."{digit}+"*"   {printer("Float Times");}
({alpha}({alpha}|{digit})*)"/"   {printer("Identifier Divide");}
([+|-]?{digit}+)"/"   {printer("Integer Divide");}
[+|-]?{digit}+"."{digit}+"/"   {printer("Float Divide");}
"("   {printer("LParen");}
")"   {printer("RParen");}
[+|-]?{digit}+"."{digit}+			{printer("Float");}

{alpha}({alpha}|{digit})*"="(({alpha}({alpha}|{digit})*)|([+|-]?{digit}*))			{printer("Assignment");}

[ \t\n]+		;  /*when see whitespace, do nothing*/



%%

/* this section contains any procedures you might want to declare, anything
 * that the C fragments above might need.  Like the section at the top,
 * the code you put here will be included, verbatim.
 */

void printer(char* str)
{
  printf("      Recognized %s: %s\n", str, yytext);
}
