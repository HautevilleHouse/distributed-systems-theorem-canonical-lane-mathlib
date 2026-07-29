import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure FLPImpossibilityPackage where
  asynchronousModel : Prop
  failureModel : Prop
  deterministicProcesses : Prop
  consensusRequirement : Prop
  impossibilityProof : Prop

structure FLPImpossibilityEvidence (F : FLPImpossibilityPackage) where
  asynchronousModelClosed : F.asynchronousModel
  failureModelClosed : F.failureModel
  deterministicProcessesClosed : F.deterministicProcesses
  consensusRequirementClosed : F.consensusRequirement
  impossibilityProofClosed : F.impossibilityProof

def FLPImpossibilityClosed (F : FLPImpossibilityPackage) : Prop :=
  F.asynchronousModel ∧ F.failureModel ∧
  F.deterministicProcesses ∧ F.consensusRequirement ∧ F.impossibilityProof

theorem flp_impossibility_closed_from_evidence (F : FLPImpossibilityPackage)
    (E : FLPImpossibilityEvidence F) : FLPImpossibilityClosed F := by
  exact And.intro E.asynchronousModelClosed
    (And.intro E.failureModelClosed
      (And.intro E.deterministicProcessesClosed
        (And.intro E.consensusRequirementClosed E.impossibilityProofClosed)))

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse