// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

/// Prints a string representation of a value and returns the value unchanged.
///
/// - Parameters:
///   - value: The value to print and pass through unchanged.
///   - message: An optional message.
///   - file: The file path.
///   - line: The line number.
///   - format: A closure that converts the value into a string representation for printing.
///
/// - Returns: The original `value`, unchanged.
///
/// ```swift
/// echo(4) == 4
/// // Prints:
/// // SW40Tests/EchoTests.swift:9
/// // 4
/// ```
public func echo<T>(
   _ value: T,
   _ message: String = "",
   file: String = #file,
   line: Int = #line,
   format: (T) -> String = { String(describing: $0) }
) -> T {
   print(
      """
      \(file):\(line) \(message)
      \(format(value))

      """
   )

   return value
}



public protocol Echoed {}
extension Echoed {
   /// Prints a string representation of a type conforming to ``Echoed`` protocol and returns the value unchanged.
   ///
   /// - Parameters:
   ///   - message: An optional message.
   ///   - file: The file path.
   ///   - line: The line number.
   ///   - format: A closure that converts the value into a string representation for printing.
   ///
   /// - Returns: The original `value`, unchanged.
   ///
   /// ```swift
   /// struct A: Equatable, Echoed { let name: String }
   /// A(name: "a").echo()
   /// // Prints:
   /// // SW40Tests/EchoTests.swift:33
   /// // A(name: "a")
   /// ```
   public func echo(
      _ message: String = "",
      file: String = #file,
      line: Int = #line,
      format: (Self) -> String = { String(describing: $0) },
   ) -> Self {
      SW40.echo(self, message, file: file, line: line, format: format)
   }
}



extension Result: Echoed {}
extension Optional: Echoed {}



extension Sequence {
   /// Prints a string representation of a sequence and returns the value unchanged.
   ///
   /// - Parameters:
   ///   - message: An optional message.
   ///   - file: The file path.
   ///   - line: The line number.
   ///   - format: A closure that converts the value into a string representation for printing.
   ///
   /// - Returns: The original `value`, unchanged.
   ///
   /// ```swift
   /// let c: [String] =
   ///    [5, 2, 3]
   ///    .sorted()
   ///    .echo()
   ///    .map(String.init)
   ///    .echo()
   /// // Prints:
   /// // SW40Tests/EchoTests.swift:26
   /// // [2, 3, 5]
   /// //
   /// // SW40Tests/EchoTests.swift:28
   /// // ["2", "3", "5"]
   /// ```
   public func echo(
      _ message: String = "",
      file: String = #file,
      line: Int = #line,
      format: (Self) -> String = { String(describing: $0) },
   ) -> Self {
      SW40.echo(self, message, file: file, line: line, format: format)
   }
}



extension AsyncSequence {
   /// Prints a string representation of an async sequence and returns the value unchanged.
   ///
   /// - Parameters:
   ///   - message: An optional message.
   ///   - file: The file path.
   ///   - line: The line number.
   ///   - format: A closure that converts the value into a string representation for printing.
   ///
   /// - Returns: The original `value`, unchanged.
   ///
   /// ```swift
   /// let c: [String] =
   ///    [5, 2, 3]
   ///    .async
   ///    .sorted()
   ///    .echo()
   ///    .map(String.init)
   ///    .echo()
   /// // Prints:
   /// // SW40Tests/EchoTests.swift:26
   /// // [2, 3, 5]
   /// //
   /// // SW40Tests/EchoTests.swift:28
   /// // ["2", "3", "5"]
   /// ```
   public func echo(
      _ message: String = "",
      file: String = #file,
      line: Int = #line,
      format: (Self) -> String = { String(describing: $0) },
   ) -> Self {
      SW40.echo(self, message, file: file, line: line, format: format)
   }
}
