// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Test
func pipe() throws {
   func add(a: Int, b: Int) -> Int { a + b }
   func addThrow(a: Int, b: Int) throws(SomeError) -> Int { throw .boom }

   #expect(4 |> String.init == "4")
   #expect((2, 1) |> add == 3)
   #expect(throws: SomeError.boom) { try (2, 1) |> addThrow }

   struct Person: ~Copyable {
      let name: String
      let age: UInt
   }

   let drac = Person(name: "Dracula", age: 523)

   #expect(drac |> { ($0.name, $0.age) } == ("Dracula", 523))
}


@Test
func asyncPipe() async throws {
   func add(a: Int, b: Int) async -> Int { a + b }
   func addThrow(a: Int, b: Int) async throws(SomeError) -> Int { throw .boom }

   #expect(await (2, 1) |> add == 3)
   await #expect(throws: SomeError.boom) { try await (2, 1) |> addThrow }
}


@Test
func `mix async and sync pipes`() async throws {
   func add(a: Int, b: Int) async -> Int { a + b }
   func double(a: Int) -> Int { a * a }
   func strAndCount(a: Int) async -> (String, Int) {
      (String(a), String(a).count)
   }
   let result = await (2, 2) |> add |> double |> strAndCount
   #expect(result == ("16", 2))
}
