// ignore_for_file: public_member_api_docs

part of './Constants.dart';

///CRUD operation types which are to be used inside [Bloc]
enum Crud {
  ///read
  get,

  ///create
  add,

  update,
  delete,
}

extension CrudExtension on Crud {
  String get label {
    switch (this) {
      case Crud.add:
        return 'Added';
      case Crud.update:
        return 'Edited';
      case Crud.delete:
        return 'Deleted';
      case Crud.get:
        return 'Viewed';
      default:
        return name;
    }
  }

  Color? get color {
    switch (this) {
      case Crud.add:
        return Colors.green;
      case Crud.update:
        return Colors.amber;
      case Crud.delete:
        return Colors.red;
      case Crud.get:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}

///Returns the type of crud from the given [String]
Crud crudFromString(String? type) {
  return Crud.values.singleWhere((Crud e) => e.name == type, orElse: () => Crud.get);
}
