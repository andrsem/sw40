// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct CollectionTests {
   @Test
   func ifEmpty() {
      #expect([String]().ifEmpty(["x"]) == ["x"])
      #expect(["a", "b"].ifEmpty(["x"]) == ["a", "b"])
      #expect(Set<Int>().ifEmpty([4]) == [4])
      #expect(Set<Int>([1, 2]).ifEmpty([4]) == [1, 2])
      #expect("".ifEmpty("x") == "x")
      #expect("abc".ifEmpty("x") == "abc")
   }
}
