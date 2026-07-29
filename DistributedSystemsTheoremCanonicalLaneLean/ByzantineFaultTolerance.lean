import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ByzantineFaultTolerance where
  totalNodes : Nat
  faultyNodes : Nat
  synchronousMode : Prop
  digitalSignatures : Prop
  authenticationAvailable : Prop
  broadcastModel : Prop

structure ByzantineFaultToleranceEvidence (B : ByzantineFaultTolerance) where
  synchronousModeClosed : B.synchronousMode
  digitalSignaturesClosed : B.digitalSignatures
  authenticationAvailableClosed : B.authenticationAvailable
  broadcastModelClosed : B.broadcastModel

def ByzantineFaultToleranceClosed (B : ByzantineFaultTolerance) : Prop :=
  B.synchronousMode ∧ B.digitalSignatures ∧
  B.authenticationAvailable ∧ B.broadcastModel

theorem byzantine_fault_tolerance_closed_from_evidence (B : ByzantineFaultTolerance)
    (E : ByzantineFaultToleranceEvidence B) : ByzantineFaultToleranceClosed B := by
  exact And.intro E.synchronousModeClosed
    (And.intro E.digitalSignaturesClosed
      (And.intro E.authenticationAvailableClosed E.broadcastModelClosed))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse