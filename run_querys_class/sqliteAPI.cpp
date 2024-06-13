#include <iostream>

#include "sqliteAPI.hpp"

int selectCallback(void* data, int argc, char** argv, char** colNames){
    std::vector<std::string> row;
    for(int i = 0; i < argc; ++i){
        row.push_back(colNames[i]);
        row.push_back(argv[i] ? argv[i] : "NULL");
    }
    std::vector<std::vector<std::string>>* res = static_cast<std::vector<std::vector<std::string>>*>(data);
    res->push_back(row);
    return 0;
}

se::SqliteAPI::SqliteAPI(std::string const& filePath)
// : m_callback(
//     [](void* data, int argc, char** argv, char** colNames){
//     std::vector<std::string> row;
//     for(int i = 0; i < argc; ++i){
//         row.push_back(colNames[i]);
//         row.push_back(argv[i] ? argv[i] : "NULL");
//     }
//     std::vector<std::vector<std::string>>* res = static_cast<std::vector<std::vector<std::string>>*>(data);
//     res->push_back(row);
//     return 0;})
{
    int openResult = sqlite3_open(filePath.c_str() ,&m_db);//TODO from configutation
    if(openResult != SQLITE_OK){
        std::cerr << "Cannot open database: " << sqlite3_errmsg(m_db) << std::endl;
    }
}

se::SqliteAPI::~SqliteAPI()
{
    sqlite3_close(m_db);
}

int se::SqliteAPI::execute(std::string const& query)
{
    char* errorMsg;
    int result = sqlite3_exec(m_db, query.c_str(), 0, 0, &errorMsg);
    
    if(result != SQLITE_OK) {
        std::cerr << "SQLite Error: " << errorMsg << std::endl;
        sqlite3_free(errorMsg);
        //TODO - throw
    }
    return result;
}

se::SqlResult se::SqliteAPI::executeQuery(std::string const& query)
{
    char* errorMsg;
    se::SqlResult res;
    int callbackResult = sqlite3_exec(m_db, query.c_str(), selectCallback , &res, &errorMsg);

    if (callbackResult != SQLITE_OK){
        std::cerr << errorMsg << std::endl;
        sqlite3_free(errorMsg);
        //TODO - throw
    }
    
    return res;
}
