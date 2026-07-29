import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure RaftConsensusAlgorithm where
  leaderElectionMechanism : Prop
  logReplication : Prop
  safetyProperty : Prop
  livenessProperty : Prop
  termConcept : Prop
  quorumSize : Nat
  allNonByzantine : Prop
  stateMachineModel : Prop

structure RaftConsensusEvidence (R : RaftConsensusAlgorithm) where
  leaderElectionMechanismClosed : R.leaderElectionMechanism
  logReplicationClosed : R.logReplication
  safetyPropertyClosed : R.safetyProperty
  livenessPropertyClosed : R.livenessProperty
  termConceptClosed : R.termConcept
  stateMachineModelClosed : R.stateMachineModel

def RaftConsensusClosed (R : RaftConsensusAlgorithm) : Prop :=
  R.leaderElectionMechanism ∧ R.logReplication ∧
  R.safetyProperty ∧ R.livenessProperty ∧
  R.termConcept ∧ R.stateMachineModel

theorem raft_consensus_closed_from_evidence (R : RaftConsensusAlgorithm)
    (E : RaftConsensusEvidence R) : RaftConsensusClosed R := by
  exact And.intro E.leaderElectionMechanismClosed
    (And.intro E.logReplicationClosed
      (And.intro E.safetyPropertyClosed
        (And.intro E.livenessPropertyClosed
          (And.intro E.termConceptClosed E.stateMachineModelClosed))))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse