
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
"for"   {printer("for"); return FOR;}
"to"    {printer("to"); return TO;}
"while"    {printer("while"); return WHILE;}
"do"    {printer("do"); return DO;}
"if"    {printer("if"); return IF;}
"else"    {printer("else"); return ELSE;}
"end"    {printer("end"); return END;}
"elif"    {printer("else if"); return ELIF;}

{alpha}({alpha}|{digit})*	{ printer("Identifier"); return IDENT;}
[+|-]?{digit}+	 	{ printer("Integer"); return INT;}
[+|-]?{digit}+"."{digit}+	{printer("Float"); return FLOAT;}

" = "    {printer("Equals"); return EQUALS;}
" + "  {printer("Plus"); return PLUS;}
" - " {printer("Minus"); return MINUS;}
" * "  {printer("Times"); return TIMES;}
" / " {printer("Divide"); return DIVIDE;}
"("    {printer("LParen"); return LPAREN;}
")"    {printer("RParen"); return RPAREN;}
" > "    {printer("Greater"); return GREATER;}
" < "    {printer("Less"); return LESS;}
" <= "   {printer("Less or Equals"); return LESS_EQUALS;}
" >= "   {printer("Greater or Equals"); return GREATER_EQUALS;}
" == "   {printer("Equals Comparison"); return EQUALS_EQUALS;}
" != "   {printer("Not Equals"); return NOT_EQUALS;}



" and "    {printer("And"); return AND;}
" or "     {printer("Or"); return OR;}


[ \t\n]+		;  /*when see whitespace, do nothing*/

%%

/* this section contains any procedures you might want to declare, anything
 * that the C fragments above might need.  Like the section at the top,
 * the code you put here will be included, verbatim.
 */

void printer(char* str)
{
  /*printf("      Recognized %s: %s\n", str, yytext);*/
}
