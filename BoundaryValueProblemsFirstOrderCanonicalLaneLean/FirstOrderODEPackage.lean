import BoundaryValueProblemsFirstOrderCanonicalLaneLean.AdmissibleClass

/-!
# First Order ODE Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FirstOrderODEPackage where
  stateSpace : Type u
  timeDomain : Type v
  vectorField : stateSpace → timeDomain → stateSpace
  initialCondition : stateSpace
  solution : timeDomain → stateSpace
  solutionSatisfiesODE : Prop
  solutionSatisfiesInitialCondition : Prop

structure FirstOrderODEEvidence (O : FirstOrderODEPackage) where
  solutionSatisfiesODEClosed : O.solutionSatisfiesODE
  solutionSatisfiesInitialConditionClosed : O.solutionSatisfiesInitialCondition

def FirstOrderODEClosed (O : FirstOrderODEPackage) : Prop :=
  O.solutionSatisfiesODE ∧ O.solutionSatisfiesInitialCondition

theorem first_order_ode_closed_from_evidence
    (O : FirstOrderODEPackage) (E : FirstOrderODEEvidence O) :
    FirstOrderODEClosed O := by
  exact And.intro E.solutionSatisfiesODEClosed
    E.solutionSatisfiesInitialConditionClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
