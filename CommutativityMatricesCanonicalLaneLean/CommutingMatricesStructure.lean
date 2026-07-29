import CommutativityMatricesCanonicalLaneLean.SimultaneousDiagonalization

/-!
# Commuting Matrices Structure Package
-/

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure CommutingMatricesStructurePackage (A B : MatrixAdmittedObject) where
  commutationRelation : Prop
  jointSpectrum : Prop
  functionalCalculus : Prop
  spectralMapping : Prop
  functionalCalculusConsistency : Prop

structure CommutingMatricesStructureEvidence (A B : MatrixAdmittedObject) (C : CommutingMatricesStructurePackage A B) where
  commutationRelationClosed : C.commutationRelation
  jointSpectrumClosed : C.jointSpectrum
  functionalCalculusClosed : C.functionalCalculus
  spectralMappingClosed : C.spectralMapping
  functionalCalculusConsistencyClosed : C.functionalCalculusConsistency

def CommutingMatricesStructureClosed (A B : MatrixAdmittedObject) (C : CommutingMatricesStructurePackage A B) : Prop :=
  C.commutationRelation ∧ C.jointSpectrum ∧ C.functionalCalculus ∧ C.spectralMapping ∧ C.functionalCalculusConsistency

theorem commuting_matrices_structure_closed_from_evidence (A B : MatrixAdmittedObject) (C : CommutingMatricesStructurePackage A B) (E : CommutingMatricesStructureEvidence A B C) :
    CommutingMatricesStructureClosed A B C := by
  exact And.intro E.communationRelationClosed (And.intro E.jointSpectrumClosed (And.intro E.functionalCalculusClosed (And.intro E.spectralMappingClosed E.functionalCalculusConsistencyClosed)))

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse