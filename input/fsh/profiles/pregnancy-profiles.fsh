// Profiles derived from the PregnancyStatusDataSet logical model.
//
// Shape:
//   - 1 EpisodeOfCare profile (BePregnancyEpisode) — anchors the pregnancy.
//   - N Observation profiles, each parented on BeClinicalObservation
//     (hl7.fhir.be.core-clinical), and each linked to the BePregnancyEpisode
//     via the workflow-episodeOfCare extension
//     (http://hl7.org/fhir/StructureDefinition/workflow-episodeOfCare).
//   - The BePregnancyStatusObservation hasMember slice references the
//     BeEstimatedDateOfDeliveryObservation (per IPS Pregnancy Status pattern).
//
// IPS references:
//   - http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-pregnancy-status-uv-ips
//   - http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-pregnancy-edd-uv-ips
//   - http://hl7.org/fhir/uv/ips/StructureDefinition/Observation-pregnancy-outcome-uv-ips

Alias: $BeClinObs   = https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation
Alias: $BePatient   = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-patient
Alias: $BePract     = https://www.ehealth.fgov.be/standards/fhir/core/StructureDefinition/be-practitioner
Alias: $WfEpisode   = http://hl7.org/fhir/StructureDefinition/workflow-episodeOfCare
Alias: $LOINC       = http://loinc.org
Alias: $SCT         = http://snomed.info/sct
Alias: $UCUM        = http://unitsofmeasure.org
Alias: $IpsEddVS    = http://hl7.org/fhir/uv/ips/ValueSet/edd-method-uv-ips
Alias: $IpsPsVS     = http://hl7.org/fhir/uv/ips/ValueSet/pregnancy-status-uv-ips


// ─── Observation: pregnancy status ──────────────────────────────────────────

Profile:     BePregnancyStatusObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-status
Title:       "Pregnancy Status (Observation)"
Description: "Current pregnancy status of a woman (e.g. pregnant, not pregnant).
Aligned with IPS `Observation-pregnancy-status-uv-ips`. Linked to a
`BePregnancyEpisode` via the `workflow-episodeOfCare` extension. Per the IPS
pattern, `hasMember` references the related EDD observation."

* code = $LOINC#82810-3 "Pregnancy status"

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only CodeableConcept
* valueCodeableConcept from $IpsPsVS (preferred)

* hasMember ^slicing.discriminator.type = #profile
* hasMember ^slicing.discriminator.path = "resolve()"
* hasMember ^slicing.rules = #open
* hasMember contains
    edd 0..1 MS
* hasMember[edd] only Reference(BeEstimatedDateOfDeliveryObservation)


// ─── Observation: estimated date of delivery ────────────────────────────────

Profile:     BeEstimatedDateOfDeliveryObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-edd
Title:       "Estimated Date of Delivery (Observation)"
Description: "Expected delivery date for a pregnancy, usually estimated from
ultrasound. Aligned with IPS `Observation-pregnancy-edd-uv-ips`. Linked to a
`BePregnancyEpisode` via the `workflow-episodeOfCare` extension."

// IPS binds Observation.code to the EDD method value set (required).
* code from $IpsEddVS (required)

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only dateTime


// ─── Observation: end of pregnancy date ─────────────────────────────────────

Profile:     BeEndOfPregnancyDateObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-end-date
Title:       "End of Pregnancy Date (Observation)"
Description: "Actual end date of a pregnancy. Linked to a `BePregnancyEpisode`
via the `workflow-episodeOfCare` extension."

// TODO: bind Observation.code to a Belgian/SNOMED value set for the
// "end of pregnancy" concept once the terminology expert confirms it.
* code 1..1

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only dateTime


// ─── Observation: expected number of children ──────────────────────────────

Profile:     BeExpectedNumberOfChildrenObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-fetus-count
Title:       "Expected Number of Children (Observation)"
Description: "Expected number of children for a pregnancy (number of fetuses,
usually determined by ultrasound). Linked to a `BePregnancyEpisode` via the
`workflow-episodeOfCare` extension."

* code = $LOINC#11640-0 "Fetus Number"

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.system = $UCUM
* valueQuantity.code = #1


// ─── Observation: number of silent births (this delivery) ──────────────────

Profile:     BeNumberOfSilentBirthsObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-silent-births
Title:       "Number of Silent Births (Observation)"
Description: "Number of fetal deaths in this delivery. Obligatory when the
pregnancy has ended. Linked to a `BePregnancyEpisode` via the
`workflow-episodeOfCare` extension."

// TODO: confirm code with the terminology expert. Note that IPS pregnancy
// outcome codes (e.g. LOINC 11636-8 "Pregnancy losses --in mother") are
// lifetime totals; this element is per-delivery, so a different code or VS
// will likely be needed.
* code 1..1

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.system = $UCUM
* valueQuantity.code = #1


// ─── Observation: number of live births (this delivery) ────────────────────

Profile:     BeNumberOfLiveBirthsObservation
Parent:      $BeClinObs
Id:          be-observation-pregnancy-live-births
Title:       "Number of Live Births (Observation)"
Description: "Number of alive births in this delivery. Obligatory when the
pregnancy has ended. Linked to a `BePregnancyEpisode` via the
`workflow-episodeOfCare` extension. **Out of scope of the pilot project.**"

// TODO: confirm code (per-delivery, not lifetime) with the terminology expert.
* code 1..1

* subject 1..1
* subject only Reference($BePatient)

* performer 1..1

* effective[x] 1..1
* effective[x] only dateTime

* value[x] 1..1
* value[x] only Quantity
* valueQuantity.value 1..1
* valueQuantity.system = $UCUM
* valueQuantity.code = #1
