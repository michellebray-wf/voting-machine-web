import 'package:truss/truss.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

@Factory()
UiFactory<ToDoAppSidebarContentProps> ToDoAppSidebarContent;

@Props()
class ToDoAppSidebarContentProps extends UiProps {}

@Component()
class ToDoAppSidebarContentComponent extends UiComponent<ToDoAppSidebarContentProps> {
  @override
  render() {
    return WorkspacesMenu()((WorkspacesMenuItem()
      ..active = true
      ..icon = IconGlyph.TASK_CREATE
      ..text = 'Todos')());
  }
}
