import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure ShootingMethodPackage where
  ivpSolver : Type u
  rootFinding : Prop
  convergence : Prop
  uniquenessGuarantee : Prop

structure ShootingMethodEvidence (S : ShootingMethodPackage) where
  rootFindingClosed : S.rootFinding
  convergenceClosed : S.convergence
  uniquenessGuaranteeClosed : S.uniquenessGuarantee

def ShootingMethodClosed (S : ShootingMethodPackage) : Prop :=
  S.rootFinding ∧ S.convergence ∧ S.uniquenessGuarantee

theorem shooting_method_closed_from_evidence (S : ShootingMethodPackage) (E : ShootingMethodEvidence S) :
    ShootingMethodClosed S := by
  exact And.intro E.rootFindingClosed (And.intro E.convergenceClosed E.uniquenessGuaranteeClosed)

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse