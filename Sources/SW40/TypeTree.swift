// SPDX-FileCopyrightText: © 2025 Andrii Sem
// SPDX-License-Identifier: MIT

/// Produces a human-readable tree of the type structure for a value.
///
/// This function reflects on `value` using `Mirror` and returns a multi-line string that visualizes the value's type hierarchy and its stored properties.
public func typeTree(of value: Any) -> String {
   var result: [String] = []
   _typeTree(value, result: &result)
   return result.joined(separator: "\n")
}


private func _typeTree(
   _ value: Any,
   name: String = "",
   indent: String = "",
   result: inout [String]
) {
   func suffix(_ value: Any, isLeaf: Bool) -> String {
      let value = String(describing: value)
      return isLeaf ? (" = " + value) : ""
   }

   var paddedIndent: String { indent + String(repeating: " ", count: 3) }
   let mirror = Mirror(reflecting: value)
   let rootLine =
      indent
      + name
      + String(describing: mirror.subjectType)
      + suffix(value, isLeaf: mirror.children.isEmpty)

   if result.isEmpty { result.append(rootLine) }

   mirror.children.forEach { child in
      let childName = child.label.map { $0 + ": " } ?? ""
      let childMirror = Mirror(reflecting: child.value)
      let childLine =
         paddedIndent
         + "╰ "
         + childName
         + String(describing: childMirror.subjectType)
         + suffix(child.value, isLeaf: childMirror.children.isEmpty)

      result.append(childLine)

      if !childMirror.children.isEmpty {
         _typeTree(
            child.value,
            name: childName,
            indent: paddedIndent,
            result: &result
         )
      }
   }
}
