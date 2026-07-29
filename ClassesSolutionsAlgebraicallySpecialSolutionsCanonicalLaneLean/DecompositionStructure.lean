import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure DecompositionStructure (A : AdmissibleClass) where
  directSumDecomposition : Prop
  semisimpleComponents : Prop
  indecomposableClassification : Prop
  uniquenessOfDecomposition : Prop
  directSumTerm : directSumDecomposition
  semisimpleTerm : semisimpleComponents
  indecomposableTerm : indecomposableClassification
  uniquenessTerm : uniquenessOfDecomposition

structure DecompositionEvidence {A : AdmissibleClass} (D : DecompositionStructure A) where
  directSumClosed : D.directSumDecomposition
  semisimpleClosed : D.semisimpleComponents
  indecomposableClosed : D.indecomposableClassification
  uniquenessClosed : D.uniquenessOfDecomposition

def DecompositionClosed {A : AdmissibleClass} (D : DecompositionStructure A) : Prop :=
  D.directSumDecomposition ∧ D.semisimpleComponents ∧ D.indecomposableClassification ∧ D.uniquenessOfDecomposition

theorem decomposition_closed_from_evidence {A : AdmissibleClass}
    (D : DecompositionStructure A) (E : DecompositionEvidence D) :
    DecompositionClosed D := by
  exact And.intro E.directSumClosed
    (And.intro E.semisimpleClosed
      (And.intro E.indecomposableClosed E.uniquenessClosed))

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse