CXX = g++

CC = $(CXX)

CXXFLAGS = -std=c++17 -Wall -pedantic
CXXFLAGS += -Werror
CXXFLAGS += -Wextra
CXXFLAGS += -g3

LDLIBS += -lmysqlcppconn

testCppMysql : testCppMysql.o sqlRunQuary.o

testCppMysql.o : testCppMysql.cpp sqlRunQuary.hpp

sqlRunQuary.o : sqlRunQuary.cpp sqlRunQuary.hpp

clean :
	$(RM) testCppMysql testCppMysql.o sqlRunQuary.o