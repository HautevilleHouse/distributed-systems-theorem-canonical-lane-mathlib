import canonicalLaneMathlib.AdmissibleClass
import DistributedSystemsTheoremCanonicalLaneLean.BridgeLemmas
import DistributedSystemsTheoremCanonicalLaneLean.GateLemmas

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

def DistributedSystemsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem distributed_systems_endgame (A : AdmissibleClass) :
    DistributedSystemsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse