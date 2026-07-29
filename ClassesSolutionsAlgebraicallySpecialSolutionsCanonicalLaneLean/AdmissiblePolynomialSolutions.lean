import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure PolynomialSolutionPackage where
  underlyingRing : Type u
  polynomialRing : Type v
  ideal : polynomialRing → Prop
  solutionSet : polynomialRing → Prop
  ringAddition : underlyingRing → underlyingRing → underlyingRing
  ringMultiplication : underlyingRing → underlyingRing → underlyingRing
  ringZero : underlyingRing
  ringOne : underlyingRing
  polynomialAddition : polynomialRing → polynomialRing → polynomialRing
  polynomialMultiplication : polynomialRing → polynomialRing → polynomialRing
  polynomialZero : polynomialRing
  polynomialOne : polynomialRing
  solutionAdditionClosed : ∀ p q, solutionSet p → solutionSet q → solutionSet (polynomialAddition p q)
  solutionMultiplicationClosed : ∀ p q, solutionSet p → solutionSet q → solutionSet (polynomialMultiplication p q)
  solutionContainsZero : solutionSet polynomialZero
  solutionContainsOne : solutionSet polynomialOne

structure PolynomialSolutionEvidence (P : PolynomialSolutionPackage) where
  solutionAdditionClosedEvidence : P.solutionAdditionClosed
  solutionMultiplicationClosedEvidence : P.solutionMultiplicationClosed
  solutionContainsZeroEvidence : P.solutionContainsZero
  solutionContainsOneEvidence : P.solutionContainsOne

def PolynomialSolutionClosed (P : PolynomialSolutionPackage) : Prop :=
  ∀ p q, P.solutionSet p → P.solutionSet q → P.solutionSet (P.polynomialAddition p q) ∧
    P.solutionSet (P.polynomialMultiplication p q) ∧
    P.solutionSet P.polynomialZero ∧
    P.solutionSet P.polynomialOne

theorem polynomial_solution_closed_from_evidence (P : PolynomialSolutionPackage)
    (E : PolynomialSolutionEvidence P) : PolynomialSolutionClosed P := by
  intro p q hp hq
  exact And.intro (E.solutionAdditionClosedEvidence p q hp hq)
    (And.intro (E.solutionMultiplicationClosedEvidence p q hp hq)
      (And.intro E.solutionContainsZeroEvidence E.solutionContainsOneEvidence))

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse