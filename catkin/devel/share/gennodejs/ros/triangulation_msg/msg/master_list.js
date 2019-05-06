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
      this.start_ptp_sync = null;
      this.start_burst = null;
      this.burst_cycles = null;
      this.master_id_list = null;
    }
    else {
      if (initObj.hasOwnProperty('start_ptp_sync')) {
        this.start_ptp_sync = initObj.start_ptp_sync
      }
      else {
        this.start_ptp_sync = false;
      }
      if (initObj.hasOwnProperty('start_burst')) {
        this.start_burst = initObj.start_burst
      }
      else {
        this.start_burst = false;
      }
      if (initObj.hasOwnProperty('burst_cycles')) {
        this.burst_cycles = initObj.burst_cycles
      }
      else {
        this.burst_cycles = 0;
      }
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
    // Serialize message field [start_ptp_sync]
    bufferOffset = _serializer.bool(obj.start_ptp_sync, buffer, bufferOffset);
    // Serialize message field [start_burst]
    bufferOffset = _serializer.bool(obj.start_burst, buffer, bufferOffset);
    // Serialize message field [burst_cycles]
    bufferOffset = _serializer.uint32(obj.burst_cycles, buffer, bufferOffset);
    // Serialize message field [master_id_list]
    bufferOffset = _arraySerializer.uint32(obj.master_id_list, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type master_list
    let len;
    let data = new master_list(null);
    // Deserialize message field [start_ptp_sync]
    data.start_ptp_sync = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [start_burst]
    data.start_burst = _deserializer.bool(buffer, bufferOffset);
    // Deserialize message field [burst_cycles]
    data.burst_cycles = _deserializer.uint32(buffer, bufferOffset);
    // Deserialize message field [master_id_list]
    data.master_id_list = _arrayDeserializer.uint32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.master_id_list.length;
    return length + 10;
  }

  static datatype() {
    // Returns string type for a message object
    return 'triangulation_msg/master_list';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cf7b414f4c61d1db6ce0d1fd4a255466';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool start_ptp_sync
    bool start_burst
    uint32 burst_cycles
    uint32[] master_id_list
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new master_list(null);
    if (msg.start_ptp_sync !== undefined) {
      resolved.start_ptp_sync = msg.start_ptp_sync;
    }
    else {
      resolved.start_ptp_sync = false
    }

    if (msg.start_burst !== undefined) {
      resolved.start_burst = msg.start_burst;
    }
    else {
      resolved.start_burst = false
    }

    if (msg.burst_cycles !== undefined) {
      resolved.burst_cycles = msg.burst_cycles;
    }
    else {
      resolved.burst_cycles = 0
    }

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
