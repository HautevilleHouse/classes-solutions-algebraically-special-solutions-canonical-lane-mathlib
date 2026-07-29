import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean

structure SpecialSolutionClass (A : AdmissibleClass) where
  solutionType : Type u
  algebraicCondition : Prop
  solutionExists : Prop
  solutionUnique : Prop
  closedFormExpression : Prop
  algebraicConditionTerm : algebraicCondition
  solutionExistsTerm : solutionExists
  solutionUniqueTerm : solutionUnique
  closedFormTerm : closedFormExpression

structure SpecialSolutionEvidence {A : AdmissibleClass} (S : SpecialSolutionClass A) where
  algebraicConditionClosed : S.algebraicCondition
  solutionExistsClosed : S.solutionExists
  solutionUniqueClosed : S.solutionUnique
  closedFormClosed : S.closedFormExpression

def SpecialSolutionClosed {A : AdmissibleClass} (S : SpecialSolutionClass A) : Prop :=
  S.algebraicCondition ∧ S.solutionExists ∧ S.solutionUnique ∧ S.closedFormExpression

theorem special_solution_closed_from_evidence {A : AdmissibleClass}
    (S : SpecialSolutionClass A) (E : SpecialSolutionEvidence S) :
    SpecialSolutionClosed S := by
  exact And.intro E.algebraicConditionClosed
    (And.intro E.solutionExistsClosed
      (And.intro E.solutionUniqueClosed E.closedFormClosed))

end ClassesSolutionsAlgebraicallySpecialSolutionsCanonicalLaneLean
end HautevilleHouse