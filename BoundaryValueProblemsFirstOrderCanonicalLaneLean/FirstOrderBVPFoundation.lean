import canonicalLaneMathlib.AdmissibleClass
import BoundaryValueProblemsFirstOrder.AdmissibleClass
import BoundaryValueProblemsFirstOrder.BridgeLemmas
import BoundaryValueProblemsFirstOrder.GateLemmas
import BoundaryValueProblemsFirstOrder.FinalTheorem

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrder

structure FirstOrderBVPPackage where
  ode : (ℝ → ℝ → ℝ)
  interval : Set ℝ
  bc : ℝ × ℝ
  existenceResult : Prop
  uniquenessResult : Prop
  existenceEvidence : existenceResult
  uniquenessEvidence : uniquenessResult

structure BVPFoundation where
  package : FirstOrderBVPPackage
  admissible : AdmissibleClass
  bridgeOk : bridgeClosed admissible
  gateOk : gateClosed admissible

def BVPFoundationClosed (F : BVPFoundation) : Prop :=
  F.package.existenceResult ∧ F.package.uniquenessResult ∧
  bridgeClosed F.admissible ∧ gateClosed F.admissible

theorem bvp_foundation_closed_from_evidence (F : BVPFoundation) :
    BVPFoundationClosed F := by
  exact And.intro F.package.existenceEvidence
    (And.intro F.package.uniquenessEvidence
      (And.intro F.bridgeOk F.gateOk))

end BoundaryValueProblemsFirstOrder
end HautevilleHouse
