// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

extension Optional {
   /// Convert the optional value to a Result with specified error as failure.
   public func toResult<E>(or error: E) -> Result<Wrapped, E> {
      switch self {
      case let v?: .success(v)
      case nil: .failure(error)
      }
   }
}
