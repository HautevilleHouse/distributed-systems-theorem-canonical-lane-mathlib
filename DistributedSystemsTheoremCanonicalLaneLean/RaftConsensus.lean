import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.ReplicatedStateMachine

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure RaftConsensus {T : DistributedTimeDomain} (RSM : ReplicatedStateMachine T) where
  leaderElection : Prop
  logReplication : Prop
  safety : RSM.safetyCondition
  liveness : RSM.livenessCondition
  leaderElectionTerm : leaderElection
  logReplicationTerm : logReplication

structure RaftConsensusEvidence {T : DistributedTimeDomain} {RSM : ReplicatedStateMachine T} (R : RaftConsensus RSM) where
  safetyClosed : R.safety
  livenessClosed : R.liveness

def RaftConsensusClosed {T : DistributedTimeDomain} {RSM : ReplicatedStateMachine T} (R : RaftConsensus RSM) : Prop :=
  R.safety ∧ R.liveness

theorem raft_consensus_closed_from_evidence {T : DistributedTimeDomain} {RSM : ReplicatedStateMachine T} (R : RaftConsensus RSM) (E : RaftConsensusEvidence R) : RaftConsensusClosed R := by
  exact And.intro E.safetyClosed E.livenessClosed

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
