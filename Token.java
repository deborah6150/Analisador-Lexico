/* Calc lexer
 * Deborah Caroline Rodrigues Oliveira - 17.1.8231
 * Thuane de Souza Espírito Santo - 17.1.8255
 */

public class Token {

    public Object value;
    public TK tk;
    public int line;
    public int column;
 
    public Token(int line, int column, TK t){
        this.line = line;
        this.column = column;
        value = null;
        tk = t;
    }
 
    public Token(int line, int column, TK t, Object v){
        this(line,column,t);
        value = v;
    }
 
    public String toString(){
        return "(" + line + "," + column+ ") TK: " + tk +  (value == null ? "" : "  val: " + value.toString());
    }
 
    public static float toFloat(String text) {
        try {
            return Float.parseFloat(text);
        } catch (NumberFormatException e) {
            throw new RuntimeException("Invalid float format: " + text, e);
        }
    }

 }
 