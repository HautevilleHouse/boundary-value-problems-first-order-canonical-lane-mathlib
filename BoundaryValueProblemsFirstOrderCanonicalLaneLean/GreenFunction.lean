import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure GreenFunctionPackage where
  linearOperator : Type u
  kernel : Type v
  solutionRepresentation : Prop
  existenceCondition : Prop

structure GreenFunctionEvidence (G : GreenFunctionPackage) where
  solutionRepresentationClosed : G.solutionRepresentation
  existenceConditionClosed : G.existenceCondition

def GreenFunctionClosed (G : GreenFunctionPackage) : Prop :=
  G.solutionRepresentation ∧ G.existenceCondition

theorem green_function_closed_from_evidence (G : GreenFunctionPackage) (E : GreenFunctionEvidence G) :
    GreenFunctionClosed G := by
  exact And.intro E.solutionRepresentationClosed E.existenceConditionClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse