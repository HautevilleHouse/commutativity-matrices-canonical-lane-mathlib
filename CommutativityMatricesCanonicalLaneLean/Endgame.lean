import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

def ConstrainedCommutativityClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_commutativity_endgame (A : AdmissibleClass) :
    ConstrainedCommutativityClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse