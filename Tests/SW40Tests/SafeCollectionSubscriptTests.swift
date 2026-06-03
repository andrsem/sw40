// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct `Safe collection subscript tests` {
   func checkCollectionSubscript<C>(_ col: C)
   where
      C: SafeCollectionSubscript,
      C.Element == Int,
      C.Index == Int
   {
      #expect(col[safe: .min] == nil)
      #expect(col[safe: -1] == nil)
      #expect(col[safe: 0] == 1)
      #expect(col[safe: 2] == 3)
      #expect(col[safe: 3] == nil)
      #expect(col[safe: .max] == nil)
   }


   func checkCollectionSliceSubscript<C>(_ col: C)
   where
      C: SafeCollectionSubscript,
      C.Element == Int,
      C.Index == Int,
      C.SubSequence == ArraySlice<Int>
   {
      #expect(col.dropFirst()[safe: .min] == nil)
      #expect(col.dropFirst()[safe: 0] == nil)
      #expect(col.dropFirst()[safe: 1] == 2)
      #expect(col.dropFirst()[safe: 2] == 3)
      #expect(col.dropFirst()[safe: 3] == nil)
      #expect(col.dropFirst()[safe: .max] == nil)
   }


   @Test
   func `safe array subscript`() {
      checkCollectionSubscript([1, 2, 3] as Array)
      checkCollectionSubscript([1, 2, 3] as ContiguousArray)
   }


   @Test
   func `safe array slice subscript`() {
      checkCollectionSliceSubscript([1, 2, 3] as Array)
      checkCollectionSliceSubscript([1, 2, 3] as ContiguousArray)
   }


   @Test
   func `safe subscript on empty collection`() {
      let empty: [Int] = []
      #expect(empty[safe: 0] == nil)
      #expect(empty[safe: -1] == nil)
      #expect(empty[safe: .max] == nil)

      let emptySlice = empty[...]
      #expect(emptySlice[safe: 0] == nil)
   }
}
