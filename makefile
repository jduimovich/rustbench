# Project: Rust

all: fib bench

fib: fib.rs
	rustc fib.rs

src/main.rs: fib.rs
	cp fib.rs src/main.rs 

target/wasm32-wasi/debug/rustdemo.wasm: src/main.rs 
	cargo build --target wasm32-wasi

showsrc: 
	@echo  "--- RUST--------------------"
	cat fib.rs
	@echo  "--- JS--------------------"
	cat fib.js
	@echo  "--- Java--------------------"
	cat Fib.java

bench: fib target/wasm32-wasi/debug/rustdemo.wasm 
	@echo  "This one is plain old rust (rustc fib.rs; ./fib)"
	./fib

	wasmer run target/wasm32-wasi/debug/rustdemo.wasm 
	wasmer run --backend=llvm target/wasm32-wasi/debug/rustdemo.wasm 
	@echo  JavaScript T4 and Node.js

	T4_OPTIONS="-inline 0" t4o fib.js
	T4_OPTIONS="-inline 1" t4o fib.js
	T4_OPTIONS="-inline 2" t4o fib.js

	node fib.js

	@echo  "--- For compare - Java -------------"
	java -cp . Fib


