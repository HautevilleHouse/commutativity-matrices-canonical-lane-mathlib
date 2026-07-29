import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutativeRing where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  ringAxioms : Prop
  multiplicationCommutative : ∀ a b : carrier, multiplication a b = multiplication b a

structure CommutativeRingEvidence (R : CommutativeRing) where
  ringAxiomsClosed : R.ringAxioms
  multiplicationCommutativeClosed : R.multiplicationCommutative

def CommutativeRingClosed (R : CommutativeRing) : Prop :=
  R.ringAxioms ∧ R.multiplicationCommutative

theorem commutative_ring_closed_from_evidence (R : CommutativeRing) (E : CommutativeRingEvidence R) :
    CommutativeRingClosed R := by
  exact And.intro E.ringAxiomsClosed E.multiplicationCommutativeClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse