#!/usr/bin/env xcrun swift

var args: [String] = Process.arguments
println("Hello Swift World")
for s in args {
	println("[ARG]: " + s)
}
