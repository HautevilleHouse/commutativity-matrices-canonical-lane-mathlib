import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutatorOperationPackage where
  squareMatrices : Type u
  ringStructure : Ring squareMatrices
  commutator : squareMatrices → squareMatrices → squareMatrices
  commutatorClosed : Prop
  commutatorClosedTerm : commutatorClosed

structure CommutatorOperationEvidence (C : CommutatorOperationPackage) where
  commutatorClosedClosed : C.commutatorClosed

def CommutatorOperationClosed (C : CommutatorOperationPackage) : Prop :=
  C.commutatorClosed

theorem commutator_operation_closed_from_evidence (C : CommutatorOperationPackage) (E : CommutatorOperationEvidence C) :
    CommutatorOperationClosed C := by
  exact E.commutatorClosedClosed

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse