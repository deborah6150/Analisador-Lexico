/* Calc lexer
 * Deborah Caroline Rodrigues Oliveira - 17.1.8231
 * Thuane de Souza Espírito Santo - 17.1.8255
 */

import java.util.ArrayList;

%%

%public
%function nextToken
%type Token
%class Calc

%line
%column

%unicode

%eofval{
   return new Token( yyline, yycolumn, TK.EOF);
%eofval}

%state ARR,

%{
       private ArrayList arr;

       private int toInt(String s){
          try{
              return Integer.parseInt(yytext());
          }catch(NumberFormatException e){
              System.out.println("Imossible error converting " + s + " to integer");
              return 0;
          }
       }

%}


identifier = [a-z]+
number = [0-9]+
white =  [ \n\t\r]+ | {comment}
comment = "{-" ~"-}"


%%
<YYINITIAL>{
"--"  !([^]* \R [^]*) \R  {}
// Palavras-reservadas
"main"                      { return new Token(yyline, yycolumn, TK.MAIN); }
"print"                     { return new Token(yyline, yycolumn, TK.PRINT); }
"return"                    { return new Token(yyline, yycolumn, TK.RETURN); }
"'"[^']"'"                  { return new Token(yyline, yycolumn, TK.CHAR, yytext().charAt(1)); }
"data"                      { return new Token(yyline, yycolumn, TK.DATA); }
"new"                       { return new Token(yyline, yycolumn, TK.NEW); }

/* Literais */
[a-z][a-zA-Z0-9_]*          { return new Token(yyline, yycolumn, TK.ID, yytext()); }
[A-Z][a-zA-Z0-9_]*          { return new Token(yyline, yycolumn, TK.TYID, yytext()); }
[0-9]*"."[0-9]+             { return new Token(yyline, yycolumn, TK.FLOAT, Token.toFloat(yytext())); }

// Operadores e Símbolos
"("                         { return new Token(yyline, yycolumn, TK.LPAREN); }
")"                         { return new Token(yyline, yycolumn, TK.RPAREN); }
"{"                         { return new Token(yyline, yycolumn, TK.LBRACE); }
"}"                         { return new Token(yyline, yycolumn, TK.RBRACE); }
" "                         { return new Token(yyline, yycolumn, TK.SPACE); }
"if"                        { return new Token(yyline, yycolumn, TK.IF); }
"else"                      { return new Token(yyline, yycolumn, TK.ELSE); }
"iterate"                   { return new Token(yyline, yycolumn, TK.ITERATE); }
"read"                      { return new Token(yyline, yycolumn, TK.READ); }
"*"                         { return new Token(yyline, yycolumn, TK.MULT); }
"<"                         { return new Token(yyline, yycolumn, TK.MENORQ); }
">"                         { return new Token(yyline, yycolumn, TK.MAISQ); }
"'"                         { return new Token(yyline, yycolumn, TK.APOST); }
"::"                        { return new Token(yyline, yycolumn, TK.DOUBLE_COLON); }
"--"  !([^]* \R [^]*) \R    {}
":"                         { return new Token(yyline, yycolumn, TK.COLON); }
","                         { return new Token(yyline, yycolumn, TK.COMMA); }
"."                         { return new Token(yyline, yycolumn, TK.DOT); }
"true"                      { return new Token(yyline, yycolumn, TK.TRUE); }
"false"                     { return new Token(yyline, yycolumn, TK.FALSE); }
"null"                      { return new Token(yyline, yycolumn, TK.NULLVAL); }
"Bool"                      { return new Token(yyline, yycolumn, TK.BOOL_TYPE); }
"&&"                        { return new Token(yyline, yycolumn, TK.AND); }
"!"                         { return new Token(yyline, yycolumn, TK.NOT); }
"=="                        { return new Token(yyline, yycolumn, TK.EQUAL); } 
"!="                        { return new Token(yyline, yycolumn, TK.NEQ); }
"\\n"                       { return new Token(yyline, yycolumn, TK.NOVALINHA, yytext()); }
{number}                    { return new Token( yyline, yycolumn, TK.INT, toInt(yytext()));   }
"+"                         { return new Token( yyline, yycolumn, TK.PLUS);  }
"-"                         { return new Token( yyline, yycolumn, TK.MINUS); }
"="                         { return new Token( yyline, yycolumn, TK.EQ); }
";"                         { return new Token( yyline, yycolumn, TK.PV); }
"["                         { yybegin(ARR); arr = new ArrayList();}
{white}        {/* While reading whites do nothing*/ }
[^]            {/* Matches any char form the input*/
                throw new Error("Illegal character <"+ yytext()+">"); }
}

<ARR>{
   {number} { arr.add(toInt( yytext()) ); }
   {white}        {/* While reading whites do nothing*/ }
   "]"      { yybegin(YYINITIAL); return new Token( yyline, yycolumn, TK.ARR, arr); }
}

