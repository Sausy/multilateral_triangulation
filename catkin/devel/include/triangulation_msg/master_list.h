// Generated by gencpp from file triangulation_msg/master_list.msg
// DO NOT EDIT!


#ifndef TRIANGULATION_MSG_MESSAGE_MASTER_LIST_H
#define TRIANGULATION_MSG_MESSAGE_MASTER_LIST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace triangulation_msg
{
template <class ContainerAllocator>
struct master_list_
{
  typedef master_list_<ContainerAllocator> Type;

  master_list_()
    : master_id_list()  {
    }
  master_list_(const ContainerAllocator& _alloc)
    : master_id_list(_alloc)  {
  (void)_alloc;
    }



   typedef std::vector<uint32_t, typename ContainerAllocator::template rebind<uint32_t>::other >  _master_id_list_type;
  _master_id_list_type master_id_list;





  typedef boost::shared_ptr< ::triangulation_msg::master_list_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::triangulation_msg::master_list_<ContainerAllocator> const> ConstPtr;

}; // struct master_list_

typedef ::triangulation_msg::master_list_<std::allocator<void> > master_list;

typedef boost::shared_ptr< ::triangulation_msg::master_list > master_listPtr;
typedef boost::shared_ptr< ::triangulation_msg::master_list const> master_listConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::triangulation_msg::master_list_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::triangulation_msg::master_list_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace triangulation_msg

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'geometry_msgs': ['/opt/ros/melodic/share/geometry_msgs/cmake/../msg'], 'triangulation_msg': ['/home/sausy/Projects/multilateral_triangulation/catkin/src/triang_communication/triangulation_msg/msg'], 'std_msgs': ['/opt/ros/melodic/share/std_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::triangulation_msg::master_list_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::triangulation_msg::master_list_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::triangulation_msg::master_list_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::triangulation_msg::master_list_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::triangulation_msg::master_list_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::triangulation_msg::master_list_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::triangulation_msg::master_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "9fcc051e83933444dfd30c80d8eae2a2";
  }

  static const char* value(const ::triangulation_msg::master_list_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x9fcc051e83933444ULL;
  static const uint64_t static_value2 = 0xdfd30c80d8eae2a2ULL;
};

template<class ContainerAllocator>
struct DataType< ::triangulation_msg::master_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "triangulation_msg/master_list";
  }

  static const char* value(const ::triangulation_msg::master_list_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::triangulation_msg::master_list_<ContainerAllocator> >
{
  static const char* value()
  {
    return "uint32[] master_id_list\n"
;
  }

  static const char* value(const ::triangulation_msg::master_list_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::triangulation_msg::master_list_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.master_id_list);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct master_list_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::triangulation_msg::master_list_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::triangulation_msg::master_list_<ContainerAllocator>& v)
  {
    s << indent << "master_id_list[]" << std::endl;
    for (size_t i = 0; i < v.master_id_list.size(); ++i)
    {
      s << indent << "  master_id_list[" << i << "]: ";
      Printer<uint32_t>::stream(s, indent + "  ", v.master_id_list[i]);
    }
  }
};

} // namespace message_operations
} // namespace ros

#endif // TRIANGULATION_MSG_MESSAGE_MASTER_LIST_H
