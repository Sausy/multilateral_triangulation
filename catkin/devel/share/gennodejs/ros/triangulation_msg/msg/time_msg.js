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
      this.input_trigger_time = null;
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
        this.trigger_time = 0;
      }
      if (initObj.hasOwnProperty('input_trigger_time')) {
        this.input_trigger_time = initObj.input_trigger_time
      }
      else {
        this.input_trigger_time = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type time_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [trigger_time]
    bufferOffset = _serializer.uint8(obj.trigger_time, buffer, bufferOffset);
    // Serialize message field [input_trigger_time]
    bufferOffset = _arraySerializer.float32(obj.input_trigger_time, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type time_msg
    let len;
    let data = new time_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [trigger_time]
    data.trigger_time = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [input_trigger_time]
    data.input_trigger_time = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.input_trigger_time.length;
    return length + 6;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/time_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f3440e0816b525b8e8331d56821e5953';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    uint8 trigger_time
    float32[] input_trigger_time
    
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
      resolved.trigger_time = 0
    }

    if (msg.input_trigger_time !== undefined) {
      resolved.input_trigger_time = msg.input_trigger_time;
    }
    else {
      resolved.input_trigger_time = []
    }

    return resolved;
    }
};

module.exports = time_msg;
