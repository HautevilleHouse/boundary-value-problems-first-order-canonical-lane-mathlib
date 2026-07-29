import BoundaryValueProblemsFirstOrderCanonicalLaneLean.FirstOrderODEPackage

/-!
# Boundary Condition Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure BoundaryCondition {O : FirstOrderODEPackage} where
  boundaryType : String
  boundaryValue : O.stateSpace
  timePoint : O.timeDomain
  conditionIsSatisfied : Prop

structure BoundaryConditionEvidence {O : FirstOrderODEPackage}
    (B : BoundaryCondition O) where
  conditionIsSatisfiedClosed : B.conditionIsSatisfied

def BoundaryConditionClosed {O : FirstOrderODEPackage}
    (B : BoundaryCondition O) : Prop :=
  B.conditionIsSatisfied

theorem boundary_condition_closed_from_evidence
    {O : FirstOrderODEPackage} (B : BoundaryCondition O)
    (E : BoundaryConditionEvidence B) : BoundaryConditionClosed B := by
  exact E.conditionIsSatisfiedClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
