import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure DistributedTransactionsPackage where
  transactions : Type u
  consistencyModel : Type v
  serializability : Prop
  isolation : Prop
  durability : Prop
  atomicCommit : Prop

structure DistributedTransactionsEvidence (D : DistributedTransactionsPackage) where
  serializabilityClosed : D.serializability
  isolationClosed : D.isolation
  durabilityClosed : D.durability
  atomicCommitClosed : D.atomicCommit

def DistributedTransactionsClosed (D : DistributedTransactionsPackage) : Prop :=
  D.serializability ∧ D.isolation ∧ D.durability ∧ D.atomicCommit

theorem distributed_transactions_closed_from_evidence (D : DistributedTransactionsPackage) (E : DistributedTransactionsEvidence D) : DistributedTransactionsClosed D := by
  exact And.intro E.serializabilityClosed (And.intro E.isolationClosed (And.intro E.durabilityClosed E.atomicCommitClosed))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse