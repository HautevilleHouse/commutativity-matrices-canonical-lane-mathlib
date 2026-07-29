import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure MatrixRingPackage where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  ringAxioms : Prop
  matrixMultiplicationAssociative : Prop

structure MatrixRingEvidence (R : MatrixRingPackage) where
  ringAxiomsClosed : R.ringAxioms
  matrixMultiplicationAssociativeClosed : R.matrixMultiplicationAssociative

def MatrixRingClosed (R : MatrixRingPackage) : Prop :=
  R.ringAxioms ∧ R.matrixMultiplicationAssociative

theorem matrix_ring_closed_from_evidence (R : MatrixRingPackage)
    (E : MatrixRingEvidence R) : MatrixRingClosed R := by
  exact And.intro E.ringAxiomsClosed E.matrixMultiplicationAssociativeClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse