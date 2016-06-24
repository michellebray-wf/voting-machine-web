import 'package:react/react.dart' as react;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

typedef AddVoteFunction(String vote);

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
  ToggleInputGroupComponent _input;

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
      var value = _input.getValue();
      props.onAddVote(value.single);
      setState(newState()..option = '');
    }
  }
}
