// SPDX-FileCopyrightText: © 2026 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Test(
   arguments: [
      [1, 2, 3, 4, 5, 6, 7],
      [1, 2, 3],
      [],
   ],
   [-1, 0, 1, 5, nil]
)
func `pmap test`(array: [Int], tasks: Int?) async throws {
   #expect(
      await array.pmap(maxTasks: tasks, \.description)
         == array.map(\.description)
   )
}


@Test(arguments: [-1, 0, 1, 5, nil])
func `pmap preserves optional results`(tasks: Int?) async throws {
   let array = [1, 2, 3]

   #expect(
      await array.pmap(maxTasks: tasks) { $0.isMultiple(of: 2) ? nil : $0 }
         == [1, nil, 3]
   )
}



@Test(
   arguments: [1, 4, 7],
   [-1, 0, 1, 5, nil]
)
func `pmap throws test`(throwingElement: Int, tasks: Int?) async throws {
   let array = [1, 2, 3, 4, 5, 6, 7]

   @Sendable
   func transform(_ element: Int) throws -> Int {
      guard element != throwingElement else { throw SomeError.boom }
      return element
   }

   #expect(throws: SomeError.boom) {
      try array.map(transform)
   }
   await #expect(throws: SomeError.boom) {
      try await array.pmap(maxTasks: tasks, transform)
   }
}
