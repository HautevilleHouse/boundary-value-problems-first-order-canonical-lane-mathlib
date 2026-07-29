import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.AdmissibleClassBVP

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FirstOrderLinearBVPPackage (A : BVPAdmittedObject) where
  interval : Set ℝ
  linearOperator : (ℝ → A.carrier) → (ℝ → A.carrier)
  sourceTerm : ℝ → A.carrier
  boundaryOperator : (A.carrier → A.carrier) → (A.carrier → A.carrier)
  boundaryValue : A.carrier
  wellposednessCondition : Prop
  uniquenessCondition : Prop
  continuousDependence : Prop

structure FirstOrderLinearBVPEvidence {A : BVPAdmittedObject}
    (P : FirstOrderLinearBVPPackage A) where
  wellposednessConditionClosed : P.wellposednessCondition
  uniquenessConditionClosed : P.uniquenessCondition
  continuousDependenceClosed : P.continuousDependence

def FirstOrderLinearBVPClosed {A : BVPAdmittedObject}
    (P : FirstOrderLinearBVPPackage A) : Prop :=
  P.wellposednessCondition ∧ P.uniquenessCondition ∧ P.continuousDependence

theorem first_order_linear_bvp_closed_from_evidence
    {A : BVPAdmittedObject} (P : FirstOrderLinearBVPPackage A)
    (E : FirstOrderLinearBVPEvidence P) : FirstOrderLinearBVPClosed P := by
  exact And.intro E.wellposednessConditionClosed
    (And.intro E.uniquenessConditionClosed E.continuousDependenceClosed)

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
