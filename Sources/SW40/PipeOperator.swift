// SPDX-FileCopyrightText: © 2024 Andrii Sem
// SPDX-License-Identifier: MIT

precedencegroup ForwardPipe {
   associativity: left
   higherThan: BitwiseShiftPrecedence
}


infix operator |> : ForwardPipe


@inlinable
public func |> <A: ~Copyable, B, E: Error>(
   value: consuming A,
   transform: (consuming A) throws(E) -> B,
) throws(E) -> B {
   try transform(value)
}


@inlinable
public func |> <A: ~Copyable, B, E: Error>(
   value: consuming A,
   transform: (consuming A) async throws(E) -> B,
) async throws(E) -> B {
   try await transform(value)
}
