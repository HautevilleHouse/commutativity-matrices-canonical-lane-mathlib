import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure SimultaneousDiagonalizationPackage {F : CommutatorSpace}
    {B : MatrixBasisPackage} where
  commutingFamily : Type u
  familyMembers : commutingFamily → F.linearMap
  pairwiseCommute : Prop
  commonEigenvectors : Prop
  diagonalizationExists : Prop

structure SimultaneousDiagonalizationEvidence {F : CommutatorSpace}
    {B : MatrixBasisPackage} (S : SimultaneousDiagonalizationPackage F B) where
  pairwiseCommuteClosed : S.pairwiseCommute
  commonEigenvectorsClosed : S.commonEigenvectors
  diagonalizationExistsClosed : S.diagonalizationExists

def SimultaneousDiagonalizationClosed {F : CommutatorSpace} {B : MatrixBasisPackage}
    (S : SimultaneousDiagonalizationPackage F B) : Prop :=
  S.pairwiseCommute ∧ S.commonEigenvectors ∧ S.diagonalizationExists

theorem simultaneous_diagonalization_closed_from_evidence
    {F : CommutatorSpace} {B : MatrixBasisPackage}
    (S : SimultaneousDiagonalizationPackage F B)
    (E : SimultaneousDiagonalizationEvidence S) : SimultaneousDiagonalizationClosed S := by
  exact And.intro E.pairwiseCommuteClosed
    (And.intro E.commonEigenvectorsClosed E.diagonalizationExistsClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse