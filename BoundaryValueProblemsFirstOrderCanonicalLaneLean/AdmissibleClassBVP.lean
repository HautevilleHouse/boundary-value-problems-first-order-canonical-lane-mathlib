import canonicalLaneMathlib.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure BVPAdmittedObject where
  carrier : Type
  topology : TopologicalSpace carrier
  interval : Set ℝ
  differentialOperator : (ℝ → carrier) → (ℝ → carrier)
  boundaryCondition : (carrier → carrier) → Prop
  solutionExists : Prop
  conclusion : solutionExists

def BVPConsistency (O : BVPAdmittedObject) : Prop :=
  O.solutionExists

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
