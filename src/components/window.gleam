pub type RequestID =
  Nil

@external(javascript, "../window_ffi.mjs", "requestAnimationFrame")
pub fn request_animation_frame(callback: fn(Float) -> Nil) -> RequestID
