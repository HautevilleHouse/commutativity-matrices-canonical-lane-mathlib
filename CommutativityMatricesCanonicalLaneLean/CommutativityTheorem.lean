import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutativityCondition where
  matrixSet : Type
  multiplication : matrixSet → matrixSet → matrixSet
  commutativityStatement : Prop

def matrixClosed (O : AdmittedObject) : Prop :=
  O.property

structure AdmittedObject where
  space : CommutativityCondition
  property : Prop
  conclusion : property

structure CommutativityPackage (C : CommutativityCondition) where
  commutativityHolds : Prop
  proofCertificate : commutativityHolds

structure CommutativityEvidence {C : CommutativityCondition}
    (P : CommutativityPackage C) where
  commutativityHoldsClosed : P.commutativityHolds

def CommutativityClosed {C : CommutativityCondition}
    (P : CommutativityPackage C) : Prop :=
  P.commutativityHolds

theorem commutativity_closed_from_evidence {C : CommutativityCondition}
    (P : CommutativityPackage C) (E : CommutativityEvidence P) :
    CommutativityClosed P := by
  exact E.commutativityHoldsClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse