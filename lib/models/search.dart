class Search {
  String? userName;
  String? urlProfile;
  String? name;

  Search({
    this.userName,
    this.name,
    this.urlProfile
  });


  Search.fromJson(Map<String, dynamic> json) {
    name = json['full_name'];
    userName = json['username'];
    urlProfile = json['profile_pic_url'];
  }
}