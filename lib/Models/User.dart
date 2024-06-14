

/// app User Model
class UserModel{
  ///user ID
  String ? id;
  /// name of user
  String? name;
  ///List of pages where this user can access [Add] pages
  final List<String> create;

  ///List of features this user is allowed to [View]
  final List<String> read;

  ///List of pages where this user can access [Edit] pages
  final List<String> update;
  ////List of pages where this user can access [Delete] pages
  final List<String> delete;
  /// constructor
  UserModel({this.name,this.id,
    this.create = const <String>[],
    this.read = const <String>[],
    this.update = const <String>[],
    this.delete = const <String>[],});
}
