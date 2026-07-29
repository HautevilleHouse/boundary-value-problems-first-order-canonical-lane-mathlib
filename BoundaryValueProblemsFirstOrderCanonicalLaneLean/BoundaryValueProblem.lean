import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure FirstOrderBVPPackage where
  interval : Type u
  odesystem : Type v
  boundaryConditions : Type w
  wellPosedness : Prop
  stability : Prop

structure FirstOrderBVPEvidence (B : FirstOrderBVPPackage) where
  wellPosednessClosed : B.wellPosedness
  stabilityClosed : B.stability

def FirstOrderBVPClosed (B : FirstOrderBVPPackage) : Prop :=
  B.wellPosedness ∧ B.stability

theorem first_order_bvp_closed_from_evidence (B : FirstOrderBVPPackage) (E : FirstOrderBVPEvidence B) :
    FirstOrderBVPClosed B := by
  exact And.intro E.wellPosednessClosed E.stabilityClosed

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse