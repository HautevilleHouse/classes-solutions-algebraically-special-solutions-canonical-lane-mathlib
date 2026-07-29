import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure AlgebraicSpecialSolutionsObject where
  carrier : Type
  operations : carrier → carrier → carrier
  specialSolutions : List carrier
  universalProperty : Prop

def AlgebraicSpecialSolutionsWitnessClosed (O : AlgebraicSpecialSolutionsObject) : Prop :=
  O.universalProperty

structure AlgebraicSpecialSolutionsAdmittedObject where
  object : AlgebraicSpecialSolutionsObject
  witness : AlgebraicSpecialSolutionsWitnessClosed object
  conclusion : witness

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse