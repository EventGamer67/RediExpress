class ProfileListTileData {
  final String title;
  final String subString;
  final String image;
  final Function(dynamic) onTap;
  ProfileListTileData({
    required this.title,
    required this.subString,
    required this.image,
    required this.onTap,
  });
}