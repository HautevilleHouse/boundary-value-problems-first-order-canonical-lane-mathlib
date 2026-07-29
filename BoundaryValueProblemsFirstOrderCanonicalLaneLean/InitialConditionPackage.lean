import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure InitialConditionPackage where
  initialTime : ℝ
  initialState : ℝ
  initialConditionDefined : Prop
  consistentWithODE : Prop

structure InitialConditionEvidence (I : InitialConditionPackage) where
  initialConditionDefinedClosed : I.initialConditionDefined
  consistentWithODEClosed : I.consistentWithODE

def InitialConditionClosed (I : InitialConditionPackage) : Prop :=
  I.initialConditionDefined ∧ I.consistentWithODE

theorem initial_condition_closed_from_evidence (I : InitialConditionPackage)
    (E : InitialConditionEvidence I) : InitialConditionClosed I := by
  exact And.intro E.initialConditionDefinedClosed E.consistentWithODEClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse