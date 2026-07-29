import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.DistributedTimeDomain

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure PaxosFramework (T : DistributedTimeDomain) where
  Proposer : Type
  Acceptor : Type
  Learner : Type
  preparePhase : Prop
  acceptPhase : Prop
  consensusGuarantee : Prop
  preparePhaseTerm : preparePhase
  acceptPhaseTerm : acceptPhase

structure PaxosFrameworkEvidence {T : DistributedTimeDomain} (P : PaxosFramework T) where
  consensusGuaranteeClosed : P.consensusGuarantee

def PaxosFrameworkClosed {T : DistributedTimeDomain} (P : PaxosFramework T) : Prop :=
  P.consensusGuarantee

theorem paxos_framework_closed_from_evidence {T : DistributedTimeDomain} (P : PaxosFramework T) (E : PaxosFrameworkEvidence P) : PaxosFrameworkClosed P := by
  exact E.consensusGuaranteeClosed

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
