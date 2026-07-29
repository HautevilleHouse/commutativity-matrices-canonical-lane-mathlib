import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure JordanNormalFormPackage where
  matrix : Type
  jordanDecomposition : Type
  jordanExistence : Prop
  jordanUniqueness : Prop

structure JordanNormalFormEvidence (J : JordanNormalFormPackage) where
  jordanExistenceClosed : J.jordanExistence
  jordanUniquenessClosed : J.jordanUniqueness

def JordanNormalFormClosed (J : JordanNormalFormPackage) : Prop :=
  J.jordanExistence ∧ J.jordanUniqueness

theorem jordan_normal_form_closed_from_evidence (J : JordanNormalFormPackage)
    (E : JordanNormalFormEvidence J) : JordanNormalFormClosed J := by
  exact And.intro E.jordanExistenceClosed E.jordanUniquenessClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse