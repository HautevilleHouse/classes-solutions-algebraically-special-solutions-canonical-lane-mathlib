import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure TheoremStatement where
  sourceKey : String
  theoremName : String
  theoremObject : String
  classicalBoundary : String
  manifoldConstrainedStatement : String
  certificateLane : String
  carriedRemainder : String

def sourceTheoremStatement : TheoremStatement := {
  sourceKey := "ClassesSolutionsAlgebraicallySpecialSolutions",
  theoremName := "Classes Solutions Algebraically Special Solutions",
  theoremObject := "Algebraic structure with special solutions",
  classicalBoundary := "Unrestricted classical boundary remains open",
  manifoldConstrainedStatement := "Admissible class bridge and gate closed",
  certificateLane := "algebraic_special",
  carriedRemainder := "Classical source boundary carried by formalization"
}

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse
