import 'package:w_flux/w_flux.dart';

import 'actions.dart';

class VoteStore extends Store {
  /// Public data
  List<Vote> _votes;
  List<Vote> get votes => _votes;

  /// Internals
  VoteActions _actions;

  VoteStore(VoteActions this._actions) {
    _votes = [];

    _actions.addVote.listen(_addVote);
    _actions.clearVoteCount.listen(_clearVoteCount);
  }

  _addVote(Vote vote) {
    _votes.add(vote);
    trigger();
  }

  _clearVoteCount(_) {
    _votes = [];
    trigger();
  }
}

class Vote {
  String option;

  Vote(String this.option);
}
