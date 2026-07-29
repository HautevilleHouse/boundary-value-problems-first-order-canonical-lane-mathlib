import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.FirstOrderLinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure ShootingMethodPackage {A : BVPAdmittedObject}
    (P : FirstOrderLinearBVPPackage A) where
  initialValueProblem : Prop
  parameterContinuation : Prop
  monotonicityCondition : Prop
  existenceByShooting : Prop
  uniquenessByShooting : Prop

structure ShootingMethodEvidence {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (S : ShootingMethodPackage P) where
  initialValueProblemClosed : S.initialValueProblem
  parameterContinuationClosed : S.parameterContinuation
  monotonicityConditionClosed : S.monotonicityCondition
  existenceByShootingClosed : S.existenceByShooting
  uniquenessByShootingClosed : S.uniquenessByShooting

def ShootingMethodClosed {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (S : ShootingMethodPackage P) : Prop :=
  S.initialValueProblem ∧ S.parameterContinuation ∧
  S.monotonicityCondition ∧ S.existenceByShooting ∧ S.uniquenessByShooting

theorem shooting_method_closed_from_evidence
    {A : BVPAdmittedObject} {P : FirstOrderLinearBVPPackage A}
    (S : ShootingMethodPackage P) (E : ShootingMethodEvidence S) :
    ShootingMethodClosed S := by
  exact And.intro E.initialValueProblemClosed
    (And.intro E.parameterContinuationClosed
      (And.intro E.monotonicityConditionClosed
        (And.intro E.existenceByShootingClosed E.uniquenessByShootingClosed)))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
