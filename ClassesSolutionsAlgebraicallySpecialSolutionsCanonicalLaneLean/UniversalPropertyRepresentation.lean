import canonicalLaneMathlib.AdmissibleClass
import ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean.AlgebraicSpecialObject

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure UniversalPropertyPackage where
  freeObject : AlgebraicSpecialObject
  representationMap : AlgebraicSpecialObject → AlgebraicSpecialObject
  universalMorphism : AlgebraicSpecialObject → AlgebraicSpecialObject
  representationExists : Prop
  universalMorphismExists : Prop

structure UniversalPropertyEvidence (P : UniversalPropertyPackage) where
  representationExistsClosed : P.representationExists
  universalMorphismExistsClosed : P.universalMorphismExists

def UniversalPropertyClosed (P : UniversalPropertyPackage) : Prop :=
  P.representationExists ∧ P.universalMorphismExists

theorem universal_property_closed_from_evidence (P : UniversalPropertyPackage)
    (E : UniversalPropertyEvidence P) : UniversalPropertyClosed P :=
  And.intro E.representationExistsClosed E.universalMorphismExistsClosed

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse