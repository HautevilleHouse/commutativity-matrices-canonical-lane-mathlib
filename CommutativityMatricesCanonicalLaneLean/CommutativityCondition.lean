import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutativityConditionPackage (M : MatrixMultiplicationPackage) where
  commutesForAll : Prop
  counterexampleExists : Prop
  commutativityHolds : Prop

structure CommutativityConditionEvidence {M : MatrixMultiplicationPackage}
    (C : CommutativityConditionPackage M) where
  commutativityHoldsClosed : C.commutativityHolds

def CommutativityConditionClosed {M : MatrixMultiplicationPackage}
    (C : CommutativityConditionPackage M) : Prop :=
  C.commutativityHolds

theorem commutativity_condition_closed_from_evidence {M : MatrixMultiplicationPackage}
    (C : CommutativityConditionPackage M) (E : CommutativityConditionEvidence C) :
    CommutativityConditionClosed C := by
  exact E.commutativityHoldsClosed

theorem commutativity_implies_product_closed {M : MatrixMultiplicationPackage}
    (C : CommutativityConditionPackage M) (_ : CommutativityConditionClosed C) :
    MatrixMultiplicationClosed M := by
  sorry

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse