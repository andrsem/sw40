// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct `StringProtocol ext tests` {
   @Test
   func `expanded string`() {
      let r1 = "Hello".expanded(to: -1)
      let e1 = "Hello"
      #expect(r1 == e1)

      let r2 = "Hello".expanded(to: 1)
      let e2 = "Hello"
      #expect(r2 == e2)

      let r3 = "Hello".expanded(to: 7)
      let e3 = "Hello  "
      #expect(r3 == e3)

      let r4 = "Hello".expanded(to: 7, with: "^")
      let e4 = "Hello^^"
      #expect(r4 == e4)
   }


   @Test
   func `trimming string suffix`() {
      #expect("".trimmingPrefix("") == "")
      #expect("".trimmingSuffix("") == "")
      #expect(" ".trimmingPrefix("") == " ")
      #expect(" ".trimmingSuffix("") == " ")
      #expect("".trimmingPrefix("bc") == "")
      #expect("".trimmingSuffix("bc") == "")
      #expect("abc".trimmingPrefix("ab") == "c")
      #expect("abc".trimmingSuffix("bc") == "a")
      #expect("a b c".trimmingPrefix("a ") == "b c")
      #expect("a b c".trimmingSuffix(" c") == "a b")
   }


   @Test
   func `truncated to length at tail`() {
      #expect("Hello".truncated(.tail, to: 1) == "…")
      #expect("Hello".truncated(.tail, to: 0) == "…")
      #expect("".truncated(.tail, to: 0) == "")
      #expect("".truncated(.tail, to: 1) == "")
      #expect("Hello".truncated(.tail, to: -1) == "…")
      #expect("Hello".truncated(.tail, to: 2) == "H…")
      #expect("Hello".truncated(.tail, to: 10) == "Hello")
   }


   @Test(arguments: [2, 1, 0, -1, Int.min])
   func `truncated to length with suffix at tail`(_ length: Int) {
      #expect("Hello".truncated(.tail, to: length, with: "..") == "..")
      #expect("Hello".truncated(.tail, to: 3, with: "...") == "...")
      #expect("Hello".truncated(.tail, to: 3, with: "..") == "H..")
      #expect("Hello".truncated(.tail, to: 3, with: "") == "Hel")
      #expect("Hello".truncated(.tail, to: 0, with: "") == "")
      #expect("Hello".truncated(.tail, to: 10, with: "..") == "Hello")
      #expect("Hello".truncated(.tail, to: Int.max, with: "..") == "Hello")
   }


   @Test
   func `truncated to length at head`() {
      #expect("Hello".truncated(.head, to: 1) == "…")
      #expect("Hello".truncated(.head, to: 3) == "…lo")
      #expect("Hello".truncated(.head, to: 0) == "…")
      #expect("".truncated(.head, to: 0) == "")
      #expect("".truncated(.head, to: 1) == "")
      #expect("Hello".truncated(.head, to: -1) == "…")
      #expect("Hello".truncated(.head, to: 10) == "Hello")
   }


   @Test(arguments: [2, 1, 0, -1, Int.min])
   func `truncated to length with suffix at head`(_ length: Int) {
      #expect("Hello".truncated(.head, to: length, with: "..") == "..")
      #expect("Hello".truncated(.head, to: 3, with: "..") == "..o")
      #expect("Hello".truncated(.head, to: 3, with: "...") == "...")
      #expect("Hello".truncated(.head, to: 3, with: "") == "llo")
      #expect("Hello".truncated(.head, to: 0, with: "") == "")
      #expect("Hello".truncated(.head, to: 4, with: "..") == "..lo")
      #expect("Hello".truncated(.head, to: 5, with: "..") == "Hello")
      #expect("Hello".truncated(.head, to: 10, with: "..") == "Hello")
      #expect("Hello".truncated(.head, to: Int.max, with: "..") == "Hello")
   }


   @Test
   func `truncated to length at middle`() {
      #expect("Hello".truncated(.middle, to: 1) == "…")
      #expect("Hello".truncated(.middle, to: 3) == "H…o")
      #expect("".truncated(.middle, to: 0) == "")
      #expect("".truncated(.middle, to: 1) == "")
      #expect("Hello".truncated(.middle, to: 0) == "…")
      #expect("Hello".truncated(.middle, to: -1) == "…")
      #expect("Hello".truncated(.middle, to: 10) == "Hello")
   }


   @Test(arguments: [2, 1, 0, -1, Int.min])
   func `truncated to length with suffix at middle`(_ length: Int) {
      #expect("Hello".truncated(.middle, to: length, with: "..") == "..")
      #expect("Hello".truncated(.middle, to: 3, with: "..") == "H..")
      #expect("Hello".truncated(.middle, to: 3, with: "...") == "...")
      #expect("Hello".truncated(.middle, to: 3, with: "") == "Heo")
      #expect("Hello".truncated(.middle, to: 0, with: "") == "")
      #expect("Hello".truncated(.middle, to: 4, with: "..") == "H..o")
      #expect("Hello".truncated(.middle, to: 5, with: "..") == "Hello")
      #expect("Hello".truncated(.middle, to: 10, with: "..") == "Hello")
      #expect("Hello".truncated(.middle, to: .max, with: "..") == "Hello")
   }
}
