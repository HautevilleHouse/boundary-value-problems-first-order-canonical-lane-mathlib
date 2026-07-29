import BoundaryValueProblemsFirstOrderCanonical.InitialValueProblem

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonical

inductive BoundaryType where
  | dirichlet
  | neumann
  | robin

def BoundaryCondition (a b : ℝ) (type : BoundaryType) : Set (ℝ -> ℝ) := by
  cases type with
  | dirichlet => exact {f : ℝ -> ℝ | f a = 0 ∧ f b = 0}
  | neumann => exact {f : ℝ -> ℝ | deriv f a = 0 ∧ deriv f b = 0}
  | robin => exact {f : ℝ -> ℝ | deriv f a + f a = 0 ∧ deriv f b + f b = 0}

theorem boundary_condition_nonempty (a b : ℝ) (type : BoundaryType) : (BoundaryCondition a b type).Nonempty := by
  cases type with
  | dirichlet => refine ⟨fun _ => 0, ?_⟩; simp
  | neumann => refine ⟨fun _ => 1, ?_⟩; simp
  | robin => refine ⟨fun x => exp (-x), ?_⟩; simp [deriv_exp]

end BoundaryValueProblemsFirstOrderCanonical
end HautevilleHouse