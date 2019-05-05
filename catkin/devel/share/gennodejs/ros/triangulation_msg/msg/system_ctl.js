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

class system_ctl {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.master_id = null;
      this.enable_slave_input = null;
      this.trigger_time = null;
    }
    else {
      if (initObj.hasOwnProperty('master_id')) {
        this.master_id = initObj.master_id
      }
      else {
        this.master_id = 0;
      }
      if (initObj.hasOwnProperty('enable_slave_input')) {
        this.enable_slave_input = initObj.enable_slave_input
      }
      else {
        this.enable_slave_input = false;
      }
      if (initObj.hasOwnProperty('trigger_time')) {
        this.trigger_time = initObj.trigger_time
      }
      else {
        this.trigger_time = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type system_ctl
    // Serialize message field [master_id]
    bufferOffset = _serializer.uint8(obj.master_id, buffer, bufferOffset);
    // Serialize message field [enable_slave_input]
    bufferOffset = _serializer.bool(obj.enable_slave_input, buffer, bufferOffset);
    // Serialize message field [trigger_time]
    bufferOffset = _arraySerializer.float32(obj.trigger_time, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type system_ctl
    let len;
    let data = new system_ctl(null);
    // Deserialize message field [master_id]
    data.master_id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [enable_slave_input]
    data.enable_slave_input = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [trigger_time]
    data.trigger_time = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.trigger_time.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/system_ctl';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'b2402184671eaa4cfe66017f90187544';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 master_id
    bool enable_slave_input
    float32[] trigger_time
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new system_ctl(null);
    if (msg.master_id !== undefined) {
      resolved.master_id = msg.master_id;
    }
    else {
      resolved.master_id = 0
    }

    if (msg.enable_slave_input !== undefined) {
      resolved.enable_slave_input = msg.enable_slave_input;
    }
    else {
      resolved.enable_slave_input = false
    }

    if (msg.trigger_time !== undefined) {
      resolved.trigger_time = msg.trigger_time;
    }
    else {
      resolved.trigger_time = []
    }

    return resolved;
    }
};

module.exports = system_ctl;
