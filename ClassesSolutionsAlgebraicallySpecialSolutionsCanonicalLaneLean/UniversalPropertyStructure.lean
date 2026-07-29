import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure UniversalPropertyStructure (A : AdmissibleClass) where
  initialObject : A.object
  terminalObject : A.object
  productDefined : Prop
  coproductDefined : Prop
  equalizerExists : Prop
  coequalizerExists : Prop
  productDefinedTerm : productDefined
  coproductDefinedTerm : coproductDefined
  equalizerExistsTerm : equalizerExists
  coequalizerExistsTerm : coequalizerExists

structure UniversalPropertyEvidence {A : AdmissibleClass} (U : UniversalPropertyStructure A) where
  productDefinedClosed : U.productDefined
  coproductDefinedClosed : U.coproductDefined
  equalizerExistsClosed : U.equalizerExists
  coequalizerExistsClosed : U.coequalizerExists

def UniversalPropertyClosed {A : AdmissibleClass} (U : UniversalPropertyStructure A) : Prop :=
  U.productDefined ∧ U.coproductDefined ∧ U.equalizerExists ∧ U.coequalizerExists

theorem universal_property_closed_from_evidence {A : AdmissibleClass}
    (U : UniversalPropertyStructure A) (E : UniversalPropertyEvidence U) :
    UniversalPropertyClosed U := by
  exact And.intro E.productDefinedClosed
    (And.intro E.coproductDefinedClosed
      (And.intro E.equalizerExistsClosed E.coequalizerExistsClosed))

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse