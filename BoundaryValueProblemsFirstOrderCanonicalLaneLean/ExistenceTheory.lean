import canonicalLaneMathlib.AdmissibleClass
import .FirstOrderEquation

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure ExistenceTheoryPackage {E : FirstOrderEquationPackage} where
  solutionSpace : Type u
  existenceCondition : Prop
  regularityCondition : Prop

structure ExistenceTheoryEvidence {E : FirstOrderEquationPackage}
    (ET : ExistenceTheoryPackage E) where
  existenceConditionClosed : ET.existenceCondition
  regularityConditionClosed : ET.regularityCondition

def ExistenceTheoryClosed {E : FirstOrderEquationPackage}
    (ET : ExistenceTheoryPackage E) : Prop :=
  ET.existenceCondition ∧ ET.regularityCondition

theorem existence_theory_closed_from_evidence
    {E : FirstOrderEquationPackage} (ET : ExistenceTheoryPackage E)
    (Ev : ExistenceTheoryEvidence ET) : ExistenceTheoryClosed ET := by
  exact And.intro Ev.existenceConditionClosed Ev.regularityConditionClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse