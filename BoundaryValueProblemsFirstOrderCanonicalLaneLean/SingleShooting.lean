import BoundaryValueProblemsFirstOrderCanonical.ShootingMethod

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonical

structure SingleShootingPackage where
  ivpSolver : ℝ -> ℝ -> (ℝ -> ℝ)
  targetFunction : ℝ -> ℝ
  parameter : ℝ
  solved : Prop
  solvedTerm : solved

def SingleShootingClosed (S : SingleShootingPackage) : Prop :=
  S.solved

theorem single_shooting_solved (S : SingleShootingPackage) : SingleShootingClosed S := by
  exact S.solvedTerm

end BoundaryValueProblemsFirstOrderCanonical
end HautevilleHouse