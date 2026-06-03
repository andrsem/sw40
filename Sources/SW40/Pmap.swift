// SPDX-FileCopyrightText: © 2026 Andrii Sem
// SPDX-License-Identifier: MIT

extension Collection where Element: Sendable {
   /// Same as regular `map` but executes `transform` closure in parallel.
   ///
   /// - Parameters:
   ///   - maxTasks: Maximum amount of parallel tasks. Unlimited when `nil`.
   ///   - transform: A mapping closure. `transform` accepts an element of this sequence as its parameter and returns a transformed value of the same or of a different type.
   /// - Returns: An array containing the transformed elements of this sequence.
   ///
   public func pmap<T: Sendable>(
      maxTasks: Int? = nil,
      _ transform: @Sendable @escaping (Element) async throws -> T
   ) async rethrows -> [T] {
      guard !isEmpty else { return [] }

      return try await withThrowingTaskGroup(of: (Int, T).self) { group in
         var addedTasks = 0
         var isOverLimit: Bool {
            guard let maxTasks else { return false }
            return addedTasks >= Swift.max(1, maxTasks)
         }
         var results = ContiguousArray<T?>(repeating: nil, count: count)

         for (index, element) in self.enumerated() {
            if isOverLimit, let (i, result) = try await group.next() {
               results[i] = result
            }
            addedTasks += 1
            group.addTask { (index, try await transform(element)) }
         }

         while let (i, result) = try await group.next() {
            results[i] = result
         }

         return results.compactMap(\.self)
      }
   }
}
