
public class Sambol {
    String yy;
    TokenType tokenType;
    int yyline;
    int yycolumn;

    public Sambol(String yy, TokenType tokenType, int yyline, int yycolumn) {
        this.yy = yy;
        this.tokenType = tokenType;
        this.yyline = yyline;
        this.yycolumn = yycolumn;
    }

    public Sambol(String yy, TokenType tokenType) {
        this.yy = yy;
        this.tokenType = tokenType;
    }

    public String toString() {
        return this.yy;
    }

}

enum TokenType {
    RESERVED_KEYWORDS,
    IDENTIFIER,
    NOTHING,
    STRING_AND_CHARACTER,
    SPECIAL_CHARACTER,
    LINE_TERMINATOR,
    WHITE_SPACE,
    TAB,
    COMMENT,
    DECIMAL_INTEGER,
    HEXA_DECIMAL,
    REAL_NUMBERS,
    SCIENTIFIC_NOTATION,
    OPERATORS_AND_PUNCTUATIONS

}