import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.CommutativityMatricesCanonicalLaneLean.MatrixAlgebra

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure DiagonalizationPackage (A : MatrixAlgebra) where
  basis : Type
  basisVectors : basis → A.carrier
  diagonalMatrices : Prop
  simultaneousDiagonalization : Prop

def DiagonalizationClosed (A : MatrixAlgebra) (D : DiagonalizationPackage A) : Prop :=
  D.diagonalMatrices ∧ D.simultaneousDiagonalization

theorem diagonalization_closed (A : MatrixAlgebra) (D : DiagonalizationPackage A)
    (h1 : D.diagonalMatrices) (h2 : D.simultaneousDiagonalization) :
    DiagonalizationClosed A D := by
  exact And.intro h1 h2

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse