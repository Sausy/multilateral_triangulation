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

class time_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.trigger_time = null;
      this.master_identifier = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('trigger_time')) {
        this.trigger_time = initObj.trigger_time
      }
      else {
        this.trigger_time = [];
      }
      if (initObj.hasOwnProperty('master_identifier')) {
        this.master_identifier = initObj.master_identifier
      }
      else {
        this.master_identifier = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type time_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [trigger_time]
    bufferOffset = _arraySerializer.float32(obj.trigger_time, buffer, bufferOffset, null);
    // Serialize message field [master_identifier]
    bufferOffset = _arraySerializer.uint32(obj.master_identifier, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type time_msg
    let len;
    let data = new time_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [trigger_time]
    data.trigger_time = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [master_identifier]
    data.master_identifier = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.trigger_time.length;
    length += 4 * object.master_identifier.length;
    return length + 9;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/time_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '0cd6fad2df199d47f2910a60b352e54d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    float32[] trigger_time
    uint32[] master_identifier
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new time_msg(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.trigger_time !== undefined) {
      resolved.trigger_time = msg.trigger_time;
    }
    else {
      resolved.trigger_time = []
    }

    if (msg.master_identifier !== undefined) {
      resolved.master_identifier = msg.master_identifier;
    }
    else {
      resolved.master_identifier = []
    }

    return resolved;
    }
};

module.exports = time_msg;
