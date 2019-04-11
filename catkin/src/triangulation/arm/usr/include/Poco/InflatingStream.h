//
// InflatingStream.h
//
// $Id: //poco/1.3/Foundation/include/Poco/InflatingStream.h#4 $
//
// Library: Foundation
// Package: Streams
// Module:  ZLibStream
//
// Definition of the InflatingInputStream and InflatingOutputStream classes.
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


#ifndef Foundation_InflatingStream_INCLUDED
#define Foundation_InflatingStream_INCLUDED


#include "Poco/Foundation.h"
#include "Poco/BufferedStreamBuf.h"
#include <istream>
#include <ostream>
#if defined(POCO_UNBUNDLED)
#include <zlib.h>
#else
#include "Poco/zlib.h"
#endif


namespace Poco {


class Foundation_API InflatingStreamBuf: public BufferedStreamBuf
	/// This is the streambuf class used by InflatingInputStream and InflatingOutputStream.
	/// The actual work is delegated to zlib 1.2.1 (see http://www.gzip.org).
	/// Both zlib (deflate) streams and gzip streams are supported.
	/// Output streams should always call close() to ensure
	/// proper completion of decompression.
{
public:
	enum StreamType
	{
		STREAM_ZLIB,
		STREAM_GZIP,
		STREAM_ZIP // ZIP is handled as STREAM_ZLIB, except that we do not check the ADLER32 value (must be checked by an outside class!)
	};

	InflatingStreamBuf(std::istream& istr, StreamType type);
	InflatingStreamBuf(std::ostream& ostr, StreamType type);
	~InflatingStreamBuf();
	int close();
	void reset();

protected:
	int readFromDevice(char* buffer, std::streamsize length);
	int writeToDevice(const char* buffer, std::streamsize length);

private:
	enum 
	{
		STREAM_BUFFER_SIZE  = 1024,
		INFLATE_BUFFER_SIZE = 32768
	};
	
	std::istream*  _pIstr;
	std::ostream*  _pOstr;
	char*    _buffer;
	z_stream _zstr;
	bool     _eof;
	bool     _check;
};


class Foundation_API InflatingIOS: public virtual std::ios
	/// The base class for InflatingOutputStream and InflatingInputStream.
	///
	/// This class is needed to ensure the correct initialization
	/// order of the stream buffer and base classes.
{
public:
	InflatingIOS(std::ostream& ostr, InflatingStreamBuf::StreamType type = InflatingStreamBuf::STREAM_ZLIB);
	InflatingIOS(std::istream& istr, InflatingStreamBuf::StreamType type = InflatingStreamBuf::STREAM_ZLIB);
	~InflatingIOS();
	InflatingStreamBuf* rdbuf();

protected:
	InflatingStreamBuf _buf;
};


class Foundation_API InflatingOutputStream: public InflatingIOS, public std::ostream
	/// This stream decompresses all data passing through it
	/// using zlib's inflate algorithm.
	///
	/// After all data has been written to the stream, close()
	/// must be called to ensure completion of decompression.
{
public:
	InflatingOutputStream(std::ostream& ostr, InflatingStreamBuf::StreamType type = InflatingStreamBuf::STREAM_ZLIB);
	~InflatingOutputStream();
	int close();
};


class Foundation_API InflatingInputStream: public InflatingIOS, public std::istream
	/// This stream decompresses all data passing through it
	/// using zlib's inflate algorithm.
	/// Example:
	///     std::ifstream istr("data.gz", std::ios::binary);
	///     InflatingInputStream inflater(istr, InflatingStreamBuf::STREAM_GZIP);
	///     std::string data;
	///     istr >> data;
	///
	/// The underlying input stream can contain more than one gzip/deflate stream.
	/// After a gzip/deflate stream has been processed, reset() can be called
	/// to inflate the next stream.
{
public:
	InflatingInputStream(std::istream& istr, InflatingStreamBuf::StreamType type = InflatingStreamBuf::STREAM_ZLIB);
	~InflatingInputStream();
	void reset();
};


} // namespace Poco


#endif // Foundation_InflatingStream_INCLUDED
