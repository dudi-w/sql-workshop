#include <iostream>
#include "sqliteAPI.hpp"

int main(void){
    se::SqliteAPI db("example.sqlite");
    db.execute("CREATE TABLE IF NOT EXISTS Person (ID INTEGER PRIMARY KEY, NAME TEXT, AGE INTEGER);");
    // db.execute("INSERT INTO Person (NAME, AGE) VALUES ('John Doe', 0), ('Jane Smith', 1);");
    auto res = db.executeQuery("INSERT INTO Person (NAME, AGE) VALUES ('John Doe', 0), ('Jane Smith', 1); SELECT * FROM Person;");
    db.execute("INSERT INTO Person (NAME, AGE) VALUES (\"dudi\",COALESCE('NULL',1)) ON CONFLICT(NAME, AGE) DO UPDATE SET Count = Count + 1;");

    for(auto const& row : res){
        for(auto const& cell : row){
            std::cout<<" : "<<cell<<std::flush;
        }
        std::cout<<std::endl;
    }

    return EXIT_SUCCESS;
}