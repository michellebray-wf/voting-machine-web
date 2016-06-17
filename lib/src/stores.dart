import 'package:w_flux/w_flux.dart';

import 'actions.dart';

class VoteStore extends Store {
  /// Public data
  int _votesA;
  int _votesB;
  int get votesA => _votesA;
  int get votesB => _votesB;

  /// Internals
  VoteActions _actions;

  VoteStore(VoteActions this._actions) {
    _votesA = 0;
    _votesB = 0;

    _actions.addVote.listen(_addVote);
    _actions.clearVoteCount.listen(_clearVoteCount);
  }

  _addVote(String option) {
    if (option == "optionA") {
      _votesA += 1;
    } else if (option == "optionB") {
      _votesB += 1;
    }
    trigger();
  }

  _clearVoteCount(_) {
    _votesA = 0;
    _votesB = 0;
    trigger();
  }
}
