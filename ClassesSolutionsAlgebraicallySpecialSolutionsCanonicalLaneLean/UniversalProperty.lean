import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicStructurePackage
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.MorphismStructure

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure UniversalPropertyPackage (G : AlgebraicStructurePackage) where
  isFree : Prop
  isInitial : Prop
  isTerminal : Prop
  freeGenerators : Set G.underlyingSet
  initialObjectCondition : ∀ (H : AlgebraicStructurePackage), Nonempty (MorphismStructurePackage G H)
  terminalObjectCondition : ∀ (H : AlgebraicStructurePackage), Nonempty (MorphismStructurePackage H G)
  freeGeneratorsProperty : ∀ (H : AlgebraicStructurePackage) (f : G.underlyingSet → H.underlyingSet), ∃! (φ : MorphismStructurePackage G H), ∀ x ∈ freeGenerators, φ.underlyingMap x = f x

structure UniversalPropertyEvidence {G : AlgebraicStructurePackage} (U : UniversalPropertyPackage G) where
  initialObjectConditionClosed : U.initialObjectCondition
  terminalObjectConditionClosed : U.terminalObjectCondition
  freeGeneratorsPropertyClosed : U.freeGeneratorsProperty

def UniversalPropertyClosed {G : AlgebraicStructurePackage} (U : UniversalPropertyPackage G) : Prop :=
  U.initialObjectCondition ∧ U.terminalObjectCondition ∧ U.freeGeneratorsProperty

theorem universal_property_closed_from_evidence {G : AlgebraicStructurePackage} (U : UniversalPropertyPackage G) (E : UniversalPropertyEvidence U) : UniversalPropertyClosed U := by
  exact And.intro E.initialObjectConditionClosed (And.intro E.terminalObjectConditionClosed E.freeGeneratorsPropertyClosed)

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse