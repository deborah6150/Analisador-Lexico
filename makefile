# Calc lexer
# Deborah Caroline Rodrigues Oliveira - 17.1.8231
# Thuane de Souza Espírito Santo - 17.1.8255
####################################################

all: lex
	javac -cp . Main.java

lex: calc.flex
	java -jar jflex.jar -nobak calc.flex

# executa no linux
clean:
	find -name "*.class" -delete
	rm Calc.java

# executar no ios
# clean:
# 	find . -name "*.class" -delete
# 	rm -f Calc.java
