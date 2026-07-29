import canonicalLaneMathlib.AdmissibleClass
import .FirstOrderEquation

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure UniquenessTheoryPackage {E : FirstOrderEquationPackage} where
  uniquenessCondition : Prop
  continuousDependence : Prop
  stabilityCondition : Prop

structure UniquenessTheoryEvidence {E : FirstOrderEquationPackage}
    (UT : UniquenessTheoryPackage E) where
  uniquenessConditionClosed : UT.uniquenessCondition
  continuousDependenceClosed : UT.continuousDependence
  stabilityConditionClosed : UT.stabilityCondition

def UniquenessTheoryClosed {E : FirstOrderEquationPackage}
    (UT : UniquenessTheoryPackage E) : Prop :=
  UT.uniquenessCondition ∧ UT.continuousDependence ∧ UT.stabilityCondition

theorem uniqueness_theory_closed_from_evidence
    {E : FirstOrderEquationPackage} (UT : UniquenessTheoryPackage E)
    (Ev : UniquenessTheoryEvidence UT) : UniquenessTheoryClosed UT := by
  exact And.intro Ev.uniquenessConditionClosed
    (And.intro Ev.continuousDependenceClosed Ev.stabilityConditionClosed)

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse