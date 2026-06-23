// TEST: slice Bundle.entry by resource type, then by resource.code, with child
// constraints under the slices. Verifying whether the IG Publisher can generate a
// snapshot for child paths of Bundle.entry.resource when the slice resource type
// is pinned.

Alias: $LOINC = http://loinc.org
Alias: $SCT   = http://snomed.info/sct

Profile:     BePregnancyStatusBundle
Parent:      Bundle
Id:          be-pregnancy-status-bundle
Title:       "Pregnancy Status Bundle (administrative)"
Description: "A collection Bundle for administrative sharing of a pregnancy status. Entries are Observations sliced by code: one pregnancy status (82810-3) grouping the details via hasMember, and optionally one each of EDD (11778-8), expected number of children (11640-0) and end of pregnancy (289251005)."

* type = #collection
* entry 1..*
* entry ^slicing.discriminator[0].type = #type
* entry ^slicing.discriminator[0].path = "resource"
* entry ^slicing.discriminator[1].type = #pattern
* entry ^slicing.discriminator[1].path = "resource.code"
* entry ^slicing.rules = #open
* entry contains
    pregnancyStatus 1..1 and
    estimatedDateOfDelivery 0..1 and
    expectedNumberOfChildren 0..1 and
    endOfPregnancyDate 0..1

* entry[pregnancyStatus].resource only Observation
* entry[pregnancyStatus].resource.code = $LOINC#82810-3
* entry[pregnancyStatus].resource.value[x] only CodeableConcept
* entry[pregnancyStatus].resource.bodySite 0..0

* entry[estimatedDateOfDelivery].resource only Observation
* entry[estimatedDateOfDelivery].resource.code = $LOINC#11778-8
* entry[estimatedDateOfDelivery].resource.value[x] only dateTime

* entry[expectedNumberOfChildren].resource only Observation
* entry[expectedNumberOfChildren].resource.code = $LOINC#11640-0
* entry[expectedNumberOfChildren].resource.value[x] only integer

* entry[endOfPregnancyDate].resource only Observation
* entry[endOfPregnancyDate].resource.code = $SCT#289251005
* entry[endOfPregnancyDate].resource.value[x] only dateTime
