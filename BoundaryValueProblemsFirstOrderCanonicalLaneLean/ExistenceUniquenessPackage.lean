import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrder

structure ExistenceUniquenessPackage where
  differentialEquation : ℝ → ℝ → ℝ
  boundaryCondition : ℝ × ℝ
  interval : Set ℝ
  lipschitzCondition : Prop
  existenceClaim : Prop
  uniquenessClaim : Prop
  existenceProof : existenceClaim
  uniquenessProof : uniquenessClaim

structure ExistenceUniquenessEvidence (E : ExistenceUniquenessPackage) where
  lipschitzConditionClosed : E.lipschitzCondition
  existenceClosed : E.existenceClaim
  uniquenessClosed : E.uniquenessClaim

def ExistenceUniquenessClosed (E : ExistenceUniquenessPackage) : Prop :=
  E.lipschitzCondition ∧ E.existenceClaim ∧ E.uniquenessClaim

theorem existence_uniqueness_closed_from_evidence
    (E : ExistenceUniquenessPackage) (Ev : ExistenceUniquenessEvidence E) :
    ExistenceUniquenessClosed E := by
  exact And.intro Ev.lipschitzConditionClosed
    (And.intro Ev.existenceClosed Ev.uniquenessClosed)

end BoundaryValueProblemsFirstOrder
end HautevilleHouse
