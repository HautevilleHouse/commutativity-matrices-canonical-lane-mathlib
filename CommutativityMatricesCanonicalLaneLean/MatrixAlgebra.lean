import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CommutativityMatricesCanonicalLaneLean

structure MatrixAlgebra where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  additionAssociative : ∀ a b c : carrier, addition (addition a b) c = addition a (addition b c)
  additionCommutative : ∀ a b : carrier, addition a b = addition b a
  zeroAdd : ∀ a : carrier, addition zero a = a
  addZero : ∀ a : carrier, addition a zero = a
  multiplicationAssociative : ∀ a b c : carrier, multiplication (multiplication a b) c = multiplication a (multiplication b c)
  oneMul : ∀ a : carrier, multiplication one a = a
  mulOne : ∀ a : carrier, multiplication a one = a
  leftDistributive : ∀ a b c : carrier, multiplication a (addition b c) = addition (multiplication a b) (multiplication a c)
  rightDistributive : ∀ a b c : carrier, multiplication (addition a b) c = addition (multiplication a c) (multiplication b c)

structure MatrixAlgebraEvidence (A : MatrixAlgebra) where
  additionAssociativeClosed : A.additionAssociative
  additionCommutativeClosed : A.additionCommutative
  zeroAddClosed : A.zeroAdd
  addZeroClosed : A.addZero
  multiplicationAssociativeClosed : A.multiplicationAssociative
  oneMulClosed : A.oneMul
  mulOneClosed : A.mulOne
  leftDistributiveClosed : A.leftDistributive
  rightDistributiveClosed : A.rightDistributive

def MatrixAlgebraClosed (A : MatrixAlgebra) : Prop :=
  A.additionAssociative ∧ A.additionCommutative ∧ A.zeroAdd ∧ A.addZero ∧
  A.multiplicationAssociative ∧ A.oneMul ∧ A.mulOne ∧
  A.leftDistributive ∧ A.rightDistributive

theorem matrix_algebra_closed_from_evidence (A : MatrixAlgebra) (E : MatrixAlgebraEvidence A) :
    MatrixAlgebraClosed A := by
  exact And.intro E.additionAssociativeClosed
    (And.intro E.additionCommutativeClosed
      (And.intro E.zeroAddClosed
        (And.intro E.addZeroClosed
          (And.intro E.multiplicationAssociativeClosed
            (And.intro E.oneMulClosed
              (And.intro E.mulOneClosed
                (And.intro E.leftDistributiveClosed E.rightDistributiveClosed)))))))

end CommutativityMatricesCanonicalLaneLean
end HautevilleHouse