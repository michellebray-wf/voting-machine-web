import 'package:react/react.dart' as react;
import 'package:truss/alert_manager.dart';
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

@Factory()
UiFactory<ClearTodosModalProps> ClearTodosModal;

@Props()
class ClearTodosModalProps extends ModalProps {
  AlertManager alertManager;
  Callback onClearTodoList;
  Callback onShowHelpModal;
}

@Component(subtypeOf: ModalComponent)
class ClearTodosModalComponent extends UiComponent<ClearTodosModalProps> {
  @override
  render() {
    return (Modal()
      ..addProps(copyUnconsumedProps())
      ..title = 'Clear todos?')((Dom.div()..className = 'modal-body')((ButtonGroup())(
        (Button()..onClick = _showHelpModal)('Wait what will this do?'),
        (Button()
          ..onClick = _clearTodos
          ..skin = ButtonSkin.DANGER)('Clear'))));
  }

  _clearTodos(react.SyntheticMouseEvent event) {
    props.onClearTodoList();
    props.onRequestHide(event);
    props.alertManager.success('Todos Cleared Successfully', title: 'Good News: ');
  }

  _showHelpModal(react.SyntheticMouseEvent event) {
    props.onShowHelpModal();
  }
}
