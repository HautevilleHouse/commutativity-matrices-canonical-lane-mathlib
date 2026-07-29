import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure EndpointClassificationPackage {F : CommutatorSpace}
    {B : MatrixBasisPackage} {S : SimultaneousDiagonalizationPackage F B}
    {C : CanonicalCommutativeBasisPackage F B S}
    {T : SimultaneousTriangularizationPackage F B} where
  targetAlgebra : Type u
  targetStructure : Prop
  commutingFamilyFullyReduced : Prop
  canonicalFormAchieved : Prop
  endpointMatchesCommutativityTheorem : Prop

structure EndpointClassificationEvidence {F : CommutatorSpace}
    {B : MatrixBasisPackage} {S : SimultaneousDiagonalizationPackage F B}
    {C : CanonicalCommutativeBasisPackage F B S}
    {T : SimultaneousTriangularizationPackage F B}
    (Epkg : EndpointClassificationPackage F B S C T) where
  commutingFamilyFullyReducedClosed : Epkg.commutingFamilyFullyReduced
  canonicalFormAchievedClosed : Epkg.canonicalFormAchieved
  endpointMatchesCommutativityTheoremClosed : Epkg.endpointMatchesCommutativityTheorem

def EndpointClassificationClosed {F : CommutatorSpace} {B : MatrixBasisPackage}
    {S : SimultaneousDiagonalizationPackage F B} {C : CanonicalCommutativeBasisPackage F B S}
    {T : SimultaneousTriangularizationPackage F B}
    (Epkg : EndpointClassificationPackage F B S C T) : Prop :=
  Epkg.commutingFamilyFullyReduced ∧ Epkg.canonicalFormAchieved ∧
  Epkg.endpointMatchesCommutativityTheorem

theorem endpoint_classification_closed_from_evidence
    {F : CommutatorSpace} {B : MatrixBasisPackage}
    {S : SimultaneousDiagonalizationPackage F B} {C : CanonicalCommutativeBasisPackage F B S}
    {T : SimultaneousTriangularizationPackage F B}
    (Epkg : EndpointClassificationPackage F B S C T)
    (E : EndpointClassificationEvidence Epkg) : EndpointClassificationClosed Epkg := by
  exact And.intro E.commutingFamilyFullyReducedClosed
    (And.intro E.canonicalFormAchievedClosed E.endpointMatchesCommutativityTheoremClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse