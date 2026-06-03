// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct `Type tree tests` {
   @Test
   func `type tree tests`() {
      let r1 = typeTree(of: [3, 3].self)
      #expect(
         r1 == """
            Array<Int>
               ╰ Int = 3
               ╰ Int = 3
            """
      )

      struct Home {
         let address: String
         let owner: Owner
      }
      struct Owner { let name: String }
      let home1 = Home(address: "23 st", owner: .init(name: "Jake"))

      let r2 = typeTree(of: home1)
      #expect(
         r2 == """
            Home
               ╰ address: String = 23 st
               ╰ owner: Owner
                  ╰ name: String = Jake
            """
      )
   }
}
