import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FirstOrderEquationPackage where
  interval : Type u
  domain : Type v
  differentialOperator : Type w
  boundaryOperator : Type x
  linearityCondition : Prop
  wellPosedCondition : Prop

structure FirstOrderEquationEvidence (E : FirstOrderEquationPackage) where
  linearityConditionClosed : E.linearityCondition
  wellPosedConditionClosed : E.wellPosedCondition

def FirstOrderEquationClosed (E : FirstOrderEquationPackage) : Prop :=
  E.linearityCondition ∧ E.wellPosedCondition

theorem first_order_equation_closed_from_evidence
    (E : FirstOrderEquationPackage) (Ev : FirstOrderEquationEvidence E) :
    FirstOrderEquationClosed E := by
  exact And.intro Ev.linearityConditionClosed Ev.wellPosedConditionClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse