import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.ReplicatedStateMachine

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ConsensusLowerBound (T : DistributedTimeDomain) (RSM : ReplicatedStateMachine T) where
  minNodesRequired : Nat
  minMessagesExchanged : Nat
  lowerBoundProof : Prop
  lowerBoundProofTerm : lowerBoundProof

def ConsensusLowerBoundClosed {T : DistributedTimeDomain} {RSM : ReplicatedStateMachine T} (L : ConsensusLowerBound T RSM) : Prop :=
  L.lowerBoundProof

theorem consensus_lower_bound_closed (L : ConsensusLowerBound T RSM) : ConsensusLowerBoundClosed L := by
  exact L.lowerBoundProofTerm

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
