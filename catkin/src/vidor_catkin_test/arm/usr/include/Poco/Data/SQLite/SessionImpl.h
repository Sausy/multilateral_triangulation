//
// SessionImpl.h
//
// $Id: //poco/1.3/Data/SQLite/include/Poco/Data/SQLite/SessionImpl.h#8 $
//
// Library: Data/SQLite
// Package: SQLite
// Module:  SessionImpl
//
// Definition of the SessionImpl class.
//
// Copyright (c) 2006, Applied Informatics Software Engineering GmbH.
// and Contributors.
//
// Permission is hereby granted, free of charge, to any person or organization
// obtaining a copy of the software and accompanying documentation covered by
// this license (the "Software") to use, reproduce, display, distribute,
// execute, and transmit the Software, and to prepare derivative works of the
// Software, and to permit third-parties to whom the Software is furnished to
// do so, all subject to the following:
// 
// The copyright notices in the Software and this entire statement, including
// the above license grant, this restriction and the following disclaimer,
// must be included in all copies of the Software, in whole or in part, and
// all derivative works of the Software, unless such copies or derivative
// works are solely in the form of machine-executable object code generated by
// a source language processor.
// 
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE, TITLE AND NON-INFRINGEMENT. IN NO EVENT
// SHALL THE COPYRIGHT HOLDERS OR ANYONE DISTRIBUTING THE SOFTWARE BE LIABLE
// FOR ANY DAMAGES OR OTHER LIABILITY, WHETHER IN CONTRACT, TORT OR OTHERWISE,
// ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//


#ifndef DataConnectors_SQLite_SessionImpl_INCLUDED
#define DataConnectors_SQLite_SessionImpl_INCLUDED


#include "Poco/Data/SQLite/SQLite.h"
#include "Poco/Data/SQLite/Binder.h"
#include "Poco/Data/AbstractSessionImpl.h"
#include "Poco/SharedPtr.h"


struct sqlite3;
struct sqlite3_stmt;


namespace Poco {
namespace Data {
namespace SQLite {


class SQLite_API SessionImpl: public Poco::Data::AbstractSessionImpl<SessionImpl>
	/// Implements SessionImpl interface.
	///
	/// The following properties are supported:
	///   * transactionMode: "DEFERRED", "IMMEDIATE" or "EXCLUSIVE"
	///   * maxRetryAttempts: maximum number of attemptes to retry an operation if
	///     database is locked or busy. Between retry attempts, sleep for a random
	///     time. 
	///   * minRetrySleep: the minimum time (in milliseconds) waited between two retry attempts.
	///   * maxRetrySleep: the maximum time (in milliseconds) waited between two retry attempts.
	///
	/// Notes: For automatic retries to work, you should start every transaction that
	/// at one point will write to the database with IMMEDIATE or EXCLUSIVE mode.
{
public:
	enum
	{
		DEFAULT_MAX_RETRY_ATTEMPTS = 0, /// Default maximum number of attempts to retry an operation if the database is locked.
		DEFAULT_MIN_RETRY_SLEEP    = 2, /// Default minimum sleep interval (milliseconds) between retry attempts.
		DEFAULT_MAX_RETRY_SLEEP    = 20 /// Default maximum sleep interval (milliseconds) between retry attempts.
	};
	
	SessionImpl(const std::string& fileName);
		/// Creates the SessionImpl. Opens a connection to the database.

	~SessionImpl();
		/// Destroys the SessionImpl.

	Poco::Data::StatementImpl* createStatementImpl();
		/// Returns an SQLite StatementImpl.

	void begin();
		/// Starts a transaction.

	void commit();
		/// Commits and ends a transaction.

	void rollback();
		/// Aborts a transaction.

	void close();
		/// Closes the session.
		
	bool isTransaction();
		/// Returns true iff a transaction is in progress.

	bool isConnected();
		/// Returns true iff connected, false otherwise.
		
protected:
	void setTransactionMode(const std::string& prop, const Poco::Any& value);
	Poco::Any getTransactionMode(const std::string& prop);
	void setMaxRetryAttempts(const std::string& prop, const Poco::Any& value);
	Poco::Any getMaxRetryAttempts(const std::string& prop);
	void setMinRetrySleep(const std::string& prop, const Poco::Any& value);
	Poco::Any getMinRetrySleep(const std::string& prop);
	void setMaxRetrySleep(const std::string& prop, const Poco::Any& value);
	Poco::Any getMaxRetrySleep(const std::string& prop);
	
private:
	void open();
		/// Opens a connection to the Database.

	std::string _dbFileName;
	sqlite3*    _pDB;
	std::string _transactionMode;
	int         _maxRetryAttempts;
	int         _minRetrySleep;
	int         _maxRetrySleep;
	bool        _connected;
	
	static const std::string BEGIN_TRANSACTION;
	static const std::string COMMIT_TRANSACTION;
	static const std::string ABORT_TRANSACTION;
};


} } } // namespace Poco::Data::SQLite


#endif // DataConnectors_SQLite_SessionImpl_INCLUDED