import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure ConsensusFramework where
  nodeCount : Nat
  faultThreshold : Nat
  networkModel : Prop
  synchronyAssumption : Prop
  agreementProperty : Prop
  validityProperty : Prop
  terminationProperty : Prop

structure ConsensusFrameworkEvidence (C : ConsensusFramework) where
  networkModelClosed : C.networkModel
  synchronyAssumptionClosed : C.synchronyAssumption
  agreementPropertyClosed : C.agreementProperty
  validityPropertyClosed : C.validityProperty
  terminationPropertyClosed : C.terminationProperty

def ConsensusFrameworkClosed (C : ConsensusFramework) : Prop :=
  C.networkModel ∧ C.synchronyAssumption ∧
  C.agreementProperty ∧ C.validityProperty ∧ C.terminationProperty

theorem consensus_framework_closed_from_evidence (C : ConsensusFramework)
    (E : ConsensusFrameworkEvidence C) : ConsensusFrameworkClosed C := by
  exact And.intro E.networkModelClosed
    (And.intro E.synchronyAssumptionClosed
      (And.intro E.agreementPropertyClosed
        (And.intro E.validityPropertyClosed E.terminationPropertyClosed)))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse