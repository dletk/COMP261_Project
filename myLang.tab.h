/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INT = 258,
     FLOAT = 259,
     IDENT = 260,
     EQUALS = 261,
     GREATER = 262,
     LESS = 263,
     EQUALS_EQUALS = 264,
     NOT_EQUALS = 265,
     GREATER_EQUALS = 266,
     LESS_EQUALS = 267,
     LPAREN = 268,
     RPAREN = 269,
     PLUS = 270,
     MINUS = 271,
     TIMES = 272,
     DIVIDE = 273,
     FOR = 274,
     WHILE = 275,
     DO = 276,
     END = 277,
     IF = 278,
     ELSE = 279,
     TO = 280,
     AND = 281,
     OR = 282,
     NEWLINE = 283
   };
#endif
/* Tokens.  */
#define INT 258
#define FLOAT 259
#define IDENT 260
#define EQUALS 261
#define GREATER 262
#define LESS 263
#define EQUALS_EQUALS 264
#define NOT_EQUALS 265
#define GREATER_EQUALS 266
#define LESS_EQUALS 267
#define LPAREN 268
#define RPAREN 269
#define PLUS 270
#define MINUS 271
#define TIMES 272
#define DIVIDE 273
#define FOR 274
#define WHILE 275
#define DO 276
#define END 277
#define IF 278
#define ELSE 279
#define TO 280
#define AND 281
#define OR 282
#define NEWLINE 283




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

