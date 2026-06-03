// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

extension Result {
   public func toOptional() -> Success? {
      switch self {
      case let .success(v): v
      case .failure: nil
      }
   }
}
