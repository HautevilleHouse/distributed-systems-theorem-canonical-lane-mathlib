import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.DistributedTimeDomain

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ChainReplication (T : DistributedTimeDomain) where
  Head : Type
  Tail : Type
  replicationChain : Prop
  readAvailability : Prop
  writeEfficiency : Prop
  replicationChainTerm : replicationChain
  readAvailabilityTerm : readAvailability
  writeEfficiencyTerm : writeEfficiency

structure ChainReplicationEvidence {T : DistributedTimeDomain} (C : ChainReplication T) where
  chainClosed : C.replicationChain
  readClosed : C.readAvailability
  writeClosed : C.writeEfficiency

def ChainReplicationClosed {T : DistributedTimeDomain} (C : ChainReplication T) : Prop :=
  C.replicationChain ∧ C.readAvailability ∧ C.writeEfficiency

theorem chain_replication_closed_from_evidence {T : DistributedTimeDomain} (C : ChainReplication T) (E : ChainReplicationEvidence C) : ChainReplicationClosed C := by
  exact And.intro E.chainClosed (And.intro E.readClosed E.writeClosed)

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
