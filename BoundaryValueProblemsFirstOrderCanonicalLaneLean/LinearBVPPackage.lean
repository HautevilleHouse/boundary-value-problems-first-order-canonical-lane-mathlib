import BoundaryValueProblemsFirstOrderCanonicalLaneLean.MathlibObjects

/-!
# Linear BVP Package
-/

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure LinearBVPPackage (B : BVPSpace) where
  linearOperator : Prop
  homogeneousSolution : Type
  particularSolution : Prop
  fredholmAlternative : Prop

structure LinearBVPEvidence (B : BVPSpace) (L : LinearBVPPackage B) where
  linearOperatorClosed : L.linearOperator
  homogeneousSolutionClosed : L.homogeneousSolution
  particularSolutionClosed : L.particularSolution
  fredholmAlternativeClosed : L.fredholmAlternative

def LinearBVPClosed (B : BVPSpace) (L : LinearBVPPackage B) : Prop :=
  L.linearOperator ∧ L.homogeneousSolution ∧ L.particularSolution ∧ L.fredholmAlternative

theorem linear_bvp_closed_from_evidence (B : BVPSpace) (L : LinearBVPPackage B) (E : LinearBVPEvidence B L) : LinearBVPClosed B L := by
  exact And.intro E.linearOperatorClosed (And.intro E.homogeneousSolutionClosed (And.intro E.particularSolutionClosed E.fredholmAlternativeClosed))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse