import 'package:w_flux/w_flux.dart';

import 'stores.dart';

class VoteActions {
  final Action showClearModal = new Action();
  final Action showHelpModal = new Action();

  final Action<Vote> addVote = new Action<Vote>();

  final Action clearVoteCount = new Action<Vote>();
}
