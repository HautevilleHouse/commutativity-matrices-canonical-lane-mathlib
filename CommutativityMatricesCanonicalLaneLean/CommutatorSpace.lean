import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutatorSpace where
  baseField : Type u
  vectorSpace : Type v
  addition : vectorSpace → vectorSpace → vectorSpace
  scalarMultiplication : baseField → vectorSpace → vectorSpace
  linearMap : Type w
  bilinearForm : vectorSpace → vectorSpace → vectorSpace
  commutatorMap : vectorSpace → vectorSpace → vectorSpace
  dimFinite : Prop
  fieldClosed : Prop
  linearMapStructure : Prop
  bilinearFormClosed : Prop
  commutatorMapClosed : Prop

structure CommutatorSpaceEvidence (C : CommutatorSpace) where
  dimFiniteClosed : C.dimFinite
  fieldClosedClosed : C.fieldClosed
  linearMapStructureClosed : C.linearMapStructure
  bilinearFormClosedClosed : C.bilinearFormClosed
  commutatorMapClosedClosed : C.commutatorMapClosed

def CommutatorSpaceClosed (C : CommutatorSpace) : Prop :=
  C.dimFinite ∧ C.fieldClosed ∧ C.linearMapStructure ∧ C.bilinearFormClosed ∧ C.commutatorMapClosed

theorem commutator_space_closed_from_evidence (C : CommutatorSpace)
    (E : CommutatorSpaceEvidence C) : CommutatorSpaceClosed C := by
  exact And.intro E.dimFiniteClosed
    (And.intro E.fieldClosedClosed
      (And.intro E.linearMapStructureClosed
        (And.intro E.bilinearFormClosedClosed E.commutatorMapClosedClosed)))

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse