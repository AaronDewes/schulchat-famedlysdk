// @dart=2.9
class CallReplacesTarget {
  String id;
  String display_name;
  String avatar_url;

  CallReplacesTarget();
  factory CallReplacesTarget.fromJson(Map<String, dynamic> json) {
    return CallReplacesTarget()
      ..id = json['id'].toString()
      ..display_name = json['display_name'].toString()
      ..avatar_url = json['avatar_url'].toString();
  }
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (display_name != null) 'display_name': display_name,
      if (avatar_url != null) 'avatar_url': avatar_url,
    };
  }
}

/// MSC2747: VoIP call transfers
/// https://github.com/matrix-org/matrix-doc/pull/2747
class CallReplaces {
  String replacement_id;
  CallReplacesTarget target_user;
  String create_call;
  String await_call;
  String target_room;

  CallReplaces();
  factory CallReplaces.fromJson(Map<String, dynamic> json) {
    return CallReplaces()
      ..replacement_id = json['replacement_id'].toString()
      ..create_call = json['create_call'].toString()
      ..await_call = json['await_call'].toString()
      ..target_room = json['target_room'].toString()
      ..target_user = CallReplacesTarget.fromJson(json['target_user']);
  }

  Map<String, dynamic> toJson() {
    return {
      if (replacement_id != null) 'replacement_id': replacement_id,
      if (target_user != null) 'target_user': target_user.toJson(),
      if (create_call != null) 'create_call': create_call,
      if (await_call != null) 'await_call': await_call,
      if (target_room != null) 'target_room': target_room,
    };
  }
}

// TODO: Change to "sdp_stream_metadata" when MSC3077 is merged
const String sdpStreamMetadataKey = 'org.matrix.msc3077.sdp_stream_metadata';

/// https://github.com/matrix-org/matrix-doc/blob/dbkr/msc2747/proposals/2747-voip-call-transfer.md#capability-advertisment
/// https://github.com/matrix-org/matrix-doc/blob/dbkr/msc2746/proposals/2746-reliable-voip.md#add-dtmf
class CallCapabilities {
  bool transferee;
  bool dtmf;
  CallCapabilities();
  factory CallCapabilities.fromJson(Map<String, dynamic> json) {
    return CallCapabilities()
      ..dtmf = json['m.call.dtmf'] as bool ?? false
      ..transferee = json['m.call.transferee'] as bool ?? false;
  }
  Map<String, dynamic> toJson() {
    return {
      if (transferee != null) 'm.call.transferee': transferee,
      if (dtmf != null) 'm.call.dtmf': dtmf,
    };
  }
}

/// MSC3077: Support for multi-stream VoIP
/// https://github.com/matrix-org/matrix-doc/pull/3077
///
/// MSC3291: Muting in VoIP calls
/// https://github.com/SimonBrandner/matrix-doc/blob/msc/muting/proposals/3291-muting.md
///
/// This MSC proposes adding an sdp_stream_metadata field
/// to the events containing a session description i.e.:
/// m.call.invite, m.call.answer, m.call.negotiate
///
class SDPStreamPurpose {
  // SDPStreamMetadataPurpose
  String purpose;
  bool audio_muted;
  bool video_muted;

  SDPStreamPurpose();
  factory SDPStreamPurpose.fromJson(Map<String, dynamic> json) {
    return SDPStreamPurpose()
      ..audio_muted = json['audio_muted'] as bool ?? false
      ..video_muted = json['video_muted'] as bool ?? false
      ..purpose = json['purpose'] as String;
  }

  Map<String, dynamic> toJson() {
    return {
      'purpose': purpose,
      if (audio_muted != null) 'audio_muted': audio_muted,
      if (video_muted != null) 'video_muted': video_muted,
    };
  }
}

class SDPStreamMetadataPurpose {
  static String Usermedia = 'm.usermedia';
  static String Screenshare = 'm.screenshare';
}

class SDPStreamMetadata {
  Map<String, SDPStreamPurpose> sdpStreamMetadatas;
  SDPStreamMetadata(this.sdpStreamMetadatas);

  factory SDPStreamMetadata.fromJson(Map<String, dynamic> json) {
    return SDPStreamMetadata(json
        .map((key, value) => MapEntry(key, SDPStreamPurpose.fromJson(value))));
  }
  Map<String, dynamic> toJson() {
    return sdpStreamMetadatas
        .map((key, value) => MapEntry(key, value.toJson()));
  }
}

/// MSC3086: Asserted identity on VoIP calls
/// https://github.com/matrix-org/matrix-doc/pull/3086
class AssertedIdentity {
  String id;
  String displayName;
  String avatarUrl;
  AssertedIdentity();
  factory AssertedIdentity.fromJson(Map<String, dynamic> json) {
    return AssertedIdentity()
      ..displayName = json['display_name'] as String
      ..id = json['id'] as String
      ..avatarUrl = json['avatar_url'] as String;
  }
  Map<String, dynamic> toJson() {
    return {
      if (displayName != null) 'display_name': displayName,
      if (id != null) 'id': id,
      if (avatarUrl != null) 'avatar_url': avatarUrl,
    };
  }
}

