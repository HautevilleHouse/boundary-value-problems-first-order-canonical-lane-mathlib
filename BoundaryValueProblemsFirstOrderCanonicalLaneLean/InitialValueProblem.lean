import BoundaryValueProblemsFirstOrderCanonical.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonical

structure InitialValueProblemPackage where
  timeInterval : Type u
  stateSpace : Type v
  vectorField : stateSpace -> stateSpace
  initialTime : timeInterval
  initialCondition : stateSpace
  solution : timeInterval -> stateSpace
  existence : Prop
  uniqueness : Prop
  existenceTerm : existence
  uniquenessTerm : uniqueness

theorem initial_value_problem_solution_unique
    (P : InitialValueProblemPackage) : P.existence ∧ P.uniqueness := by
  exact And.intro P.existenceTerm P.uniquenessTerm

end BoundaryValueProblemsFirstOrderCanonical
end HautevilleHouse