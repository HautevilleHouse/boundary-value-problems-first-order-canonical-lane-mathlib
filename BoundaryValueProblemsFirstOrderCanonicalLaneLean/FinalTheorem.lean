import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

def ConstrainedBVPClosure (A : BVPAdmittedObject) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem bvp_endgame (A : BVPAdmittedObject) : ConstrainedBVPClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
