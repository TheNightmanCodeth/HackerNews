# HackerNews

This project is just a simple app to demonstrate my idea of "clean" iOS modularization

It's not actually a hackernews client. It just pulls posts from HN and displays their title and author in a list. Maybe one day it will also show comments but I don't know if I'll ever feel like working out the leveled comment tree nightmare. It's just to prove out how this architecture pattern can be implemented in a simple app and how it makes testing and dynamic navigation simple.

Core depenedencies are implemented as SPM packages in `Packages/Core`

Their "proto" modules are imported by features in `Packages/Features` and concrete implementations are provided via the SwiftUI Environment from the app module entrypoint.

Previews are also given Mock implementations, often from within their own module. I'd like to sort that out eventually to reduce inter-module dependencies.

# TODO:

- Build out injection framework (need to make Core deps `Observable`)
- Build out `Router` to dynamically navigate (potentially cross-module)
- Improve mocking system with mock response json
- Finish list UI
- Build out comment section UI
- Build out some unit tests that showcase the mocking system

# What this is

Just a demonstration of my idea of "clean" modular architecture and what's possible 

# What this isn't

A HackerNews app that is any good or does anything useful
