import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.DistributedTimeDomain

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ReplicatedStateMachine (T : DistributedTimeDomain) where
  State : Type
  Command : Type
  initial : State
  apply : State → Command → State
  consensusAlgorithm : Type
  safetyCondition : Prop
  livenessCondition : Prop

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
