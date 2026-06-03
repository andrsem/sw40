// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

public protocol SafeCollectionSubscript: RandomAccessCollection {
   /// Safe access to array elements at index.
   subscript(safe index: Index) -> Element? { get }
}

extension SafeCollectionSubscript {
   public subscript(safe index: Index) -> Element? {
      guard (startIndex ..< endIndex) ~= index else { return nil }
      return self[index]
   }
}

extension Array: SafeCollectionSubscript {}
extension ArraySlice: SafeCollectionSubscript {}
extension ContiguousArray: SafeCollectionSubscript {}
