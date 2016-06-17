import 'package:truss/modal_manager.dart';
import 'package:truss/alert_manager.dart';
import 'package:w_module/w_module.dart';

import 'actions.dart';
import 'stores.dart';
import 'components/clear_votes_modal.dart';
import 'components/vote_app_view.dart';
import 'components/vote_app_sidebar_content.dart';
import 'components/vote_app_modal.dart';

class VoteModule extends Module {
  VoteActions _actions;
  VoteComponents _components;
  VoteStore _store;
  ModalManager _modalManager;
  AlertManager _alertManager;

  VoteModule({ModalManager modalManager, AlertManager alertManager})
      : _modalManager = modalManager,
        _alertManager = alertManager {
    _modalManager = _modalManager ?? new ModalManager();
    _alertManager = _alertManager ?? new AlertManager();

    _actions = new VoteActions();
    _store = new VoteStore(_actions);
    _components = new VoteComponents(_actions, _store, _modalManager);

    // Hook up modals
    _actions.showClearModal.listen((_) {
      _modalManager.show((ClearVotesModal()
        ..alertManager = _alertManager
        ..onClearTodoList = _actions.clearVoteCount
        ..onShowHelpModal = _actions.showHelpModal)());
    });
    _actions.showHelpModal.listen((_) {
      _modalManager.alert(
          'This will delete all of the votes that have been cast already.',
          title: 'Delete All Votes');
    });
  }

  VoteComponents get components => _components;
}

class VoteComponents extends ModuleComponents {
  VoteActions _actions;
  ModalManager _modalManager;
  VoteStore _store;

  VoteComponents(this._actions, this._store, this._modalManager);

  content() => (VoteAppView()
    ..actions = _actions
    ..store = _store)();

  modal() => (VoteAppModal()
    ..actions = _actions
    ..store = _store)();

  sidebar() => VoteAppSidebarContent()();
}
