//hello world
import java.io.*;

%%

%class Scan

%public
%final
//%standalone
%unicode

%line
%column



//yylex mitunim ba %function avaz konim ; vali fellan okeye

//
%function baadi
%type Sambol


%state STRING
%state CHARACTER


LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]

Tab = \t
WhiteSpace = [ ]


Comment = {TraditionalComment} | {EndOfLineComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
// Comment can be the last line of the file, without line terminator.
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}



//case sensitive
Letter = [a-zA-Z]
Digit = [0-9]
UnderLine = "_"
//Identifier = starting with Letter  ((be tul 31 ))
Identifier =  {Letter} ({Letter}|{Digit}|{UnderLine}){0,30}


Sign = (\+|\-)?
DecimalInteger ={Sign}[0-9]+
HexaDecimal = {Sign}[0][Xx][0-9a-fA-F]+

RealNumbers = {Sign}({Digit}+\.) |{Sign}({Digit}+\.{Digit}+)

ScientificNotation = {RealNumbers}[E]{Sign}{Digit}+


// shak bara string va special characters

//Qutation = ["]
SingleQutation = '
//qurt = "\""
//String = {qurt} ({Letter}|{Digit}|{UnderLine})* {qurt}
//String = {Qutation}^{Qutation}{Qutation}



// " shak double qutation
Operators_and_punctuations = "+" | "-" | "*" | "/" | "+=" | "*=" | "-=" | "/=" | "++" | "--" | "<" | "<=" | ">" | ">=" | "!=" | "==" | "<-" | "%" | "&&" | "||" | "&" | "|" |  "^" | "!" | "." | "," | ";" | "[" | "]" | "(" | ")" | "{" | "}"





%% /*ghavanin loghavi*/

<YYINITIAL>{

    /* Reserved Keywords */

         "void"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
          "int"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}

         "real"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
         "bool"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
         "string"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
        "class"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
         "for"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS );}
        "while"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
        "if"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
        "else"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
       "return"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
       "rof"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
       "let"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
       "fi"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
       "Array"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "in_string"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "out_string"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "new"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "break"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "continue"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "loop"         { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "pool"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "in_int"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "out_int"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "then"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}
      "len"          { return new Sambol( yytext(), TokenType.RESERVED_KEYWORDS);}


      {Operators_and_punctuations}  { return new Sambol(yytext(), TokenType.OPERATORS_AND_PUNCTUATIONS ); }

      {ScientificNotation} {return new Sambol(yytext(), TokenType.SCIENTIFIC_NOTATION);}

      {RealNumbers} {return new Sambol(yytext(), TokenType.REAL_NUMBERS );}

      {HexaDecimal} {return new Sambol(yytext(), TokenType.HEXA_DECIMAL);}

      {DecimalInteger}  {return new Sambol(yytext(), TokenType.DECIMAL_INTEGER);}

      {Identifier}  {return new Sambol(yytext(), TokenType.IDENTIFIER);}

      {Comment}     {return new Sambol(yytext(), TokenType.COMMENT);}

      {Tab}     {return new Sambol(yytext(), TokenType.TAB);}

      {WhiteSpace}     {return new Sambol(yytext(), TokenType.WHITE_SPACE);}



      {LineTerminator}     {return new Sambol("\n", TokenType.LINE_TERMINATOR);}






      "\""              {yybegin( STRING); return new Sambol(yytext(),TokenType.STRING_AND_CHARACTER , yyline, yycolumn);}
//



      "\'"          {yybegin(CHARACTER); return new Sambol("'",TokenType.STRING_AND_CHARACTER );}


      [^]       {return new Sambol(yytext(), TokenType.NOTHING);}

}



<STRING> {

        "\""        {yybegin(YYINITIAL); return new Sambol(yytext(), TokenType.STRING_AND_CHARACTER );}


        "\\n"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\v"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\b"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\f"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\a"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\\""      { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\0"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        "\\t"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        "\\r"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
            	"\\\\"      { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\?"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER ); }
        	"\\'"       { return new Sambol( yytext(), TokenType.SPECIAL_CHARACTER); }

        	.           { return new Sambol( yytext(), TokenType.STRING_AND_CHARACTER ); }

}

<CHARACTER> {

    "\\n"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\n'", TokenType.SPECIAL_CHARACTER ); }
    	"\\v"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\v'", TokenType.SPECIAL_CHARACTER ); }
    	"\\b"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\b'", TokenType.SPECIAL_CHARACTER ); }
    	"\\f"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\f'", TokenType.SPECIAL_CHARACTER ); }
    	"\\a"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\a'", TokenType.SPECIAL_CHARACTER  ); }
    	"\\?"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\?'", TokenType.SPECIAL_CHARACTER ); }
    	"\\\""{SingleQutation}   { yybegin( YYINITIAL ); return new Sambol( "\\\"'", TokenType.SPECIAL_CHARACTER ); }
    	"\\0"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\0'", TokenType.SPECIAL_CHARACTER ); }
"\\t"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\t'", TokenType.SPECIAL_CHARACTER ); }
"\\r"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\r'", TokenType.SPECIAL_CHARACTER ); }
   	"\\\\"{SingleQutation}    { yybegin( YYINITIAL ); return new Sambol( "\\\\'", TokenType.SPECIAL_CHARACTER, yyline, yycolumn ); }
"\\'"{SingleQutation}     { yybegin( YYINITIAL ); return new Sambol( "\\''", TokenType.SPECIAL_CHARACTER ); }


	.{SingleQutation}  { yybegin( YYINITIAL ); return new Sambol( yytext(), TokenType.STRING_AND_CHARACTER ); }

}


[^] { return new Sambol(yytext(), TokenType.NOTHING );}