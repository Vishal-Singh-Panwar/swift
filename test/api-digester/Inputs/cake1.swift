import APINotesTest

public struct S1 {
  public init(_ : Int) {}
  public func foo1() {}
  mutating public func foo2() {}
  public func foo3() {}
  public func foo4() -> Void {}
  public func foo5(x : Int, y: Int) {}
}

public class C1 {
  public class func foo1() {}
  public func foo2(_ : Int) {}
  public weak var CIIns1 : C1?
  public var CIIns2 : C1?
  public func foo3(a : Void?) {}
  public func foo4(a : Void?) {}
}

public class C3 {}

public struct Somestruct2 {
  public init(_ : C1) {}
  public static func foo1(_ a : C3) {}
}

public class C4: OldType {
  public func foo() {}
}

@objc
public class C5 {
  @objc
  public func dy_foo() {}
}

public struct C6 {}

@_frozen
public enum IceKind {}

public protocol P1 {}

public protocol P2 {}

public extension P1 where Self: P2 {
  func P1Constraint() {}
}

@_fixed_layout
public struct fixedLayoutStruct {
  public var b = 2
  public func foo() {}
  public var a = 1
}

@usableFromInline
@_fixed_layout
struct fixedLayoutStruct2 {
  public private(set) var NoLongerWithFixedBinaryOrder = 1
  public var BecomeFixedBinaryOrder: Int { return 1 }
}

@_frozen
public enum FrozenKind {
  case Unchanged
  case Fixed
  case Rigid
}

public class C7 {
  public func foo(_ a: Int = 1, _ b: Int = 2) {}
}

public protocol P3: P2, P1 {}

extension fixedLayoutStruct: P1 {}

public protocol AssociatedTypePro {
  associatedtype T1 = Int
  associatedtype T2
  associatedtype T3 = C1
}

public class RemoveSetters {
  public var Value = 4
  public subscript(_ idx: Int) -> Int {
    get { return 1 }
    set(newValue) {}
  }
}

public protocol RequiementChanges {
  func removedFunc()
  associatedtype removedType
  var removedVar: Int {get}
}

/// This protocol shouldn't be complained because its requirements are all derived.
public protocol DerivedProtocolRequiementChanges: RequiementChanges {}

public class SuperClassRemoval: C3 {}

public class ClassToStruct {}
public protocol ProtocolToEnum {}

public class SuperClassChange: C7 {}

public class GenericClass<T> {}

public class SubGenericClass: GenericClass<P1> {}

@objc
public protocol ObjCProtocol {
  @objc
  optional func removeOptional()
  @objc
  func addOptional()
}

public let GlobalLetChangedToVar = 1
public var GlobalVarChangedToLet = 1

public class ClassWithOpenMember {
  open class func foo() {}
  open var property: Int {get { return 1}}
  open func bar() {}
}

public class EscapingFunctionType {
  public func removedEscaping(_ a: @escaping ()->()) {}
  public func addedEscaping(_ a: ()->()) {}
}

infix operator ..*..

public func ownershipChange(_ a: inout Int, _ b: __shared Int) {}

@usableFromInline
@_fixed_layout
class _NoResilientClass {
  @usableFromInline
  final func NoLongerFinalFunc() {}
  private func FuncPositionChange0() {}
  private func FuncPositionChange1() {}
}

public class FinalFuncContainer {
  public func NewFinalFunc() {}
  public final func NoLongerFinalFunc() {}
}

public protocol AssociatedTypesProtocol {
  associatedtype T
}

public class TChangesFromIntToString: AssociatedTypesProtocol {
  public typealias T = Int
}

public protocol HasMutatingMethod {
  mutating func foo()
  var bar: Int { mutating get }
}

public protocol HasMutatingMethodClone: HasMutatingMethod {
  mutating func foo()
  var bar: Int { mutating get }
}
