import 'package:react/react.dart' as react;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import 'new_vote_input.dart';
import 'vote_count.dart';
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
    int i = 0;
    props.store.votes.forEach((Vote vote) {
      if (vote.option == "A") {
          optionA += 1;
      } else if (vote.option == "B") {
          optionB += 1;
      }
    });

    var pageHeader;
    if (props.showPageHeader) {
      pageHeader = (Dom.div()..className = 'page-header')(Dom.h1()('Voting Booth'));
    }

    return Dom.div()(
        pageHeader,
        Dom.p()('A sample voting application filling the content area of a shell.'),
        (NewVoteInput()..onAddVote = props.actions.addVote)(),
        (optionA),
        (optionB),
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
