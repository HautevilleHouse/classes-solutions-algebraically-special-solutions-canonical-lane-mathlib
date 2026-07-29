import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure AlgebraicSpecialObject where
  carrier : Type
  addition : carrier → carrier → carrier
  multiplication : carrier → carrier → carrier
  zero : carrier
  one : carrier
  isAlgebraicallyClosed : Prop
  specialSolutionExists : Prop
  specialSolution : carrier
  polynomial : List carrier
  specialMapsToZero : evaluation polynomial specialSolution = zero

def evaluation (p : List carrier) (x : carrier) : carrier := sorry

structure AdmittedObject where
  obj : AlgebraicSpecialObject
  conclusion : obj.specialSolutionExists

def witnessClosed (O : AdmittedObject) : Prop := O.conclusion

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse