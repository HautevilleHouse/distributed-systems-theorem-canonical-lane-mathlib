import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ConsensusProtocolPackage where
  networkTopology : Prop
  faultModel : Prop
  agreement : Prop
  validity : Prop
  termination : Prop

structure ConsensusProtocolEvidence (P : ConsensusProtocolPackage) where
  networkTopologyClosed : P.networkTopology
  faultModelClosed : P.faultModel
  agreementClosed : P.agreement
  validityClosed : P.validity
  terminationClosed : P.termination

def ConsensusProtocolClosed (P : ConsensusProtocolPackage) : Prop :=
  P.networkTopology ∧ P.faultModel ∧ P.agreement ∧ P.validity ∧ P.termination

theorem consensus_protocol_closed_from_evidence (P : ConsensusProtocolPackage) (E : ConsensusProtocolEvidence P) : ConsensusProtocolClosed P := by
  exact And.intro E.networkTopologyClosed (And.intro E.faultModelClosed (And.intro E.agreementClosed (And.intro E.validityClosed E.terminationClosed)))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse