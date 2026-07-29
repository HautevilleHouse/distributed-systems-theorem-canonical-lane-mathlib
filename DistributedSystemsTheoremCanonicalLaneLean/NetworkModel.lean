import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.ByzantineAgreement

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure NetworkModelPackage {C : ConsensusProtocolPackage}
    {F : FaultTolerancePackage C}
    {B : ByzantineAgreementPackage C F} where
  partialSynchronyGST : Prop
  networkPartitionResilience : Prop
  messageDeliveryGuarantee : Prop
  fairnessAssumption : Prop

def NetworkModelClosed {C : ConsensusProtocolPackage}
    {F : FaultTolerancePackage C}
    {B : ByzantineAgreementPackage C F}
    (N : NetworkModelPackage C F B) : Prop :=
  N.partialSynchronyGST ∧ N.networkPartitionResilience ∧ N.messageDeliveryGuarantee ∧ N.fairnessAssumption

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse