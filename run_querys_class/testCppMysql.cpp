#include <iostream>

#include "sqlRunQuary.hpp"

int main(void)
{
std::cout << std::endl;
std::cout << "Let's have MySQL count from 10 to 1..." << std::endl;

SqlRunQuery sqlRQ("tcp://127.0.0.1:3306", "sammy", "1234" ,"test");
sqlRQ.execute("DROP TABLE IF EXISTS test",{});

sqlRQ.execute("CREATE TABLE test(id INT)",{});
for(int i = 1; i <= 10; i++) {
	sqlRQ.executeUpdate("INSERT INTO test(id) VALUES (?)" , {std::to_string(i)});
}
auto ptr = sqlRQ.executeQuery("SELECT id FROM test ORDER BY id ASC", {});
ptr->afterLast();
  while (ptr->previous()){
    std::cout << "\t... MySQL counts: " << ptr->getInt("id") << std::endl;
}
std::cout << std::endl;

return EXIT_SUCCESS;
}