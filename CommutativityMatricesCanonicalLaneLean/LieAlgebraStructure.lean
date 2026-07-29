import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure LieAlgebraStructurePackage where
  matrices : Type u
  lieBracket : matrices → matrices → matrices
  bilinear : Prop
  antisymmetric : Prop
  jacobiIdentity : Prop
  bilinearClosed : bilinear
  antisymmetricClosed : antisymmetric
  jacobiIdentityClosed : jacobiIdentity

structure LieAlgebraStructureEvidence (L : LieAlgebraStructurePackage) where
  bilinearClosedClosed : L.bilinearClosed
  antisymmetricClosedClosed : L.antisymmetricClosed
  jacobiIdentityClosedClosed : L.jacobiIdentityClosed

def LieAlgebraStructureClosed (L : LieAlgebraStructurePackage) : Prop :=
  L.bilinear ∧ L.antisymmetric ∧ L.jacobiIdentity

theorem lie_algebra_structure_closed_from_evidence (L : LieAlgebraStructurePackage) (E : LieAlgebraStructureEvidence L) :
    LieAlgebraStructureClosed L := by
  exact And.intro E.bilinearClosedClosed (And.intro E.antisymmetricClosedClosed E.jacobiIdentityClosedClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse