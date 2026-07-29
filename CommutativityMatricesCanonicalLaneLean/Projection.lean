import CommutativityMatricesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def matrixProjection : Projection MatrixEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem matrix_projection_idempotent (x : MatrixEndgameState) :
    matrixProjection.toFun (matrixProjection.toFun x) = matrixProjection.toFun x := by
  exact matrixProjection.idempotent x

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse