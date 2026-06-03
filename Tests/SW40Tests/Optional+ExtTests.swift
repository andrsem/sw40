// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct OptionalTests {
   let num: Int? = 3
   let nilNum: Int? = nil

   @Test
   func toResult() {
      let r1 = num.toResult(or: SomeError.boom)
      let r2 = nilNum.toResult(or: SomeError.boom)
      #expect(r1 == .success(3))
      #expect(r2 == .failure(.boom))

      #expect(type(of: r1) == Result<Int, SomeError>.self)
   }
}
