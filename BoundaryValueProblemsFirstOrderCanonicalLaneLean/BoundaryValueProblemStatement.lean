import BoundaryValueProblemsFirstOrderCanonical.BoundaryConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonical

structure BoundaryValueProblemStatement where
  interval : ℝ × ℝ
  differentialOperator : (ℝ -> ℝ) -> ℝ -> ℝ
  boundaryConditions : Set (ℝ -> ℝ)
  rightHandSide : ℝ -> ℝ
  solution : ℝ -> ℝ
  differentialEquationHolds : ∀ x, differentialOperator solution x = rightHandSide x
  boundaryConditionHolds : solution ∈ boundaryConditions

theorem differential_equation_satisfied (B : BoundaryValueProblemStatement) :
    ∀ x, B.differentialOperator B.solution x = B.rightHandSide x :=
  B.differentialEquationHolds

theorem boundary_condition_satisfied (B : BoundaryValueProblemStatement) :
    B.solution ∈ B.boundaryConditions :=
  B.boundaryConditionHolds

end BoundaryValueProblemsFirstOrderCanonical
end HautevilleHouse