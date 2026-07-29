import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure ExistenceUniquenessPackage (B : BoundaryValueProblem) where
  existence : Prop
  uniqueness : Prop
  continuousDependence : Prop

structure ExistenceUniquenessEvidence (B : BoundaryValueProblem)
    (E : ExistenceUniquenessPackage B) where
  existenceClosed : E.existence
  uniquenessClosed : E.uniqueness
  continuousDependenceClosed : E.continuousDependence

def ExistenceUniquenessClosed (B : BoundaryValueProblem)
    (E : ExistenceUniquenessPackage B) : Prop :=
  E.existence ∧ E.uniqueness ∧ E.continuousDependence

theorem existence_uniqueness_closed_from_evidence (B : BoundaryValueProblem)
    (E : ExistenceUniquenessPackage B) (Ev : ExistenceUniquenessEvidence B E) :
    ExistenceUniquenessClosed B E :=
  by
    exact And.intro Ev.existenceClosed
      (And.intro Ev.uniquenessClosed Ev.continuousDependenceClosed)

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
