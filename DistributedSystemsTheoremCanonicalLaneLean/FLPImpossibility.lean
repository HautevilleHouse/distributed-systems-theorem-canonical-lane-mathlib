import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure FLPImpossibilityPackage where
  asynchronousModel : Prop
  crashFailures : Prop
  consensusImpossible : Prop
  bivalenceArgument : Prop

structure FLPImpossibilityEvidence (F : FLPImpossibilityPackage) where
  asynchronousModelClosed : F.asynchronousModel
  crashFailuresClosed : F.crashFailures
  consensusImpossibleClosed : F.consensusImpossible
  bivalenceArgumentClosed : F.bivalenceArgument

def FLPImpossibilityClosed (F : FLPImpossibilityPackage) : Prop :=
  F.asynchronousModel ∧ F.crashFailures ∧ F.consensusImpossible ∧ F.bivalenceArgument

theorem flp_impossibility_closed_from_evidence (F : FLPImpossibilityPackage) (E : FLPImpossibilityEvidence F) : FLPImpossibilityClosed F := by
  exact And.intro E.asynchronousModelClosed (And.intro E.crashFailuresClosed (And.intro E.consensusImpossibleClosed E.bivalenceArgumentClosed))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse