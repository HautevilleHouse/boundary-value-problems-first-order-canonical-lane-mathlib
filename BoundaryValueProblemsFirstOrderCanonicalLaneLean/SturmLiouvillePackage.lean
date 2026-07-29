import HautevilleHouse.BoundaryValueProblemsFirstOrderCanonicalLaneLean.FirstOrderLinearBVPPackage

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure SturmLiouvillePackage {A : BVPAdmittedObject}
    (P : FirstOrderLinearBVPPackage A) where
  selfAdjointOperator : Prop
  eigenfunctionExpansion : Prop
  spectralTheorem : Prop
  orthogonalityRelation : Prop
  convergenceInMean : Prop

structure SturmLiouvilleEvidence {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (S : SturmLiouvillePackage P) where
  selfAdjointOperatorClosed : S.selfAdjointOperator
  eigenfunctionExpansionClosed : S.eigenfunctionExpansion
  spectralTheoremClosed : S.spectralTheorem
  orthogonalityRelationClosed : S.orthogonalityRelation
  convergenceInMeanClosed : S.convergenceInMean

def SturmLiouvilleClosed {A : BVPAdmittedObject}
    {P : FirstOrderLinearBVPPackage A} (S : SturmLiouvillePackage P) : Prop :=
  S.selfAdjointOperator ∧ S.eigenfunctionExpansion ∧
  S.spectralTheorem ∧ S.orthogonalityRelation ∧ S.convergenceInMean

theorem sturm_liouville_closed_from_evidence
    {A : BVPAdmittedObject} {P : FirstOrderLinearBVPPackage A}
    (S : SturmLiouvillePackage P) (E : SturmLiouvilleEvidence S) :
    SturmLiouvilleClosed S := by
  exact And.intro E.selfAdjointOperatorClosed
    (And.intro E.eigenfunctionExpansionClosed
      (And.intro E.spectralTheoremClosed
        (And.intro E.orthogonalityRelationClosed E.convergenceInMeanClosed)))

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse
