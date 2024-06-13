CXX = g++

CC = $(CXX)

CXXFLAGS = -std=c++17 -Wall -pedantic
CXXFLAGS += -Werror
CXXFLAGS += -Wextra
CXXFLAGS += -g3

# LDLIBS += -lmysqlcppconn
LDLIBS +=  -lsqlite3

testCppMysql : testCppMysql.o sqlRunQuary.o sqliteAPI.o

testCppMysql.o : testCppMysql.cpp sqlRunQuary.hpp

sqlRunQuary.o : sqlRunQuary.cpp sqlRunQuary.hpp




testCppSqlite3 : testCppSqlite3.o sqliteAPI.o

testCppSqlite3.o : testCppSqlite3.cpp sqliteAPI.o

sqliteAPI.o : sqliteAPI.cpp sqliteAPI.hpp

clean :
	$(RM) testCppMysql testCppMysql.o sqlRunQuary.o sqliteAPI.o testCppSqlite3.o testCppSqlite3