// RUN: %target-typecheck-verify-swift -solver-expression-time-threshold=1 -solver-enable-operator-designated-types

func test(_ d: Double) -> Double {
  return d + d - d - (d / 2) + (d / 2) + (d / 2.0)
}
