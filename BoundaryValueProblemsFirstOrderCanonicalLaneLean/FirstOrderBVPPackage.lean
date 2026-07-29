import BoundaryValueProblemsFirstOrderCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FirstOrderBVPPackage where
  interval : Type u
  functionSpace : Type v
  differentialEquation : Prop
  boundaryCondition : Prop
  solutionExists : Prop

structure FirstOrderBVPEvidence (P : FirstOrderBVPPackage) where
  intervalClosed : P.interval
  functionSpaceClosed : P.functionSpace
  differentialEquationClosed : P.differentialEquation
  boundaryConditionClosed : P.boundaryCondition
  solutionExistsClosed : P.solutionExists

def FirstOrderBVPClosed (P : FirstOrderBVPPackage) : Prop :=
  P.interval ∧ P.functionSpace ∧ P.differentialEquation ∧ P.boundaryCondition ∧ P.solutionExists

theorem first_order_bvp_closed_from_evidence (P : FirstOrderBVPPackage) (E : FirstOrderBVPEvidence P) :
    FirstOrderBVPClosed P := by
  exact And.intro E.intervalClosed
    (And.intro E.functionSpaceClosed
      (And.intro E.differentialEquationClosed
        (And.intro E.boundaryConditionClosed E.solutionExistsClosed)))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse