import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure AlgebraicClosurePackage where
  representationTheorem : Prop
  decompositionTheorem : Prop
  structureTheorems : Prop
  representationTheoremClosed : representationTheorem
  decompositionTheoremClosed : decompositionTheorem
  structureTheoremsClosed : structureTheorems

def AlgebraicClosureClosed (P : AlgebraicClosurePackage) : Prop :=
  P.representationTheorem ∧ P.decompositionTheorem ∧ P.structureTheorems

theorem algebraic_closure_closed_from_package (P : AlgebraicClosurePackage) :
    AlgebraicClosureClosed P := by
  exact And.intro P.representationTheoremClosed (And.intro P.decompositionTheoremClosed P.structureTheoremsClosed)

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse