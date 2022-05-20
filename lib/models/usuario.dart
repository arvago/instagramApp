import 'dart:ffi';

class Usuario {
  int? id;
  String? userName;
  int? followers;
  int? following;
  int? cantPosts;
  String? urlProfile;
  Array? posts;
  String? name;

  Usuario({
    this.id,
    this.userName,
    this.name,
    this.followers,
    this.following,
    this.posts,
    this.urlProfile,
    this.cantPosts
  });


  Usuario.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['full_name'];
    followers = json['followers'];
    following = json['following'];
    userName = json['username'];
    posts = json['lastMedia']['media'];
    urlProfile = json['profile_pic_url'];
    cantPosts = json['lastMedia']['count'];
  }
}