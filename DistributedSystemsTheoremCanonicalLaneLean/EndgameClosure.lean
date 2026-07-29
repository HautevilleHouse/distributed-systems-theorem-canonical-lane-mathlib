import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.DistributedSystemsObjects
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.ConsensusProtocol
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.FaultTolerance
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.ByzantineAgreement
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.NetworkModel

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure DistributedSystemConstrainedClosure where
  consensus : ConsensusProtocolPackage
  consensusEvidence : ConsensusProtocolEvidence consensus
  faultTolerance : FaultTolerancePackage consensus
  faultToleranceEvidence : FaultToleranceEvidence faultTolerance
  byzantineAgreement : ByzantineAgreementPackage consensus faultTolerance
  byzantineAgreementEvidence : ByzantineAgreementEvidence byzantineAgreement
  networkModel : NetworkModelPackage consensus faultTolerance byzantineAgreement
  networkModelClosed : NetworkModelClosed networkModel

def DistributedSystemClosureClosed (D : DistributedSystemConstrainedClosure) : Prop :=
  ConsensusProtocolClosed D.consensus ∧
  FaultToleranceClosed D.faultTolerance ∧
  ByzantineAgreementClosed D.byzantineAgreement ∧
  NetworkModelClosed D.networkModel

theorem distributed_system_closure_closed_from_evidence
    (D : DistributedSystemConstrainedClosure) :
    DistributedSystemClosureClosed D := by
  exact And.intro (consensus_protocol_closed_from_evidence D.consensus D.consensusEvidence)
    (And.intro (fault_tolerance_closed_from_evidence D.faultTolerance D.faultToleranceEvidence)
      (And.intro (byzantine_agreement_closed_from_evidence D.byzantineAgreement D.byzantineAgreementEvidence)
        D.networkModelClosed))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse