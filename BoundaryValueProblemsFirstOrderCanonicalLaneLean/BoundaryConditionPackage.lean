import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure BoundaryConditionPackage where
  leftBoundary : ℝ
  rightBoundary : ℝ
  boundaryConditionType : String
  conditionFormulated : Prop
  compatibleWithODE : Prop

structure BoundaryConditionEvidence (B : BoundaryConditionPackage) where
  conditionFormulatedClosed : B.conditionFormulated
  compatibleWithODEClosed : B.compatibleWithODE

def BoundaryConditionClosed (B : BoundaryConditionPackage) : Prop :=
  B.conditionFormulated ∧ B.compatibleWithODE

theorem boundary_condition_closed_from_evidence (B : BoundaryConditionPackage)
    (E : BoundaryConditionEvidence B) : BoundaryConditionClosed B := by
  exact And.intro E.conditionFormulatedClosed E.compatibleWithODEClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse