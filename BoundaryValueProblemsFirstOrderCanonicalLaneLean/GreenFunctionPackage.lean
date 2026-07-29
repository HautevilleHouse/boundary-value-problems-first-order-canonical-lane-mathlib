import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.FirstOrderLinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure GreenFunctionPackage {A : BVPAdmittedObject}
    (P : FirstOrderLinearBVPPackage A) where
  kernel : ℝ × ℝ → A.carrier
  kernelRegularity : Prop
  representationTheorem : Prop
  boundaryCompatibility : Prop
  solutionIntegral : Prop

structure GreenFunctionEvidence {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (G : GreenFunctionPackage P) where
  kernelRegularityClosed : G.kernelRegularity
  representationTheoremClosed : G.representationTheorem
  boundaryCompatibilityClosed : G.boundaryCompatibility
  solutionIntegralClosed : G.solutionIntegral

def GreenFunctionClosed {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (G : GreenFunctionPackage P) : Prop :=
  G.kernelRegularity ∧ G.representationTheorem ∧
  G.boundaryCompatibility ∧ G.solutionIntegral

theorem green_function_closed_from_evidence
    {A : BVPAdmittedObject} {P : FirstOrderLinearBVPPackage A}
    (G : GreenFunctionPackage P) (E : GreenFunctionEvidence G) :
    GreenFunctionClosed G := by
  exact And.intro E.kernelRegularityClosed
    (And.intro E.representationTheoremClosed
      (And.intro E.boundaryCompatibilityClosed E.solutionIntegralClosed))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
