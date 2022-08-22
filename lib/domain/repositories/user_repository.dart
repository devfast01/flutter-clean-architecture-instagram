import 'dart:io';
import 'dart:typed_data';
import 'package:instagram/data/models/message.dart';
import 'package:instagram/data/models/post.dart';
import 'package:instagram/data/models/sender_info.dart';
import 'package:instagram/data/models/specific_users_info.dart';
import 'package:instagram/data/models/user_personal_info.dart';

abstract class FirestoreUserRepository {
  Future<void> addNewUser(UserPersonalInfo newUserInfo);

  Future<UserPersonalInfo> getPersonalInfo(
      {required String userId, bool getDeviceToken = false});

  Future<List<UserPersonalInfo>> getAllUnFollowersUsers(
      UserPersonalInfo myPersonalInfo);

  Stream<List<UserPersonalInfo>> getAllUsers();

  Future<UserPersonalInfo?> getUserFromUserName({required String userName});

  Future<UserPersonalInfo> updateUserPostsInfo(
      {required String userId, required Post postInfo});

  Future<UserPersonalInfo> updateUserInfo({required UserPersonalInfo userInfo});

  Future<String> uploadProfileImage(
      {required Uint8List photo,
      required String userId,
      required String previousImageUrl});

  Future<FollowersAndFollowingsInfo> getFollowersAndFollowingsInfo(
      {required List<dynamic> followersIds,
      required List<dynamic> followingsIds});

  Future<List<UserPersonalInfo>> getSpecificUsersInfo(
      {required List<dynamic> usersIds});

  Future<void> followThisUser(String followingUserId, String myPersonalId);

  Future<void> unFollowThisUser(String followingUserId, String myPersonalId);

  Future<Message> sendMessage(
      {required Message messageInfo,
      Uint8List? pathOfPhoto,
      required File? recordFile});

  Stream<List<Message>> getMessages({required String receiverId});

  Stream<UserPersonalInfo> getMyPersonalInfo();

  Stream<List<UserPersonalInfo>> searchAboutUser(
      {required String name, required bool searchForSingleLetter});
  Future<void> deleteMessage(
      {required Message messageInfo, Message? replacedMessage});
  Future<List<SenderInfo>> getChatUserInfo({required String userId});
}
