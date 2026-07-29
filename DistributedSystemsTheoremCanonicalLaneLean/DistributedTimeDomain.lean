import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DistributedSystemsTheoremCanonicalLaneLean

structure DistributedTimeDomain where
  Time : Type
  start : Time
  le : Time → Time → Prop
  intervalTopology : Prop
  hasInitialTime : Prop
  locallyFiniteBreakSet : Prop
  intervalTopologyTerm : intervalTopology
  hasInitialTimeTerm : hasInitialTime
  locallyFiniteBreakSetTerm : locallyFiniteBreakSet

end DistributedSystemsTheoremCanonicalLaneLean
end HautevilleHouse
