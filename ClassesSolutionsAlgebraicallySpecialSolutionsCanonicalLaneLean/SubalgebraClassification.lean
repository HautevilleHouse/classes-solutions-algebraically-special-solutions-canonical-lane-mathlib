import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicStructurePackage

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure SubalgebraClassificationPackage (G : AlgebraicStructurePackage) where
  subalgebraFamily : Set (Set G.underlyingSet)
  subalgebraClosedUnderOps : ∀ (S : Set G.underlyingSet), S ∈ subalgebraFamily → (∀ a b : G.underlyingSet, a ∈ S → b ∈ S → G.binaryOperation a b ∈ S) ∧ (∀ a : G.underlyingSet, a ∈ S → G.inverseOperation a ∈ S) ∧ G.identityElement ∈ S
  subalgebraClassificationComplete : ∀ (A : Set G.underlyingSet), (∀ a b : G.underlyingSet, a ∈ A → b ∈ A → G.binaryOperation a b ∈ A) ∧ (∀ a : G.underlyingSet, a ∈ A → G.inverseOperation a ∈ A) ∧ G.identityElement ∈ A → A ∈ subalgebraFamily

structure SubalgebraClassificationEvidence {G : AlgebraicStructurePackage} (P : SubalgebraClassificationPackage G) where
  subalgebraClosedUnderOpsClosed : P.subalgebraClosedUnderOps
  subalgebraClassificationCompleteClosed : P.subalgebraClassificationComplete

def SubalgebraClassificationClosed {G : AlgebraicStructurePackage} (P : SubalgebraClassificationPackage G) : Prop :=
  P.subalgebraClosedUnderOps ∧ P.subalgebraClassificationComplete

theorem subalgebra_classification_closed_from_evidence {G : AlgebraicStructurePackage} (P : SubalgebraClassificationPackage G) (E : SubalgebraClassificationEvidence P) : SubalgebraClassificationClosed P := by
  exact And.intro E.subalgebraClosedUnderOpsClosed E.subalgebraClassificationCompleteClosed

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse