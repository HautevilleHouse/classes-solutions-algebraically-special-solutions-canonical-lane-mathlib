import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicStructurePackage
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.SubalgebraClassification

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure RepresentationTheoremPackage (G : AlgebraicStructurePackage) where
  representationType : Type u
  representationMap : G.underlyingSet → representationType
  injectivity : Function.Injective representationMap
  respectsOps : (∀ a b : G.underlyingSet, representationMap (G.binaryOperation a b) = (representationMap a) + (representationMap b)) ∧ representationMap G.identityElement = 0 ∧ (∀ a : G.underlyingSet, representationMap (G.inverseOperation a) = -(representationMap a))
  completeRepresentation : ∀ (v : representationType), ∃ (a : G.underlyingSet), representationMap a = v

structure RepresentationTheoremEvidence {G : AlgebraicStructurePackage} (R : RepresentationTheoremPackage G) where
  injectivityClosed : R.injectivity
  respectsOpsClosed : R.respectsOps
  completeRepresentationClosed : R.completeRepresentation

def RepresentationTheoremClosed {G : AlgebraicStructurePackage} (R : RepresentationTheoremPackage G) : Prop :=
  R.injectivity ∧ R.respectsOps ∧ R.completeRepresentation

theorem representation_theorem_closed_from_evidence {G : AlgebraicStructurePackage} (R : RepresentationTheoremPackage G) (E : RepresentationTheoremEvidence R) : RepresentationTheoremClosed R := by
  exact And.intro E.injectivityClosed (And.intro E.respectsOpsClosed E.completeRepresentationClosed)

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse