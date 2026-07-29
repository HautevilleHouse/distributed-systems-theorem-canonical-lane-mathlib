import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure NodeState where
  value : Prop
  decision : Prop
  term : Nat

def nodeDecided (s : NodeState) : Prop := s.decision

structure ConsensusProtocolPackage where
  nodes : List NodeState
  majorityDecided : Prop
  agreementReached : Prop
  terminationCondition : Prop

structure ConsensusProtocolEvidence (P : ConsensusProtocolPackage) where
  majorityDecidedClosed : P.majorityDecided
  agreementReachedClosed : P.agreementReached
  terminationConditionClosed : P.terminationCondition

def ConsensusProtocolClosed (P : ConsensusProtocolPackage) : Prop :=
  P.majorityDecided ∧ P.agreementReached ∧ P.terminationCondition

theorem consensus_protocol_closed_from_evidence (P : ConsensusProtocolPackage)
    (E : ConsensusProtocolEvidence P) : ConsensusProtocolClosed P := by
  exact And.intro E.majorityDecidedClosed
    (And.intro E.agreementReachedClosed E.terminationConditionClosed)

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse