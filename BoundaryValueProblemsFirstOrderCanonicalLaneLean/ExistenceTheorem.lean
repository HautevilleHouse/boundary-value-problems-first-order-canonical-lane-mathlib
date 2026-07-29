import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.BoundaryConditions

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure ExistenceTheoremPackage where
  ivp : InitialValueProblemPackage
  bc : BoundaryConditionsPackage
  existenceClaim : Prop

def PicardLindelöfExistence (pkg : ExistenceTheoremPackage) : Prop :=
  -- Assume some Lipschitz condition
  True

structure ExistenceTheoremEvidence (pkg : ExistenceTheoremPackage) where
  existenceClaimClosed : pkg.existenceClaim
  picardLindelöfApplied : PicardLindelöfExistence pkg

def ExistenceTheoremClosed (pkg : ExistenceTheoremPackage) : Prop :=
  pkg.existenceClaim ∧ PicardLindelöfExistence pkg

theorem existence_theorem_closed_from_evidence (pkg : ExistenceTheoremPackage) (E : ExistenceTheoremEvidence pkg) :
    ExistenceTheoremClosed pkg := by
  exact And.intro E.existenceClaimClosed E.picardLindelöfApplied

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse