import components/logos
import components/types.{type Model}
import lustre/attribute.{alt, attribute, class, href, src, style, type_}
import lustre/element.{text}
import lustre/element/html.{a, button, div, img, p, span}
import lustre/element/svg.{path, svg}
import lustre/event

pub fn header(model: Model) {
  html.header([class("bg-white")], [nav(model)])
}

pub fn nav(model: Model) {
  html.nav(
    [
      class("mx-auto flex max-w-7xl items-center justify-between p-6 lg:px-8"),
      attribute("aria-label", "Global"),
    ],
    [logo(), hamburger(), menu(model), login_button()],
  )
}

pub fn logo() {
  div([class("flex lg:flex-1")], [
    a([href("#"), class("-m-1.5, p-1.5")], [
      span([class("sr-only")], [text("Your Company")]),
      img([
        class("h-8 w-auto"),
        src("https://tailwindui.com/img/logos/mark.svg?color=indigo&shade=600"),
        alt("Company Logo"),
      ]),
    ]),
  ])
}

pub fn hamburger() {
  div([class("flex lg:hidden")], [
    button(
      [
        type_("button"),
        class(
          "-m-2.5 inline-flex items-center justify-center rounded-md p-2.5 text-gray-700",
        ),
      ],
      [span([class("sr-only")], [text("Open main menu")]), logos.hamburger()],
    ),
  ])
}

pub fn product_button() {
  button(
    [
      event.on_click(types.UserClickedProducts),
      type_("button"),
      class(
        "flex items-center gap-x-1 text-sm font-semibold leading-6 text-gray-900",
      ),
      attribute("aria-expanded", "false"),
    ],
    [text("Product"), logos.caret_down()],
  )
}

pub fn analytics_menu_item() {
  div(
    [
      class(
        "group relative flex gap-x-6 rounded-lg p-4 text-sm leading-6 hover:bg-gray-50",
      ),
    ],
    [analytics_icon(), analytics_text()],
  )
}

pub fn analytics_icon() {
  div(
    [
      class(
        "mt-1 flex h-11 w-11 flex-none items-center justify-center rounded-lg bg-gray-50 group-hover:bg-white",
      ),
    ],
    [logos.analytics()],
  )
}

pub fn analytics_text() {
  div([class("flex-auto")], [
    a([href("#"), class("block font-semibold text-gray-900")], [
      text("Analytics"),
      span([class("absolute inset-0")], []),
    ]),
    p([class("mt-1 text-gray-600")], [
      text("Get a better understanding of your traffic"),
    ]),
  ])
}

pub fn product_flyout(state: types.TransitionState) {
  let transition =
    types.Transition(
      enter: #(
        "transition ease-out duration-300",
        "opacity-0 translate-y-1",
        "opacity-100 translate-y-0",
      ),
      leave: #(
        "transition ease-in duration-150",
        "opacity-100 translate-y-0",
        "opacity-0 translate-y-1",
      ),
    )
  let classes = types.get_classes(transition, state)
  div(
    [
      class(classes),
      class(
        "absolute -left-8 top-full z-10 mt-3 w-screen max-w-md overflow-hidden rounded-3xl bg-white shadow-lg ring-1 ring-gray-900/5",
      ),
    ],
    [div([class("p-4")], [analytics_menu_item()]), flyout_footer()],
  )
}

pub fn menu(model: Model) {
  div([class("hidden lg:flex lg:gap-x-12")], [
    div([class("relative")], [
      product_button(),
      product_flyout(model.product_transition),
    ]),
    a([href("#"), class("text-sm font-semibold leading-6 text-gray-900")], [
      text("Features"),
    ]),
    a([href("#"), class("text-sm font-semibold leading-6 text-gray-900")], [
      text("Marketplace"),
    ]),
    div([class("relative")], [
      button(
        [
          type_("button"),
          class(
            "flex items-center gap-x-1 text-sm font-semibold leading-6 text-gray-900",
          ),
          attribute("aria-expanded", "false"),
        ],
        [
          text("Company"),
          svg(
            [
              class("h-5 w-5 flex-none text-gray-400"),
              attribute("viewBox", "0 0 20 20"),
              attribute("fill", "currentColor"),
              attribute("aria-hidden", "true"),
            ],
            [
              path([
                attribute("fill-rule", "evenodd"),
                attribute("clip-rule", "evenodd"),
                attribute(
                  "d",
                  "M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z",
                ),
              ]),
            ],
          ),
        ],
      ),
    ]),
  ])
}

pub fn login_button() {
  div([class("hidden lg:flex lg:flex-1 lg:justify-end")], [
    a([href("#"), class("text-sm font-semibold leading-6 text-gray-900")], [
      text("Log in "),
      span([attribute("aria-hidden", "true")], [text("→")]),
    ]),
  ])
}

pub fn flyout_footer() {
  div([class("grid grid-cols-2 divide-x divide-gray-900/5 bg-gray-50")], [
    a(
      [
        href("#"),
        class(
          "flex items-center justify-center gap-x-2.5 p-3 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-100",
        ),
      ],
      [logos.play(), text("Watch demo")],
    ),
    a(
      [
        href("#"),
        class(
          "flex items-center justify-center gap-x-2.5 p-3 text-sm font-semibold leading-6 text-gray-900 hover:bg-gray-100",
        ),
      ],
      [logos.phone(), text("Contact sales")],
    ),
  ])
}
