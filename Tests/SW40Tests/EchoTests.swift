// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Test
func `echo`() async {
   #expect(echo(4) == 4)
   #expect(echo("hi") == "hi")

   let exp =
      ["five"]
      .map(\.count)
      |> { echo($0, "count") }

   #expect(exp == [4])


   let a = [2, 3].echo(format: typeTree)
   #expect(a == [2, 3])

   let c: [String] =
      [5, 2, 3]
      .sorted()
      .echo()
      .map(String.init)
      .echo()

   #expect(c == ["2", "3", "5"])

   struct A: Equatable, Echoed { let name: String }
   #expect(A(name: "a").echo() == A(name: "a"))
}
