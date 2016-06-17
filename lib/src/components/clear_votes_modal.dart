import 'package:react/react.dart' as react;
import 'package:truss/alert_manager.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

@Factory()
UiFactory<ClearVotesModalProps> ClearVotesModal;

@Props()
class ClearVotesModalProps extends ModalProps {
  AlertManager alertManager;
  Callback onClearTodoList;
  Callback onShowHelpModal;
}

@Component(subtypeOf: ModalComponent)
class ClearVotesModalComponent extends UiComponent<ClearVotesModalProps> {
  @override
  render() {
    return (Modal()
      ..addProps(copyUnconsumedProps())
      ..title =
          'Clear Votes?')((Dom.div()..className = 'modal-body')((ButtonGroup())(
        (Button()..onClick = _showHelpModal)('Wait what will this do?'),
        (Button()
          ..onClick = _clearVotes
          ..skin = ButtonSkin.DANGER)('Clear'))));
  }

  _clearVotes(react.SyntheticMouseEvent event) {
    props.onClearTodoList();
    props.onRequestHide(event);
    props.alertManager
        .success('Votes Cleared Successfully', title: 'Good News: ');
  }

  _showHelpModal(react.SyntheticMouseEvent event) {
    props.onShowHelpModal();
  }
}
