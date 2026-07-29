import CommutativityMatricesCanonicalLaneLean.TheoremStatement
import CanonicalLaneMathlibCore
import Mathlib.Data.Matrix.Basic

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure MatrixSpace where
  carrier : Type
  ringStructure : Ring carrier

structure MatrixAdmittedObject where
  space : MatrixSpace
  dimension : Nat
  matricesCommute : Prop
  conclusion : matricesCommute

structure MatrixEndgameState where
  object : MatrixAdmittedObject

def MatrixWitnessClosed (O : MatrixAdmittedObject) : Prop :=
  O.matricesCommute

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse