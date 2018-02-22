JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = *.java 

default: classes

classes: $(CLASSES:.java=.class)

# Solution1:Solution1.cpp
# 	g++ -Wall -pedantic -std=c++14 -o Solution1 Solution1.cpp

clean:
	$(RM) *.class
