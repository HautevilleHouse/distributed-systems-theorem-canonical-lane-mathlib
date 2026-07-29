import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure PaxosProtocolPackage where
  proposerCount : Nat
  acceptorCount : Nat
  leaderSelection : Prop
  quorumIntersection : Prop
  persistentStorage : Prop
  majoritySetSize : Nat
  boundOnRounds : Prop
  allNonByzantine : Prop

structure PaxosProtocolEvidence (P : PaxosProtocolPackage) where
  leaderSelectionClosed : P.leaderSelection
  quorumIntersectionClosed : P.quorumIntersection
  persistentStorageClosed : P.persistentStorage
  boundOnRoundsClosed : P.boundOnRounds
  allNonByzantineClosed : P.allNonByzantine

def PaxosProtocolClosed (P : PaxosProtocolPackage) : Prop :=
  P.leaderSelection ∧ P.quorumIntersection ∧
  P.persistentStorage ∧ P.boundOnRounds ∧ P.allNonByzantine

theorem paxos_protocol_closed_from_evidence (P : PaxosProtocolPackage)
    (E : PaxosProtocolEvidence P) : PaxosProtocolClosed P := by
  exact And.intro E.leaderSelectionClosed
    (And.intro E.quorumIntersectionClosed
      (And.intro E.persistentStorageClosed
        (And.intro E.boundOnRoundsClosed E.allNonByzantineClosed)))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse