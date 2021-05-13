
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Objects;


public class Rangi {
    public static String SPACE = "&nbsp;";
    public static String TAB = SPACE + SPACE + SPACE + SPACE;

    // Avval
    public static void print_avval(String title, FileWriter output) throws IOException {
        output.write("<!DOCTYPE html>\n");
        output.write("<html>\n");
        output.write("  <head>\n");
        output.write("      <title>" + title + "</title>\n");
        output.write("  </head>\n");
        output.write("  <body>\n");
        output.write("      <p>");
    }

    //miyane

    public static void main(String[] args) throws IOException {


        FileWriter outt = new FileWriter("E:\\Users\\Asus\\IdeaProjects\\Syntax_Highlighter\\src\\outputt3.html");

        print_avval("compile", outt);

        Scan yylex = new Scan(new FileReader("E:\\Users\\Asus\\IdeaProjects\\Syntax_Highlighter\\src\\input.txt.txt"));

        Sambol hal;

        for (hal = yylex.baadi(); !yylex.yyatEOF(); hal = yylex.baadi()) {
            switch (Objects.requireNonNull(hal).tokenType) {
                case RESERVED_KEYWORDS -> {
                    outt.write("<span style=\"font-weight: bold;color: blue;\"><b>" + hal.yy + "</b></span>");
                    System.out.println("<span style=\"font-weight: bold;color: blue;\"><b>" + hal.yy + "</b></span>");
                }
                case IDENTIFIER -> {
                    outt.write("<span style=\"color:violet\">" + hal.yy + "</span>");
                    System.out.println("<span style=\"color:violet\">" + hal.yy + "</span>");
                }

                case DECIMAL_INTEGER -> {
                    outt.write("<span style=\"color:orange\">" + hal.yy + "</span>");
                    System.out.println("<span style=\"color:orange\">" + hal.yy + "</span>");
                }
                case REAL_NUMBERS, HEXA_DECIMAL, SCIENTIFIC_NOTATION -> {
                    outt.write("<span style=\"font:italic;color:orange\"><i>" + hal.yy + "</i></span>");
                    System.out.println("<span style=\"font:italic;color:orange\"><i>" + hal.yy + "</i></span>");
                }
                case STRING_AND_CHARACTER -> {
                    outt.write("<span style=\"color:green\">" + hal.yy + "</span>");
                    System.out.println("<span style=\"color:green\">" + hal.yy + "</span>");
                }
                case SPECIAL_CHARACTER -> {
                    outt.write("<span style=\"font:italic;color:green\"><i>" + hal.yy + "</i></span>");
                    System.out.println("<span style=\"font:italic;color:green\"><i>" + hal.yy + "</i></span>");
                }
                case COMMENT -> {
                    outt.write("<span style=\"color:yellow\">" + html(hal.yy) + "</span>");
                    System.out.println("<span style=\"color:yellow\">" + (hal.yy) + "</span>");
                }
                case OPERATORS_AND_PUNCTUATIONS -> {
                    System.out.println("<span style=\"color:black\"><b>" + hal.yy + "</b></span>");
                    outt.write("<span style=\"color:black\"><b>" + hal.yy + "</b></span>");
                }
                case NOTHING -> {
                    System.out.println("<span style=\"color:red\">" + hal.yy + "</span>");
                    outt.write("<span style=\"color:red\">" + hal.yy + "</span>");
                }
                case TAB -> outt.write(TAB);
                case WHITE_SPACE -> outt.write(SPACE);
            }


        }

        printEnd(outt);
        yylex.yyclose();
    }


    //Akhar

    public static void printEnd(FileWriter out) throws IOException {
        out.write("     </p>\n");
        out.write(" </body>\n");
        out.write("</html>\n");
        out.flush();
        out.close();
    }

    public static String html(String txt) {
        StringBuilder val = new StringBuilder();
        for (Character character : txt.toCharArray()) {
            if (character == '\n') {
                val.append("<br>");//break
            } else if (character == '\t') {
                val.append(TAB);
            } else if (character == ' ') {
                val.append(SPACE);
            } else {
                val.append(character);
            }
        }
        return val.toString();
    }
}
