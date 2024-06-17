import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn hello_test() {
  "hello world!" |> should.equal("hello world!")
}
