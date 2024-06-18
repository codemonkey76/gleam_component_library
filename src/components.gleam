import components/types.{
  type Model, type Msg, Model, TransitionStarted, UserClickedProducts,
}
import components/ui
import components/window
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
  #(Model(product_transition: types.TransitionState()), effect.none())
}

pub fn update(model: Model, msg: Msg) -> #(Model, Effect(Msg)) {
  case msg {
    UserClickedProducts ->
      case model.product_transition {
        types.Transition(direction: types.Entering, ..) -> #(
          Model(
            ..model,
            product_transition: types.Transition(
              ..model.product_transition,
              direction: types.Leaving,
            ),
          ),
          start_transition(),
        )
        types.Transition(direction: types.Leaving, ..) -> #(
          Model(
            ..model,
            product_transition: types.Transition(
              ..model.product_transition,
              direction: types.Entering,
            ),
          ),
          start_transition(),
        )
      }
    TransitionStarted -> {
      #(
        Model(
          ..model,
          product_transition: types.Transition(
            ..model.product_transition,
            transitioning: True,
          ),
        ),
        effect.none(),
      )
    }
  }
}

fn start_transition() -> Effect(Msg) {
  use dispatch <- effect.from
  use _ts <- window.request_animation_frame
  TransitionStarted
  |> dispatch
}

pub fn view(model: Model) -> element.Element(Msg) {
  html.div([class("bg-gray-900")], [ui.header(model)])
}
