import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BVWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse