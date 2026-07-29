import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.ConsensusProtocol

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure FaultTolerancePackage {C : ConsensusProtocolPackage} where
  byzantineFaultModel : Prop
  crashFaultModel : Prop
  faultThreshold : Nat
  fPlusOneNodes : Nat
  asynchronousNetwork : Prop
  partialSynchrony : Prop

structure FaultToleranceEvidence {C : ConsensusProtocolPackage} (F : FaultTolerancePackage C) where
  byzantineFaultModelClosed : F.byzantineFaultModel
  crashFaultModelClosed : F.crashFaultModel
  faultThresholdClosed : F.faultThreshold = F.fPlusOneNodes - 1
  asynchronousNetworkClosed : F.asynchronousNetwork
  partialSynchronyClosed : F.partialSynchrony

def FaultToleranceClosed {C : ConsensusProtocolPackage} (F : FaultTolerancePackage C) : Prop :=
  F.byzantineFaultModel ∧ F.crashFaultModel ∧ F.faultThreshold = F.fPlusOneNodes - 1 ∧ F.asynchronousNetwork ∧ F.partialSynchrony

theorem fault_tolerance_closed_from_evidence
    {C : ConsensusProtocolPackage} (F : FaultTolerancePackage C)
    (E : FaultToleranceEvidence F) : FaultToleranceClosed F := by
  exact And.intro E.byzantineFaultModelClosed
    (And.intro E.crashFaultModelClosed
      (And.intro E.faultThresholdClosed
        (And.intro E.asynchronousNetworkClosed E.partialSynchronyClosed)))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse