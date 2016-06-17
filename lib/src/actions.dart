import 'package:w_flux/w_flux.dart';

class VoteActions {
  final Action showClearModal = new Action();
  final Action showHelpModal = new Action();

  final Action<String> addVote = new Action<String>();

  final Action clearVoteCount = new Action();
}
