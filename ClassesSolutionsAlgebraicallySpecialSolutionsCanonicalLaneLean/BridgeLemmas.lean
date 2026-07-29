import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  AlgebraicSpecialSolutionsWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse