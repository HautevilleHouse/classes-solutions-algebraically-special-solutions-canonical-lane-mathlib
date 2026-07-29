import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicSpecialObject

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure StructureDecompositionPackage where
  directSummands : List AlgebraicSpecialObject
  decompositionMap : AlgebraicSpecialObject → AlgebraicSpecialObject
  decompositionIsIsomorphism : Prop
  componentsSpecialSolutionClosed : Prop

structure StructureDecompositionEvidence (D : StructureDecompositionPackage) where
  decompositionIsIsomorphismClosed : D.decompositionIsIsomorphism
  componentsSpecialSolutionClosedClosed : D.componentsSpecialSolutionClosed

def StructureDecompositionClosed (D : StructureDecompositionPackage) : Prop :=
  D.decompositionIsIsomorphism ∧ D.componentsSpecialSolutionClosed

theorem structure_decomposition_closed_from_evidence (D : StructureDecompositionPackage)
    (E : StructureDecompositionEvidence D) : StructureDecompositionClosed D :=
  And.intro E.decompositionIsIsomorphismClosed E.componentsSpecialSolutionClosedClosed

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse