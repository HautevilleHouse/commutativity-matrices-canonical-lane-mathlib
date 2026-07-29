import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure MatrixBasisPackage where
  basisSet : Type u
  indexSet : Type v
  basisElements : indexSet → basisSet
  linearSpan : Set basisSet → Set basisSet
  dimension : Nat
  basisCardinal : Prop
  spanningProperty : Prop
  linearIndependence : Prop

structure MatrixBasisEvidence (B : MatrixBasisPackage) where
  basisCardinalClosed : B.basisCardinal
  spanningPropertyClosed : B.spanningProperty
  linearIndependenceClosed : B.linearIndependence

def MatrixBasisClosed (B : MatrixBasisPackage) : Prop :=
  B.basisCardinal ∧ B.spanningProperty ∧ B.linearIndependence

theorem matrix_basis_closed_from_evidence (B : MatrixBasisPackage)
    (E : MatrixBasisEvidence B) : MatrixBasisClosed B := by
  exact And.intro E.basisCardinalClosed
    (And.intro E.spanningPropertyClosed E.linearIndependenceClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse