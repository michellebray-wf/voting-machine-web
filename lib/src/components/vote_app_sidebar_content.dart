import 'package:truss/truss.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

@Factory()
UiFactory<VoteAppSidebarContentProps> VoteAppSidebarContent;

@Props()
class VoteAppSidebarContentProps extends UiProps {}

@Component()
class VoteAppSidebarContentComponent
    extends UiComponent<VoteAppSidebarContentProps> {
  @override
  render() {
    return WorkspacesMenu()((WorkspacesMenuItem()
      ..active = true
      ..icon = IconGlyph.TASK_CREATE
      ..text = 'Votes')());
  }
}
