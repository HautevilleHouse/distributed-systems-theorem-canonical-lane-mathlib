import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure DistributedSystemSpace where
  carrier : Type
  topology : TopologicalSpace carrier

structure DistributedAdmittedObject where
  system : DistributedSystemSpace
  consensusAchievable : Prop
  faultTolerance : Prop
  networkModel : Type
  networkTopology : TopologicalSpace networkModel
  byzantineResilient : Prop
  conclusion : byzantineResilient

structure DistributedEndgameState where
  object : DistributedAdmittedObject

def DistributedWitnessClosed (O : DistributedAdmittedObject) : Prop :=
  O.byzantineResilient

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse