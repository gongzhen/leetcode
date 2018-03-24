JFLAGS = -g
JC = javac
.SUFFIXES: .java .class
.java.class:
	$(JC) $(JFLAGS) $*.java

CLASSES = LC158.java 

default: classes

classes: $(CLASSES:.java=.class)

# Solution1:Solution1.cpp
# 	g++ -Wall -pedantic -std=c++14 -o Solution1 Solution1.cpp

clean:
	$(RM) *.class

# clang -framework Foundation LC146.m -o LC146
