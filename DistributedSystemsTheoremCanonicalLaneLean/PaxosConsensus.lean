import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure PaxosConsensusPackage where
  proposerRole : Prop
  acceptorRole : Prop
  learnerRole : Prop
  quorumIntersection : Prop
  leaderElection : Prop
  consensusSafety : Prop
  consensusLiveness : Prop

structure PaxosConsensusEvidence (P : PaxosConsensusPackage) where
  proposerRoleClosed : P.proposerRole
  acceptorRoleClosed : P.acceptorRole
  learnerRoleClosed : P.learnerRole
  quorumIntersectionClosed : P.quorumIntersection
  leaderElectionClosed : P.leaderElection
  consensusSafetyClosed : P.consensusSafety
  consensusLivenessClosed : P.consensusLiveness

def PaxosConsensusClosed (P : PaxosConsensusPackage) : Prop :=
  P.proposerRole ∧ P.acceptorRole ∧ P.learnerRole ∧ P.quorumIntersection ∧ P.leaderElection ∧ P.consensusSafety ∧ P.consensusLiveness

theorem paxos_consensus_closed_from_evidence (P : PaxosConsensusPackage) (E : PaxosConsensusEvidence P) : PaxosConsensusClosed P := by
  exact And.intro E.proposerRoleClosed (And.intro E.acceptorRoleClosed (And.intro E.learnerRoleClosed (And.intro E.quorumIntersectionClosed (And.intro E.leaderElectionClosed (And.intro E.consensusSafetyClosed E.consensusLivenessClosed)))))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse