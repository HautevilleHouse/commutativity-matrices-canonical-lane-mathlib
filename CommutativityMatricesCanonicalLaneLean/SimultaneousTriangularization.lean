import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure SimultaneousTriangularizationPackage {F : CommutatorSpace}
    {B : MatrixBasisPackage} where
  commutingFamily : Type u
  familyMembers : commutingFamily → F.linearMap
  pairwiseCommute : Prop
  triangularizable : Prop
  upperTriangularForm : Prop

structure SimultaneousTriangularizationEvidence {F : CommutatorSpace}
    {B : MatrixBasisPackage} (T : SimultaneousTriangularizationPackage F B) where
  pairwiseCommuteClosed : T.pairwiseCommute
  triangularizableClosed : T.triangularizable
  upperTriangularFormClosed : T.upperTriangularForm

def SimultaneousTriangularizationClosed {F : CommutatorSpace} {B : MatrixBasisPackage}
    (T : SimultaneousTriangularizationPackage F B) : Prop :=
  T.pairwiseCommute ∧ T.triangularizable ∧ T.upperTriangularForm

theorem simultaneous_triangularization_closed_from_evidence
    {F : CommutatorSpace} {B : MatrixBasisPackage}
    (T : SimultaneousTriangularizationPackage F B)
    (E : SimultaneousTriangularizationEvidence T) : SimultaneousTriangularizationClosed T := by
  exact And.intro E.pairwiseCommuteClosed
    (And.intro E.triangularizableClosed E.upperTriangularFormClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse