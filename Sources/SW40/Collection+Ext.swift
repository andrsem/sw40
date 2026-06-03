// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

extension Collection {
   /// Returns the default collection when the collection is empty.
   public func ifEmpty(_ defaultCollection: @autoclosure () -> Self) -> Self {
      isEmpty ? defaultCollection() : self
   }
}
