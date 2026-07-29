import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.ConsensusProtocolModel

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure FaultModel where
  crashRecovery : Prop
  byzantineFaults : Prop
  networkPartition : Prop

structure FaultTolerancePackage (P : ConsensusProtocolPackage) where
  crashRecoveryTolerant : Prop
  byzantineTolerant : Prop
  partitionTolerant : Prop
  evidenceCrashRecovery : crashRecoveryTolerant
  evidenceByzantine : byzantineTolerant
  evidencePartition : partitionTolerant

def FaultToleranceClosed (P : ConsensusProtocolPackage) (F : FaultTolerancePackage P) : Prop :=
  F.crashRecoveryTolerant ∧ F.byzantineTolerant ∧ F.partitionTolerant

theorem fault_tolerance_closed_from_evidence (P : ConsensusProtocolPackage)
    (F : FaultTolerancePackage P) : FaultToleranceClosed P F := by
  exact And.intro F.evidenceCrashRecovery
    (And.intro F.evidenceByzantine F.evidencePartition)

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse