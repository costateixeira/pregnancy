// ═══════════════════════════════════════════════════════════════════════════════
//  Pregnancy Status Bundle — administrative sharing of pregnancy status as a
//  collection Bundle of BeClinicalObservations.
//
//  Bundle.entry is sliced by resource type and then by resource.code. Under a
//  type-pinned slice the snapshot generator DOES expand the resource, so each
//  slice fixes its code, value[x] type and prohibits the irrelevant elements —
//  no per-type StructureDefinition and no invariants needed.
//
//  The per-code Observation profiles elsewhere in this IG are illustrative only and
//  are expected to be REMOVED in the federal guidance.
//
//  Scope: pregnancy status is for ADMINISTRATIVE sharing, NOT clinical care. For
//  clinical care the pregnancy is more commonly represented as a Condition.
// ═══════════════════════════════════════════════════════════════════════════════

Alias: $BeClinObs = https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation
Alias: $LOINC     = http://loinc.org
Alias: $SCT       = http://snomed.info/sct

Profile:     BePregnancyStatusBundle
Parent:      Bundle
Id:          be-pregnancy-status-bundle
Title:       "Pregnancy Status Bundle (administrative)"
Description: """
A `collection` Bundle for **administrative sharing** of a pregnancy status — a
Bundle of `BeClinicalObservation`s.

It carries **exactly one** pregnancy status observation (LOINC `82810-3`, value
`CodeableConcept` as in IPS), which groups its detail observations via
`Observation.hasMember`, and **optionally one of each** detail observation:
estimated date of delivery (LOINC `11778-8`, value `dateTime` as in IPS), expected
number of children (LOINC `11640-0`, value `integer`) and actual end of pregnancy
(SNOMED `289251005`, value `dateTime`). Codes are **fixed values**, not bindings.
`bodySite`, `component`, `specimen`, `referenceRange`, `device`, `method` and
`interpretation` are not used.

**This Bundle is the model.** There is no StructureDefinition per type of
`BeClinicalObservation`; entries are distinguished by their code. (The per-code
Observation profiles currently in this IG are illustrative and are expected to be
removed in the federal guidance.) Pregnancy status is for administrative sharing,
**not clinical care**; for clinical care the pregnancy is more commonly represented
as a `Condition` (see [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.html)).
"""

* type = #collection
* entry 1..*
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.discriminator[1].type = #pattern
* entry ^slicing.discriminator[1].path = "resource.code"
* entry ^slicing.rules = #open
* entry contains
    pregnancyStatus 1..1 MS and
    estimatedDateOfDelivery 0..1 MS and
    expectedNumberOfChildren 0..1 MS and
    endOfPregnancyDate 0..1 MS

// ── Pregnancy status (groups the details via hasMember) ──
* entry[pregnancyStatus].resource only $BeClinObs
* entry[pregnancyStatus].resource.code = $LOINC#82810-3
* entry[pregnancyStatus].resource.value[x] only CodeableConcept
* entry[pregnancyStatus].resource.hasMember MS
* entry[pregnancyStatus].resource.bodySite 0..0
* entry[pregnancyStatus].resource.component 0..0
* entry[pregnancyStatus].resource.specimen 0..0
* entry[pregnancyStatus].resource.referenceRange 0..0
* entry[pregnancyStatus].resource.device 0..0
* entry[pregnancyStatus].resource.method 0..0
* entry[pregnancyStatus].resource.interpretation 0..0

// ── Estimated date of delivery ──
* entry[estimatedDateOfDelivery].resource only $BeClinObs
* entry[estimatedDateOfDelivery].resource.code = $LOINC#11778-8
* entry[estimatedDateOfDelivery].resource.value[x] only dateTime
* entry[estimatedDateOfDelivery].resource.bodySite 0..0
* entry[estimatedDateOfDelivery].resource.component 0..0
* entry[estimatedDateOfDelivery].resource.specimen 0..0
* entry[estimatedDateOfDelivery].resource.referenceRange 0..0
* entry[estimatedDateOfDelivery].resource.device 0..0
* entry[estimatedDateOfDelivery].resource.method 0..0
* entry[estimatedDateOfDelivery].resource.interpretation 0..0

// ── Expected number of children ──
* entry[expectedNumberOfChildren].resource only $BeClinObs
* entry[expectedNumberOfChildren].resource.code = $LOINC#11640-0
* entry[expectedNumberOfChildren].resource.value[x] only integer
* entry[expectedNumberOfChildren].resource.bodySite 0..0
* entry[expectedNumberOfChildren].resource.component 0..0
* entry[expectedNumberOfChildren].resource.specimen 0..0
* entry[expectedNumberOfChildren].resource.referenceRange 0..0
* entry[expectedNumberOfChildren].resource.device 0..0
* entry[expectedNumberOfChildren].resource.method 0..0
* entry[expectedNumberOfChildren].resource.interpretation 0..0

// ── Actual end of pregnancy date ──
* entry[endOfPregnancyDate].resource only $BeClinObs
* entry[endOfPregnancyDate].resource.code = $SCT#289251005
* entry[endOfPregnancyDate].resource.value[x] only dateTime
* entry[endOfPregnancyDate].resource.bodySite 0..0
* entry[endOfPregnancyDate].resource.component 0..0
* entry[endOfPregnancyDate].resource.specimen 0..0
* entry[endOfPregnancyDate].resource.referenceRange 0..0
* entry[endOfPregnancyDate].resource.device 0..0
* entry[endOfPregnancyDate].resource.method 0..0
* entry[endOfPregnancyDate].resource.interpretation 0..0
