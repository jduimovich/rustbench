use std::time::{SystemTime}; 
fn main() { 
   let now = SystemTime::now();
   for _x in 0..200000 { 
    fib (12);
   }   
   match now.elapsed() {
    Ok(elapsed) => {println!("Bench time for Fib {}", elapsed.as_millis());}
    Err(e) => {println!("Error: {:?}", e); }
  }
}
fn fib (n:i32) -> i32 { 
    if n < 3 { return 1; } 
    return fib (n-1) + fib (n-2)
}
