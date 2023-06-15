#include "sqlRunQuary.hpp"

SqlRunQuery::SqlRunQuery(std::string const& hostName, std::string const& userName, std::string const& password, std::string const& schema)
: m_hostName(hostName)
, m_userName(userName)
, m_password(password)
, m_schema(schema)
, m_driver(*get_driver_instance())
{}

std::unique_ptr<sql::Connection> SqlRunQuery::createConnection()
{
    std::unique_ptr<sql::Connection> con(m_driver.connect(m_hostName, m_userName, m_password));
    con->setSchema(m_schema);
    return con;
}

std::unique_ptr<sql::PreparedStatement> SqlRunQuery::prepareStatement(std::unique_ptr<sql::Connection>& con, std::string const& query, std::vector<std::string> const& args)
{
    std::unique_ptr<sql::PreparedStatement> pstmt(con->prepareStatement(query));
    for (size_t i = 0; i < args.size(); ++i) {
        pstmt->setString(i + 1, args.at(i));
    }
    return pstmt;
}

void SqlRunQuery::handleSQLException(sql::SQLException& e, std::string const& query)
{
    std::cout << "# ERR: SQLException in execute query " + query
              << "\n# ERR: " << e.what()
              << " (MySQL error code: " << e.getErrorCode()
              << ", SQLState: " << e.getSQLState() << " )" << std::endl;
}

bool SqlRunQuery::execute(std::string const& query, std::vector<std::string> const& args)
{
    try {
		auto con = createConnection();
        auto pstmt = prepareStatement(con, query, args);
        return pstmt->execute();
    } catch (sql::SQLException& e) {
        handleSQLException(e, query);
        return false;
    }
}

int SqlRunQuery::executeUpdate(std::string const& query, std::vector<std::string> const& args)
{
    try {
		auto con = createConnection();
        auto pstmt = prepareStatement(con, query, args);
        return pstmt->executeUpdate();
    } catch (sql::SQLException& e) {
        handleSQLException(e, query);
        return -1;
    }
}

std::unique_ptr<sql::ResultSet> SqlRunQuery::executeQuery(std::string const& query, std::vector<std::string> const& args)
{
    try {
		auto con = createConnection();
        auto pstmt = prepareStatement(con, query, args);
        return std::unique_ptr<sql::ResultSet>(pstmt->executeQuery());
    } catch (sql::SQLException& e) {
        handleSQLException(e, query);
        return nullptr;
    }
}