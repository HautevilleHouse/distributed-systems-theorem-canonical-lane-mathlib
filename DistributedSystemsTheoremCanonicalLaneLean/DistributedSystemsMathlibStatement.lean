import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.DistributedSystemsTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure MathlibProofObligation where
  sourceKey : String
  theoremObject : String
  commonCoreImported : Bool
  theoremSpecificDefinitionsNative : Bool
  theoremSpecificBridgeNative : Bool
  theoremSpecificAdmittedClosureNative : Bool
  unrestrictedClassicalClosureNative : Bool
  carriedGap : String

def mathlibProofObligation : MathlibProofObligation := {
  sourceKey := "distributed-systems-canonical-lane",
  theoremObject := "Byzantine fault tolerance consensus existence",
  commonCoreImported := true,
  theoremSpecificDefinitionsNative := true,
  theoremSpecificBridgeNative := true,
  theoremSpecificAdmittedClosureNative := true,
  unrestrictedClassicalClosureNative := false,
  carriedGap := "theorem-specific endgame pilot closes over the admitted class; unrestricted classical closure remains carried"
}

def theoremSpecificEndgamePilotClosed : Prop :=
  forall A : AdmissibleClass, ConstrainedDistributedSystemsClosure A

theorem theorem_specific_endgame_pilot_checked :
    theoremSpecificEndgamePilotClosed := by
  intro A
  exact constrained_distributed_systems_endgame A

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse