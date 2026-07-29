import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure AlgebraicStructurePackage where
  underlyingSet : Type u
  binaryOperation : underlyingSet → underlyingSet → underlyingSet
  identityElement : underlyingSet
  inverseOperation : underlyingSet → underlyingSet
  associativityAxiom : ∀ a b c : underlyingSet, binaryOperation (binaryOperation a b) c = binaryOperation a (binaryOperation b c)
  identityAxiom : ∀ a : underlyingSet, binaryOperation a identityElement = a ∧ binaryOperation identityElement a = a
  inverseAxiom : ∀ a : underlyingSet, binaryOperation a (inverseOperation a) = identityElement ∧ binaryOperation (inverseOperation a) a = identityElement

structure AlgebraicStructureEvidence (G : AlgebraicStructurePackage) where
  associativityAxiomClosed : G.associativityAxiom
  identityAxiomClosed : G.identityAxiom
  inverseAxiomClosed : G.inverseAxiom

def AlgebraicStructureClosed (G : AlgebraicStructurePackage) : Prop :=
  G.associativityAxiom ∧ G.identityAxiom ∧ G.inverseAxiom

theorem algebraic_structure_closed_from_evidence (G : AlgebraicStructurePackage) (E : AlgebraicStructureEvidence G) : AlgebraicStructureClosed G := by
  exact And.intro E.associativityAxiomClosed (And.intro E.identityAxiomClosed E.inverseAxiomClosed)

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse