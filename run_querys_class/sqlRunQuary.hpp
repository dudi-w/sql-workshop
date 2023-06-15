#include <vector>
#include <string>
#include <memory>
#include <cppconn/resultset.h>
#include <cppconn/prepared_statement.h>
#include <cppconn/exception.h>
#include <cppconn/driver.h>

class SqlRunQuery
{
public:
    SqlRunQuery(std::string const& hostName, std::string const& userName, std::string const& password, std::string const& schema);
    SqlRunQuery(SqlRunQuery const& other) = default;
    SqlRunQuery& operator=(SqlRunQuery const& other) = default;
    ~SqlRunQuery() = default;

    bool execute(std::string const& query, std::vector<std::string> const& args);
    int executeUpdate(std::string const& query, std::vector<std::string> const& args);
    std::unique_ptr<sql::ResultSet> executeQuery(std::string const& query, std::vector<std::string> const& args);

private:
    std::unique_ptr<sql::Connection> createConnection();
	std::unique_ptr<sql::PreparedStatement> prepareStatement(std::unique_ptr<sql::Connection>& con, std::string const& query, std::vector<std::string> const& args);
    void handleSQLException(sql::SQLException& e, std::string const& query);

private:
    std::string const m_hostName;
    std::string const m_userName;
    std::string const m_password;
    std::string const m_schema;
	sql::Driver& m_driver;
};