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
  String option;
}

@Component()
class NewVoteInputComponent
    extends UiStatefulComponent<NewVoteInputProps, NewVoteInputState> {
  ToggleInputComponent _input;

  getInitialState() => (newState()..option = '');

  @override
  render() {
    return (Form()(
        (ToggleInputGroup()
          ..groupLabel = 'Voting Options'
          ..hideGroupLabel = true
          ..ref = (input) {
            this._input = input;
          })(
            (RadioInput()
              ..isInline = true
              ..defaultChecked = true
              ..value = 'optionA'
              ..label = 'Option A')(),
            (RadioInput()
              ..isInline = true
              ..value = 'optionB'
              ..label = 'Option B')()),
        FormGroup()((Button()
          ..skin = ButtonSkin.PRIMARY
          ..onClick = _onClick)('Cast Vote'))));
  }

  _onClick(react.SyntheticMouseEvent event) {
    event.preventDefault();
    if (props.onAddVote != null) {
      print(this._input.getValue());
      var list = ['optionA'];
      print(list);
      print(this._input.getValue() == "[optionA]");
      print(this._input.getValue() == ['optionA']);
      print(this._input.getValue() == list);
      props.onAddVote(new Vote(state.option));
      setState(newState()..option = '');
    }
  }
}
