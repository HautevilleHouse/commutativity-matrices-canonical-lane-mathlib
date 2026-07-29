import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure MatrixMultiplicationPackage where
  baseRing : Type u
  n : Nat
  matrix : Type v
  productDefined : Prop
  associativity : Prop
  identityExists : Prop
  productClosed : Prop

structure MatrixMultiplicationEvidence (M : MatrixMultiplicationPackage) where
  productDefinedClosed : M.productDefined
  associativityClosed : M.associativity
  identityExistsClosed : M.identityExists
  productClosedClosed : M.productClosed

def MatrixMultiplicationClosed (M : MatrixMultiplicationPackage) : Prop :=
  M.productDefined ∧ M.associativity ∧ M.identityExists ∧ M.productClosed

theorem matrix_multiplication_closed_from_evidence (M : MatrixMultiplicationPackage)
    (E : MatrixMultiplicationEvidence M) : MatrixMultiplicationClosed M := by
  exact And.intro E.productDefinedClosed
    (And.intro E.associativityClosed
      (And.intro E.identityExistsClosed E.productClosedClosed))

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse