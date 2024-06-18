pub type Model {
  Model(product_transition: TransitionState)
}

pub type Msg {
  UserClickedProducts
  TransitionStarted
}

pub type TransitionState {
  TransitionState(direction: TransitionDirection, complete: Bool)
}

pub type Transition {
  Transition(enter: #(String, String, String), leave: #(String, String, String))
}

pub type TransitionDirection {
  Entering
  Leaving
}

pub fn apply_transition(transition: Transition, state: TransitionState) {
  case state {
    TransitionState(direction: Entering, ..) ->
      case state.complete {
        False -> transition.enter.0 <> " " <> transition.enter.1
        True -> transition.enter.0 <> " " <> transition.enter.2
      }
    TransitionState(direction: Leaving, ..) ->
      case state.complete {
        False -> transition.leave.0 <> " " <> transition.leave.1
        True -> transition.leave.0 <> " " <> transition.leave.2
      }
  }
}
