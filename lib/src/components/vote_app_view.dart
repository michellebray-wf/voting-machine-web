import 'package:react/react.dart' as react;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import 'new_vote_input.dart';
import '../actions.dart';
import '../stores.dart';

@Factory()
UiFactory<VoteAppViewProps> VoteAppView;

@Props()
class VoteAppViewProps extends FluxUiProps<VoteActions, VoteStore> {
  bool showPageHeader;
}

@Component()
class VoteAppViewComponent extends FluxUiComponent<VoteAppViewProps> {
  getDefaultProps() => (newProps()..showPageHeader = true);

  @override
  render() {
    int optionA = 0;
    int optionB = 0;
    props.store.votes.forEach((Vote vote) {
      if (vote.option == "A") {
        optionA += 1;
      } else if (vote.option == "B") {
        optionB += 1;
      }
    });

    var pageHeader;
    if (props.showPageHeader) {
      pageHeader =
          (Dom.div()..className = 'page-header')(Dom.h1()('Voting Booth'));
    }

    return Dom.div()(
        pageHeader,
        Dom.p()(
            'A sample voting application filling the content area of a shell.'),
        (NewVoteInput()..onAddVote = props.actions.addVote)(),
        (Row()
          ..className = 'vote-counts'
          ..style = {'padding': '20px 0'})(
            (Column()
              ..md = 6
              ..mdPush = 6)(
                (Card()
                  ..header = (CardHeader()
                    ..leftCap = (Icon()..glyph = IconGlyph.CHECKMARK)())(
                      'Option A'))(optionA.toString())),
            (Column()
              ..md = 6
              ..mdPull = 6)(
                (Card()
                  ..header = (CardHeader()
                    ..leftCap = (Icon()..glyph = IconGlyph.CHECKMARK)())(
                      'Option B'))(optionB.toString()))),
        ButtonGroup()((Button()
          ..isDisabled = props.store.votes.length == 0
          ..onClick = _showClearModal)('Clear Vote Count')));
  }

  _showClearModal(react.SyntheticMouseEvent event) {
    if (props.actions.showClearModal != null) {
      props.actions.showClearModal();
    }
  }
}
