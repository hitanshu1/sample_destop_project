part of './Widgets.dart';

///A gaurd widget to wrap the given page if access is given or not
class CrudCover extends StatelessWidget {
  ///Feature the appUser is currently on
  final Feature feature;

  ///Operation to be checked
  final Crud crud;

  ///To use enabler or disabler instead of No access text
  final bool useEnabler;

  ///Child to be shown or hidden
  final Widget child;

  ///If to show a widget on no access
  final Widget? placeholder;
  /// constructor
  const CrudCover({
    super.key,
    required this.feature,
    required this.crud,
    required this.child,
    this.useEnabler = false,
    this.placeholder,
  });

  ///mcButton: Masters Complete button
  factory CrudCover.mcButton({
    ///Button
    required Widget child,
    required bool toEdit,
    Crud? crud,
  }) {
    return CrudCover(
      feature: Feature.Masters,
      crud: crud ?? (toEdit ? Crud.update : Crud.add),
      useEnabler: true,
      child: child,
    );
  }

  ///mcButton: Masters Delete button
  factory CrudCover.mcDeleteButton({required Widget child}) {
    return CrudCover(
      feature: Feature.Masters,
      crud: Crud.delete,
      useEnabler: true,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final UserModel? a = Widgets.instance.appUser;
    bool allow = false;
    switch (crud) {
      case Crud.add:
        allow = a?.create.contains(feature.name)??false;
        break;
      case Crud.get:
        allow = a?.read.contains(feature.name)??false;
        break;
      case Crud.update:
        allow = a?.update.contains(feature.name)??false;
        break;
      case Crud.delete:
        allow = a?.delete.contains(feature.name)??false;
        break;
      default:
    }
    if (allow) {
      return child;
    } else {
      return useEnabler
          ? Enabler(enabled: false, child: child)
          : placeholder ?? const Center(child: Txt('No Access!'));
    }
  }
}
