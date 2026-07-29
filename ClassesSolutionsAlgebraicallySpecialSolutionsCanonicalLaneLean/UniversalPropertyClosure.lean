import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure UniversalPropertyPackage where
  initialObject : Type u
  terminalObject : Type v
  initialUniversalProperty : Prop
  terminalUniversalProperty : Prop
  initialUnderlyingCarrier : Type u
  terminalUnderlyingCarrier : Type v
  initialMorphismUnique : Prop
  terminalMorphismUnique : Prop

structure UniversalPropertyEvidence (U : UniversalPropertyPackage) where
  initialUniversalPropertyClosed : U.initialUniversalProperty
  terminalUniversalPropertyClosed : U.terminalUniversalProperty
  initialMorphismUniqueClosed : U.initialMorphismUnique
  terminalMorphismUniqueClosed : U.terminalMorphismUnique

def UniversalPropertyClosed (U : UniversalPropertyPackage) : Prop :=
  U.initialUniversalProperty ∧ U.terminalUniversalProperty ∧
  U.initialMorphismUnique ∧ U.terminalMorphismUnique

theorem universal_property_closed_from_evidence (U : UniversalPropertyPackage)
    (E : UniversalPropertyEvidence U) : UniversalPropertyClosed U := by
  exact And.intro E.initialUniversalPropertyClosed
    (And.intro E.terminalUniversalPropertyClosed
      (And.intro E.initialMorphismUniqueClosed E.terminalMorphismUniqueClosed))

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse