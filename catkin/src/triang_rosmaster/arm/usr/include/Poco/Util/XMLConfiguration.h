//
// XMLConfiguration.h
//
// $Id: //poco/1.3/Util/include/Poco/Util/XMLConfiguration.h#2 $
//
// Library: Util
// Package: Configuration
// Module:  XMLConfiguration
//
// Definition of the XMLConfiguration class.
//
// Copyright (c) 2004-2006, Applied Informatics Software Engineering GmbH.
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


#ifndef Util_XMLConfiguration_INCLUDED
#define Util_XMLConfiguration_INCLUDED


#include "Poco/Util/Util.h"
#include "Poco/Util/MapConfiguration.h"
#include "Poco/DOM/Document.h"
#include "Poco/DOM/AutoPtr.h"
#include "Poco/DOM/DOMWriter.h"
#include "Poco/SAX/InputSource.h"
#include <istream>


namespace Poco {
namespace Util {


class Util_API XMLConfiguration: public AbstractConfiguration
	/// This configuration class extracts configuration properties
	/// from an XML document. An XPath-like syntax for property
	/// names is supported to allow full access to the XML document.
	/// XML namespaces are not supported. The name of the root element
	/// of an XML document is not significant. Periods in tag names
	/// are not supported.
	/// 
	/// Given the following XML document as an example:
	///
	///     <config>
	///         <prop1>value1</prop1>
	///         <prop2>value2</prop2>
	///         <prop3>
	///            <prop4 attr="value3"/>
	///            <prop4 attr="value4"/>
	///         </prop3>
	///         <prop5>value5</prop5>
	///         <prop5>value6</prop5>
	///     </config>
	///
	/// The following property names would be valid and would
	/// yield the shown values:
	///
	///     prop1                 -> value1
	///     prop2                 -> value2
	///     prop3.prop4           -> (empty string)
	///     prop3.prop4[@attr]    -> value3
	///     prop3.prop4[1][@attr] -> value4
	///     prop5[0]              -> value5
	///     prop5[1]              -> value6
	///
	/// Enumerating attributes is not supported.
	/// Calling keys("prop3.prop4") will return an empty range. 
{
public:
	XMLConfiguration();
		/// Creates an empty XMLConfiguration.

	XMLConfiguration(Poco::XML::InputSource* pInputSource);
		/// Creates an XMLConfiguration and loads the XML document from
		/// the given InputSource.

	XMLConfiguration(std::istream& istr);
		/// Creates an XMLConfiguration and loads the XML document from
		/// the given stream.

	XMLConfiguration(const std::string& path);
		/// Creates an XMLConfiguration and loads the XML document from
		/// the given path.

	XMLConfiguration(const Poco::XML::Document* pDocument);
		/// Creates the XMLConfiguration using the given XML document.
		
	XMLConfiguration(const Poco::XML::Node* pNode);
		/// Creates the XMLConfiguration using the given XML node.

	void load(Poco::XML::InputSource* pInputSource);
		/// Loads the XML document containing the configuration data
		/// from the given InputSource.

	void load(std::istream& istr);
		/// Loads the XML document containing the configuration data
		/// from the given stream.
		
	void load(const std::string& path);
		/// Loads the XML document containing the configuration data
		/// from the given file.
		
	void load(const Poco::XML::Document* pDocument);
		/// Loads the XML document containing the configuration data
		/// from the given XML document.

	void load(const Poco::XML::Node* pNode);
		/// Loads the XML document containing the configuration data
		/// from the given XML node.
	
	void loadEmpty(const std::string& rootElementName);
		/// Loads an empty XML document containing only the
		/// root element with the given name.
		
	void save(const std::string& path) const;
		/// Writes the XML document containing the configuration data
		/// to the file given by path.

	void save(std::ostream& str) const;
		/// Writes the XML document containing the configuration data
		/// to the given stream.

	void save(Poco::XML::DOMWriter& writer, const std::string& path) const;
		/// Writes the XML document containing the configuration data
		/// to the file given by path, using the given DOMWriter.
		///
		/// This can be used to use a DOMWriter with custom options.

	void save(Poco::XML::DOMWriter& writer, std::ostream& str) const;
		/// Writes the XML document containing the configuration data
		/// to the given stream.
		///
		/// This can be used to use a DOMWriter with custom options.

protected:
	bool getRaw(const std::string& key, std::string& value) const;
	void setRaw(const std::string& key, const std::string& value);
	void enumerate(const std::string& key, Keys& range) const;
	~XMLConfiguration();

private:
	const Poco::XML::Node* findNode(const std::string& key) const;
	static Poco::XML::Node* findNode(std::string::const_iterator& it, const std::string::const_iterator& end, Poco::XML::Node* pNode, bool create = false);
	static Poco::XML::Node* findElement(const std::string& name, Poco::XML::Node* pNode, bool create);
	static Poco::XML::Node* findElement(int index, Poco::XML::Node* pNode, bool create);
	static Poco::XML::Node* findAttribute(const std::string& name, Poco::XML::Node* pNode, bool create);

	Poco::XML::AutoPtr<Poco::XML::Node>     _pRoot;
	Poco::XML::AutoPtr<Poco::XML::Document> _pDocument;
};


} } // namespace Poco::Util


#endif // Util_XMLConfiguration_INCLUDED
