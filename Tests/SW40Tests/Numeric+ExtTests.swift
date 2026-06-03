// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

import Testing

@testable import SW40

@Suite
struct NumericTests {
   let intValue: Int = 22
   let doubleValue: Double = 22.0
   let floatValue: Float = 22.0

   let intValueNeg: Int = -22
   let doubleValueNeg: Double = -22.0
   let floatValueNeg: Float = -22.0

   @Test
   func clamped() {
      #expect(intValue.clamped(to: 0 ... 10) == 10)
      #expect(doubleValue.clamped(to: 0 ... 10) == 10)
      #expect(floatValue.clamped(to: 0 ... 10) == 10)

      #expect(floatValue.clamped(to: 0.5 ... 10.5) == 10.5)
      #expect(doubleValue.clamped(to: 0.5 ... 10.5) == 10.5)

      #expect(intValueNeg.clamped(to: 1 ... 10) == 1)
      #expect(doubleValueNeg.clamped(to: 1 ... 10) == 1)
      #expect(floatValueNeg.clamped(to: 1 ... 10) == 1)

      #expect(floatValueNeg.clamped(to: 0.5 ... 10.5) == 0.5)
      #expect(doubleValueNeg.clamped(to: 0.5 ... 10.5) == 0.5)
   }
}
