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

class time_sync_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.sync_time_div = null;
      this.time_div = null;
      this.sys_time = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('sync_time_div')) {
        this.sync_time_div = initObj.sync_time_div
      }
      else {
        this.sync_time_div = [];
      }
      if (initObj.hasOwnProperty('time_div')) {
        this.time_div = initObj.time_div
      }
      else {
        this.time_div = [];
      }
      if (initObj.hasOwnProperty('sys_time')) {
        this.sys_time = initObj.sys_time
      }
      else {
        this.sys_time = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type time_sync_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [sync_time_div]
    bufferOffset = _arraySerializer.float32(obj.sync_time_div, buffer, bufferOffset, null);
    // Serialize message field [time_div]
    bufferOffset = _arraySerializer.float32(obj.time_div, buffer, bufferOffset, null);
    // Serialize message field [sys_time]
    bufferOffset = _arraySerializer.float32(obj.sys_time, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type time_sync_msg
    let len;
    let data = new time_sync_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [sync_time_div]
    data.sync_time_div = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [time_div]
    data.time_div = _arrayDeserializer.float32(buffer, bufferOffset, null)
    // Deserialize message field [sys_time]
    data.sys_time = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.sync_time_div.length;
    length += 4 * object.time_div.length;
    length += 4 * object.sys_time.length;
    return length + 13;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/time_sync_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8fc40ceccbea84cbac12bd27ca06f4f3';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    float32[] sync_time_div
    float32[] time_div
    float32[] sys_time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new time_sync_msg(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.sync_time_div !== undefined) {
      resolved.sync_time_div = msg.sync_time_div;
    }
    else {
      resolved.sync_time_div = []
    }

    if (msg.time_div !== undefined) {
      resolved.time_div = msg.time_div;
    }
    else {
      resolved.time_div = []
    }

    if (msg.sys_time !== undefined) {
      resolved.sys_time = msg.sys_time;
    }
    else {
      resolved.sys_time = []
    }

    return resolved;
    }
};

module.exports = time_sync_msg;
