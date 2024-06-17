pub type Model {
  Model(product_transition: Transition)
}

pub type Msg {
  UserClickedProducts
  TransitionStarted
}

pub type Transition {
  Transition(
    direction: TransitionDirection,
    complete: Bool,
    transitioning: Bool,
    enter_classes: TransitionClasses,
    leave_classes: TransitionClasses,
  )
}

pub type TransitionDirection {
  Entering
  Leaving
}

pub type TransitionClasses {
  TransitionClasses(all: String, from: String, to: String)
}

pub fn get_classes(transition: Transition) {
  case transition {
    Transition(direction: Entering, ..) ->
      case transition.complete {
        False ->
          transition.enter_classes.all <> " " <> transition.enter_classes.from
        True ->
          transition.enter_classes.all <> " " <> transition.enter_classes.to
      }
    Transition(direction: Leaving, ..) ->
      case transition.complete {
        False ->
          transition.leave_classes.all <> " " <> transition.leave_classes.from
        True ->
          transition.leave_classes.all <> " " <> transition.leave_classes.to
      }
  }
}
