pub type Model {
  Model(is_entering: Bool, entered: Bool, is_leaving: Bool, is_hidden: Bool)
}

pub type Msg {
  UserClickedProducts
  TransitionStarted
}
