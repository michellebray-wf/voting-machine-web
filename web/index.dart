library voting_machine.index;

import 'dart:html';

import 'package:react/react_client.dart' as react_client;
import 'package:react/react_dom.dart' as react_dom;

import 'package:voting_machine/app.dart';

main() async {
  Element container = querySelector('#shell-container');
  react_client.setClientConfiguration();

  VoteModule voteModule = new VoteModule();
  react_dom.render(voteModule.components.content(), container);
}
