import lustre/attribute.{attribute, class}
import lustre/element/svg.{path, svg}

pub fn caret_down() {
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
        attribute(
          "d",
          "M5.23 7.21a.75.75 0 011.06.02L10 11.168l3.71-3.938a.75.75 0 111.08 1.04l-4.25 4.5a.75.75 0 01-1.08 0l-4.25-4.5a.75.75 0 01.02-1.06z",
        ),
        attribute("clip-rule", "evenodd"),
      ]),
    ],
  )
}

pub fn analytics() {
  svg(
    [
      class("h-6 w-6 text-gray-600 group-hover:text-indigo-600"),
      attribute("fill", "none"),
      attribute("viewBox", "0 0 24 24"),
      attribute("stroke-width", "1.5"),
      attribute("stroke", "currentColor"),
      attribute("aria-hidden", "true"),
    ],
    [
      path([
        attribute("stoke-linecap", "round"),
        attribute("stroke-linejoin", "round"),
        attribute("d", "M10.5 6a7.5 7.5 0 107.5 7.5h-7.5V6z"),
      ]),
      path([
        attribute("stoke-linecap", "round"),
        attribute("stroke-linejoin", "round"),
        attribute("d", "M13.5 10.5H21A7.5 7.5 0 0013.5 3v7.5z"),
      ]),
    ],
  )
}

pub fn hamburger() {
  svg(
    [
      class("h-6 w-6"),
      attribute("fill", "none"),
      attribute("viewBox", "0 0 24 24"),
      attribute("stroke-width", "1.5"),
      attribute("stroke", "currentColor"),
      attribute("aria-hidden", "true"),
    ],
    [
      path([
        attribute("stroke-linecap", "round"),
        attribute("stroke-linejoin", "round"),
        attribute("d", "M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5"),
      ]),
    ],
  )
}

pub fn play() {
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
          "M2 10a8 8 0 1116 0 8 8 0 01-16 0zm6.39-2.908a.75.75 0 01.766.027l3.5 2.25a.75.75 0 010 1.262l-3.5 2.25A.75.75 0 018 12.25v-4.5a.75.75 0 01.39-.658z",
        ),
      ]),
    ],
  )
}

pub fn phone() {
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
          "M2 3.5A1.5 1.5 0 013.5 2h1.148a1.5 1.5 0 011.465 1.175l.716 3.223a1.5 1.5 0 01-1.052 1.767l-.933.267c-.41.117-.643.555-.48.95a11.542 11.542 0 006.254 6.254c.395.163.833-.07.95-.48l.267-.933a1.5 1.5 0 011.767-1.052l3.223.716A1.5 1.5 0 0118 15.352V16.5a1.5 1.5 0 01-1.5 1.5H15c-1.149 0-2.263-.15-3.326-.43A13.022 13.022 0 012.43 8.326 13.019 13.019 0 012 5V3.5z",
        ),
      ]),
    ],
  )
}
