import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure AdmittedMatrix where
  n : Nat
  ring : Type u
  ringOps : Ring ring
  matrices : Vector (Matrix (Fin n) (Fin n) ring) 2

structure EndpointSatisfied where
  matricesCommute : Prop

structure RemainderRecorded where
  remainderDetails : Prop

structure GateWitness where
  fromEndpoint : EndpointSatisfied → EndpointSatisfied ∨ RemainderRecorded
  fromRemainder : RemainderRecorded → EndpointSatisfied ∨ RemainderRecorded

structure AdmissibleClass where
  object : AdmittedMatrix
  endpointSatisfied : EndpointSatisfied
  remainderRecorded : RemainderRecorded
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  (A.endpointSatisfied.matricesCommute) ∨ A.remainderRecorded.remainderDetails

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse