import 'package:react/react.dart' as react;
import 'package:web_skin_dart/ui_components.dart';
import 'package:web_skin_dart/ui_core.dart';

import '../stores.dart';

@Factory()
UiFactory<VoteCountProps> VoteCount;

@Props()
class VoteCountProps extends UiProps {
  int countA;
  int countB;
}

@Component()
class VoteCountComponent extends UiComponent<VoteCountProps> {
  @override
  render() {
    return (Panel()..heading = Dom.h4()('Option A')(props.countA),
        (Panel()..heading = Dom.h4()('Option B'))(props.countB));
  }
}
