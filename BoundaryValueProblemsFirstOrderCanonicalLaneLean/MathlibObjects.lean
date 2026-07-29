import BoundaryValueProblemsFirstOrderCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace BoundaryValueProblemsFirstOrderCanonicalLaneLean

structure BVPSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure BVPAdmittedObject where
  space : BVPSpace
  firstOrder : Prop
  boundaryCondition : Prop
  solution : Type
  solutionTopology : TopologicalSpace solution
  existence : Prop
  conclusion : existence

structure BVPEndgameState where
  object : BVPAdmittedObject

def BVPWitnessClosed (O : BVPAdmittedObject) : Prop :=
  O.existence

end BoundaryValueProblemsFirstOrderCanonicalLaneLean
end HautevilleHouse