// Auto-generated. Do not edit!

// (in-package triangulation_msg.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class master_list {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.master_id_list = null;
    }
    else {
      if (initObj.hasOwnProperty('master_id_list')) {
        this.master_id_list = initObj.master_id_list
      }
      else {
        this.master_id_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type master_list
    // Serialize message field [master_id_list]
    bufferOffset = _arraySerializer.uint32(obj.master_id_list, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type master_list
    let len;
    let data = new master_list(null);
    // Deserialize message field [master_id_list]
    data.master_id_list = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.master_id_list.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/master_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '9fcc051e83933444dfd30c80d8eae2a2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint32[] master_id_list
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new master_list(null);
    if (msg.master_id_list !== undefined) {
      resolved.master_id_list = msg.master_id_list;
    }
    else {
      resolved.master_id_list = []
    }

    return resolved;
    }
};

module.exports = master_list;
