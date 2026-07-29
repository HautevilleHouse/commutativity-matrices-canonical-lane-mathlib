import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CanonicalCommutativeBasisPackage {F : CommutatorSpace}
    {B : MatrixBasisPackage} {S : SimultaneousDiagonalizationPackage F B} where
  eigenbasis : Type u
  basisTransformation : F.linearMap → F.linearMap
  simultaneousBasisProperty : Prop
  canonicalForm : Prop

structure CanonicalCommutativeBasisEvidence {F : CommutatorSpace}
    {B : MatrixBasisPackage} {S : SimultaneousDiagonalizationPackage F B}
    (C : CanonicalCommutativeBasisPackage F B S) where
  simultaneousBasisPropertyClosed : C.simultaneousBasisProperty
  canonicalFormClosed : C.canonicalForm

def CanonicalCommutativeBasisClosed {F : CommutatorSpace} {B : MatrixBasisPackage}
    {S : SimultaneousDiagonalizationPackage F B}
    (C : CanonicalCommutativeBasisPackage F B S) : Prop :=
  C.simultaneousBasisProperty ∧ C.canonicalForm

theorem canonical_commutative_basis_closed_from_evidence
    {F : CommutatorSpace} {B : MatrixBasisPackage}
    {S : SimultaneousDiagonalizationPackage F B}
    (C : CanonicalCommutativeBasisPackage F B S)
    (E : CanonicalCommutativeBasisEvidence C) : CanonicalCommutativeBasisClosed C := by
  exact And.intro E.simultaneousBasisPropertyClosed E.canonicalFormClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse