import components/types.{
  type Model, type Msg, Model, TransitionStarted, UserClickedProducts,
}
import components/ui
import components/window
import gleam/io
import lustre
import lustre/attribute.{class}
import lustre/effect.{type Effect}
import lustre/element
import lustre/element/html

pub fn main() {
  let app = lustre.application(init, update, view)
  let assert Ok(_) = lustre.start(app, "#app", Nil)

  Nil
}

fn init(_flags) -> #(Model, Effect(Msg)) {
  #(
    Model(
      is_entering: False,
      entered: False,
      is_leaving: False,
      is_hidden: False,
    ),
    effect.none(),
  )
}

pub fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    UserClickedProducts -> {
      io.println("User clicked products")
      #(Model(..model, is_entering: True), start_transition())
    }
    TransitionStarted -> {
      io.println("Transition started")
      #(Model(..model, entered: True), effect.none())
    }
  }
}

fn start_transition() -> Effect(Msg) {
  effect.from(fn(dispatch) {
    io.println("start_transition()")
    window.request_animation_frame(do_something)

    dispatch(TransitionStarted)
  })
}

fn do_something(_timestamp: Float) {
  io.println("doing something")
}

pub fn view(model: Model) -> element.Element(Msg) {
  html.div([class("bg-gray-900")], [ui.header(model)])
}
