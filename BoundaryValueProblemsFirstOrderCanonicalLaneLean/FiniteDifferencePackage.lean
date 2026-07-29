import BoundaryValueProblemsFirstOrderCanonicalLaneLean.FirstOrderBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FiniteDifferencePackage (P : FirstOrderBVPPackage) where
  discretizationScheme : Prop
  consistency : Prop
  stability : Prop
  convergence : Prop

structure FiniteDifferenceEvidence {P : FirstOrderBVPPackage} (F : FiniteDifferencePackage P) where
  discretizationSchemeClosed : F.discretizationScheme
  consistencyClosed : F.consistency
  stabilityClosed : F.stability
  convergenceClosed : F.convergence

def FiniteDifferenceClosed {P : FirstOrderBVPPackage} (F : FiniteDifferencePackage P) : Prop :=
  F.discretizationScheme ∧ F.consistency ∧ F.stability ∧ F.convergence

theorem finite_difference_closed_from_evidence
    {P : FirstOrderBVPPackage} (F : FiniteDifferencePackage P)
    (Ev : FiniteDifferenceEvidence F) : FiniteDifferenceClosed F := by
  exact And.intro Ev.discretizationSchemeClosed
    (And.intro Ev.consistencyClosed
      (And.intro Ev.stabilityClosed Ev.convergenceClosed))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse