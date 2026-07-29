import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.FaultTolerance

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ByzantineAgreementPackage {C : ConsensusProtocolPackage}
    {F : FaultTolerancePackage C} where
  signedMessages : Prop
  authenticationCrypto : Prop
  viewChangeProtocol : Prop
  leaderRotation : Prop
  commitQuorum : Nat
  preparedCertificate : Prop

structure ByzantineAgreementEvidence {C : ConsensusProtocolPackage}
    {F : FaultTolerancePackage C}
    (B : ByzantineAgreementPackage C F) where
  signedMessagesClosed : B.signedMessages
  authenticationCryptoClosed : B.authenticationCrypto
  viewChangeProtocolClosed : B.viewChangeProtocol
  leaderRotationClosed : B.leaderRotation
  commitQuorumClosed : B.commitQuorum = 2 * (F.faultThreshold : ℕ) + 1
  preparedCertificateClosed : B.preparedCertificate

def ByzantineAgreementClosed {C : ConsensusProtocolPackage}
    {F : FaultTolerancePackage C}
    (B : ByzantineAgreementPackage C F) : Prop :=
  B.signedMessages ∧ B.authenticationCrypto ∧ B.viewChangeProtocol ∧ B.leaderRotation ∧
  (B.commitQuorum = 2 * (F.faultThreshold : ℕ) + 1) ∧ B.preparedCertificate

theorem byzantine_agreement_closed_from_evidence
    {C : ConsensusProtocolPackage} {F : FaultTolerancePackage C}
    (B : ByzantineAgreementPackage C F) (E : ByzantineAgreementEvidence B) :
    ByzantineAgreementClosed B := by
  exact And.intro E.signedMessagesClosed
    (And.intro E.authenticationCryptoClosed
      (And.intro E.viewChangeProtocolClosed
        (And.intro E.leaderRotationClosed
          (And.intro E.commitQuorumClosed E.preparedCertificateClosed))))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse