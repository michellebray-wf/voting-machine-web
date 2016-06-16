import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import '../actions.dart';
import '../stores.dart';
import 'vote_app_view.dart';

@Factory()
UiFactory<TodoAppModalProps> TodoAppModal;

@Props()
class TodoAppModalProps extends ModalProps {
  ToDoActions actions;
  ToDoStore store;
}

@Component(subtypeOf: ModalComponent)
class TodoAppModalComponent extends UiComponent<TodoAppModalProps> {
  @override
  render() {
    return (Modal()
      ..addProps(copyUnconsumedProps())
      ..title = 'My Todos')(
        DialogBody()((ToDoAppView()
          ..actions = props.actions
          ..showPageHeader = false
          ..store = props.store)()),
        DialogFooter()((Button()..onClick = props.onRequestHide)('Done')));
  }
}
