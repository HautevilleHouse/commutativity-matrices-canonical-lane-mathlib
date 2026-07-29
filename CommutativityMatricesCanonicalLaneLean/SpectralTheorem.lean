import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure SpectralTheoremPackage where
  matrix : Type
  diagonalization : Prop
  spectralDecomposition : Prop
  commutesWithDiagonalization : Prop

structure SpectralTheoremEvidence (S : SpectralTheoremPackage) where
  diagonalizationClosed : S.diagonalization
  spectralDecompositionClosed : S.spectralDecomposition
  commutesWithDiagonalizationClosed : S.commutesWithDiagonalization

def SpectralTheoremClosed (S : SpectralTheoremPackage) : Prop :=
  S.diagonalization ∧ S.spectralDecomposition ∧ S.commutesWithDiagonalization

theorem spectral_theorem_closed_from_evidence (S : SpectralTheoremPackage)
    (E : SpectralTheoremEvidence S) : SpectralTheoremClosed S := by
  exact And.intro E.diagonalizationClosed
    (And.intro E.spectralDecompositionClosed E.commutesWithDiagonalizationClosed)

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse