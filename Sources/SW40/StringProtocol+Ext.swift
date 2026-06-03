// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

extension StringProtocol {
   @inlinable
   public func expanded(
      to length: Int,
      with character: Character = " ",
   ) -> String {
      let count = self.count
      guard count < length else { return String(self) }
      return self + String(repeating: character, count: length - count)
   }


   @inlinable
   public func truncated(
      _ mode: TruncationMode = .tail,
      to length: Int,
      with truncator: String = "…",
   ) -> String {
      guard count > length else { return String(self) }

      let length = Swift.max(0, Swift.max(0, length) - truncator.count)

      return switch mode {
      case .head: truncator + suffix(length)
      case .middle:
         {
            let suffixLen = length / 2
            let prefixLen = length - suffixLen
            return prefix(prefixLen) + truncator + suffix(suffixLen)
         }()
      case .tail: prefix(length) + truncator
      }
   }


   @inlinable
   public func trimmingSuffix(_ suffix: Self) -> SubSequence {
      guard !suffix.isEmpty, hasSuffix(suffix) else { return self[...] }
      return dropLast(suffix.count)
   }
}


public enum TruncationMode: String, CaseIterable, Sendable, Codable, Hashable {
   case head, middle, tail
}
