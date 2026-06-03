// SPDX-FileCopyrightText: © 2023 Andrii Sem
// SPDX-License-Identifier: MIT

extension Numeric where Self: Comparable {
   /// Clamps a numeric value within a specified range. If the value exceeds the upper or lower bounds, it is adjusted to the nearest bound.
   public func clamped(to range: ClosedRange<Self>) -> Self {
      min(
         range.upperBound,
         max(self, range.lowerBound)
      )
   }
}
