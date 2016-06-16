import 'package:react/react.dart' as react;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import '../stores.dart';

typedef AddVoteFunction(Vote vote);

@Factory()
UiFactory<NewVoteInputProps> NewVoteInput;

@Props()
class NewVoteInputProps extends UiProps {
  AddVoteFunction onAddVote;
}

@State()
class NewVoteInputState extends UiState {
  String value;
}

@Component()
class NewVoteInputComponent extends UiStatefulComponent<NewVoteInputProps, NewVoteInputState> {
  getInitialState() => (newState()..value = '');

  @override
  render() {
    return (Dom.form()..onSubmit = _onSubmit)((TextInput()
      ..hideLabel = true
      ..placeholder = 'Add a new vote...'
      ..onChange = _onChange
      ..value = state.value)());
  }

  _onChange(react.SyntheticFormEvent event) {
    setState(newState()..value = event.target.value);
  }

  _onSubmit(react.SyntheticFormEvent event) {
    event.preventDefault();
    if (props.onAddVote != null) {
      props.onAddVote(new Vote(state.value));
      setState(newState()..value = '');
    }
  }
}
