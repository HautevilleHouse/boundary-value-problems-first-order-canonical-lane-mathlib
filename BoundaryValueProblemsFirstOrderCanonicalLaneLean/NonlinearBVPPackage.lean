import BoundaryValueProblemsFirstOrderCanonicalLaneLean.LinearBVPPackage

/-!
# Nonlinear BVP Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure NonlinearBVPPackage (B : BVPSpace) where
  fixedPointFormulation : Prop
  contractionMapping : Prop
  aPrioriEstimate : Prop
  existenceResult : Prop

structure NonlinearBVPEvidence (B : BVPSpace) (N : NonlinearBVPPackage B) where
  fixedPointFormulationClosed : N.fixedPointFormulation
  contractionMappingClosed : N.contractionMapping
  aPrioriEstimateClosed : N.aPrioriEstimate
  existenceResultClosed : N.existenceResult

def NonLinearBVPClosed (B : BVPSpace) (N : NonlinearBVPPackage B) : Prop :=
  N.fixedPointFormulation ∧ N.contractionMapping ∧ N.aPrioriEstimate ∧ N.existenceResult

theorem nonlinear_bvp_closed_from_evidence (B : BVPSpace) (N : NonlinearBVPPackage B) (E : NonlinearBVPEvidence B N) : NonLinearBVPClosed B N := by
  exact And.intro E.fixedPointFormulationClosed (And.intro E.contractionMappingClosed (And.intro E.aPrioriEstimateClosed E.existenceResultClosed))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse