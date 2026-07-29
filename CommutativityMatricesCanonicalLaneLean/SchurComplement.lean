import CommutativityMatricesCanonicalLaneLean.MatrixAdmittedObject

/-!
# Schur Complement Package
-/

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure SchurComplementPackage (A B C D : MatrixAdmittedObject) where
  blockMatrix : Prop
  schurComplementDefined : Prop
  invertibilityCondition : Prop
  commutationBlockCondition : Prop

structure SchurComplementEvidence (A B C D : MatrixAdmittedObject) (S : SchurComplementPackage A B C D) where
  blockMatrixClosed : S.blockMatrix
  schurComplementDefinedClosed : S.schurComplementDefined
  invertibilityConditionClosed : S.invertibilityCondition
  commutationBlockConditionClosed : S.commutationBlockCondition

def SchurComplementClosed (A B C D : MatrixAdmittedObject) (S : SchurComplementPackage A B C D) : Prop :=
  S.blockMatrix ∧ S.schurComplementDefined ∧ S.invertibilityCondition ∧ S.commutationBlockCondition

theorem schur_complement_closed_from_evidence (A B C D : MatrixAdmittedObject) (S : SchurComplementPackage A B C D) (E : SchurComplementEvidence A B C D S) :
    SchurComplementClosed A B C D S := by
  exact And.intro E.blockMatrixClosed (And.intro E.schurComplementDefinedClosed (And.intro E.invertibilityConditionClosed E.commutationBlockConditionClosed))

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse