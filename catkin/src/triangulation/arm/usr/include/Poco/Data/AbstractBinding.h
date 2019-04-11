//
// AbstractBinding.h
//
// $Id: //poco/1.3/Data/include/Poco/Data/AbstractBinding.h#1 $
//
// Library: Data
// Package: DataCore
// Module:  AbstractBinding
//
// Definition of the AbstractBinding class.
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


#ifndef Data_AbstractBinding_INCLUDED
#define Data_AbstractBinding_INCLUDED


#include "Poco/Data/Data.h"
#include "Poco/Any.h"
#include "Poco/RefCountedObject.h"
#include "Poco/AutoPtr.h"
#include <vector>
#include <cstddef>


namespace Poco {
namespace Data {


class AbstractBinder;


class Data_API AbstractBinding: public Poco::RefCountedObject
	/// AbstractBinding connects a value with a placeholder via an AbstractBinder interface.
{
public:
	AbstractBinding();
		/// Creates the AbstractBinding.

	virtual ~AbstractBinding();
		/// Destroys the AbstractBinding.

	void setBinder(AbstractBinder* pBinder);
		/// Sets the object used for binding; object does NOT take ownership of the pointer.

	AbstractBinder* getBinder() const;
		/// Returns the AbstractBinder used for binding data.

	virtual std::size_t numOfColumnsHandled() const = 0;
		/// Returns the number of columns that the binding handles.
		///
		/// The trivial case will be one single column but when
		/// complex types are used this value can be larger than one.

	virtual std::size_t numOfRowsHandled() const = 0;
		/// Returns the number of rows that the binding handles.
		///
		/// The trivial case will be one single row but 
		/// for collection data types (ie vector) it can be larger.

	virtual bool canBind() const = 0;
		/// Returns true if we have enough data to bind

	virtual void bind(std::size_t pos) = 0;
		/// Binds a value to the given column position

	virtual void reset() = 0;
		/// Allows a binding to be reused.

private:
	AbstractBinder* _pBinder;
};


typedef Poco::AutoPtr<AbstractBinding> AbstractBindingPtr;
typedef std::vector<AbstractBindingPtr> AbstractBindingVec;


//
// inlines
//
inline void AbstractBinding::setBinder(AbstractBinder* pBinder)
{
	_pBinder = pBinder;
}


inline AbstractBinder* AbstractBinding::getBinder() const
{
	return _pBinder;
}


} } // namespace Poco::Data


#endif // Data_AbstractBinding_INCLUDED
