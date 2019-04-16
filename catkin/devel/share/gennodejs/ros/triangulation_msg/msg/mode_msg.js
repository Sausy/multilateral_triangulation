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

class mode_msg {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.mode = null;
      this.sync_mode = null;
      this.sync_enable = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('mode')) {
        this.mode = initObj.mode
      }
      else {
        this.mode = false;
      }
      if (initObj.hasOwnProperty('sync_mode')) {
        this.sync_mode = initObj.sync_mode
      }
      else {
        this.sync_mode = false;
      }
      if (initObj.hasOwnProperty('sync_enable')) {
        this.sync_enable = initObj.sync_enable
      }
      else {
        this.sync_enable = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type mode_msg
    // Serialize message field [id]
    bufferOffset = _serializer.uint8(obj.id, buffer, bufferOffset);
    // Serialize message field [mode]
    bufferOffset = _serializer.bool(obj.mode, buffer, bufferOffset);
    // Serialize message field [sync_mode]
    bufferOffset = _serializer.bool(obj.sync_mode, buffer, bufferOffset);
    // Serialize message field [sync_enable]
    bufferOffset = _serializer.bool(obj.sync_enable, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type mode_msg
    let len;
    let data = new mode_msg(null);
    // Deserialize message field [id]
    data.id = _deserializer.uint8(buffer, bufferOffset);
    // Deserialize message field [mode]
    data.mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sync_mode]
    data.sync_mode = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [sync_enable]
    data.sync_enable = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/mode_msg';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'e2e08abfaa655bc1b5e56f4201c7cfe0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    uint8 id
    #0 master broadcast, 1 slave broadcast
    bool mode
    #0 sync slave,       1 sync master
    bool sync_mode
    bool sync_enable
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new mode_msg(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.mode !== undefined) {
      resolved.mode = msg.mode;
    }
    else {
      resolved.mode = false
    }

    if (msg.sync_mode !== undefined) {
      resolved.sync_mode = msg.sync_mode;
    }
    else {
      resolved.sync_mode = false
    }

    if (msg.sync_enable !== undefined) {
      resolved.sync_enable = msg.sync_enable;
    }
    else {
      resolved.sync_enable = false
    }

    return resolved;
    }
};

module.exports = mode_msg;
