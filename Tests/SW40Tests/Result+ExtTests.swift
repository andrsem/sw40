// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct ResultTests {
   let numSuccess: Result<Int, SomeError> = .success(3)
   let numFailure: Result<Int, SomeError> = .failure(.boom)


   @Test
   func toOptional() {
      #expect(numSuccess.toOptional() == .some(3))
      #expect(numFailure.toOptional() == .none)
   }
}
