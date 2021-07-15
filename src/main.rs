#[allow(clippy::all)]
mod bindings {
    include!(concat!(env!("OUT_DIR"), "/bindings.rs"));
}
pub use bindings::*;

fn main() {
    unsafe {
        assert_eq!(0, laszip_load_dll());
    }
}
