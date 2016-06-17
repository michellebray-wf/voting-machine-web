import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import '../actions.dart';
import '../stores.dart';
import 'vote_app_view.dart';

@Factory()
UiFactory<VoteAppModalProps> VoteAppModal;

@Props()
class VoteAppModalProps extends ModalProps {
  VoteActions actions;
  VoteStore store;
}

@Component(subtypeOf: ModalComponent)
class VoteAppModalComponent extends UiComponent<VoteAppModalProps> {
  @override
  render() {
    return (Modal()
      ..addProps(copyUnconsumedProps())
      ..title = 'My Todos')(
        DialogBody()((VoteAppView()
          ..actions = props.actions
          ..showPageHeader = false
          ..store = props.store)()),
        DialogFooter()((Button()..onClick = props.onRequestHide)('Done')));
  }
}
