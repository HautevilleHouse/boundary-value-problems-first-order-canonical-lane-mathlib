import BoundaryValueProblemsFirstOrderCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

def bvpProjection : Projection BVPEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem bvp_projection_idempotent (x : BVPEndgameState) :
    bvpProjection.toFun (bvpProjection.toFun x) = bvpProjection.toFun x := by
  exact bvpProjection.idempotent x

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse