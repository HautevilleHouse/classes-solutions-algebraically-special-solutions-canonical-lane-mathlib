import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicStructurePackage

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure MorphismStructurePackage (G H : AlgebraicStructurePackage) where
  underlyingMap : G.underlyingSet → H.underlyingSet
  respectsBinary : ∀ a b : G.underlyingSet, underlyingMap (G.binaryOperation a b) = H.binaryOperation (underlyingMap a) (underlyingMap b)
  respectsIdentity : underlyingMap G.identityElement = H.identityElement
  respectsInverse : ∀ a : G.underlyingSet, underlyingMap (G.inverseOperation a) = H.inverseOperation (underlyingMap a)

structure MorphismStructureEvidence {G H : AlgebraicStructurePackage} (M : MorphismStructurePackage G H) where
  respectsBinaryClosed : M.respectsBinary
  respectsIdentityClosed : M.respectsIdentity
  respectsInverseClosed : M.respectsInverse

def MorphismStructureClosed {G H : AlgebraicStructurePackage} (M : MorphismStructurePackage G H) : Prop :=
  M.respectsBinary ∧ M.respectsIdentity ∧ M.respectsInverse

theorem morphism_structure_closed_from_evidence {G H : AlgebraicStructurePackage} (M : MorphismStructurePackage G H) (E : MorphismStructureEvidence M) : MorphismStructureClosed M := by
  exact And.intro E.respectsBinaryClosed (And.intro E.respectsIdentityClosed E.respectsInverseClosed)

def IsomorphismStructurePackage (G H : AlgebraicStructurePackage) : Type := { M : MorphismStructurePackage G H // ∃ (N : MorphismStructurePackage H G), (∀ a : G.underlyingSet, N.underlyingMap (M.underlyingMap a) = a) ∧ (∀ b : H.underlyingSet, M.underlyingMap (N.underlyingMap b) = b) }

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse