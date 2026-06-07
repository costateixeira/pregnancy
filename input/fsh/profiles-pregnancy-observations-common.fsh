// ═══════════════════════════════════════════════════════════════════════════════
//  Shared "detail" observations for the pregnancy status report.
//
//  These three profiles are IDENTICAL in both design options (A: pregnancy as
//  Condition, B: pregnancy as Observation). In both options they are
//  BeObservation ("BeClinicalObservation") instances. Only the *overall*
//  pregnancy element differs between the options.
//
//  Element -> mapping rationale (logical model PregnancyStatusDataSet1):
//    * patient          -> Observation.subject
//    * practitioner     -> Observation.performer (already 1..* in BeObservation)
//    * observationDate  -> Observation.effectiveDateTime
//    * recordedDate     -> Observation.issued
//    * value            -> Observation.value[x] (type per element)
// ═══════════════════════════════════════════════════════════════════════════════

// ─── Expected date of delivery ───────────────────────────────────────────────
Profile: BePregnancyExpectedDeliveryDate
Parent: $BeObservation
Id: be-pregnancy-expected-delivery-date
Title: "Pregnancy - Expected Date of Delivery"
Description: "Estimated date of delivery (EDD), usually derived from ultrasound. Modelled as a BeClinicalObservation (BeObservation)."
* status = #final (exactly)
* code = $LOINC#11778-8 "Delivery date Estimated" (exactly)
* subject 1..1
* subject only Reference(Patient)
* performer 1..1
* effective[x] only dateTime
* effectiveDateTime 1..1
* value[x] only dateTime
* valueDateTime 1..1

// ─── Expected number of children ─────────────────────────────────────────────
Profile: BePregnancyExpectedNumberOfChildren
Parent: $BeObservation
Id: be-pregnancy-expected-number-of-children
Title: "Pregnancy - Expected Number of Children"
Description: "Number of children the practitioner expects in the delivery, usually estimated from ultrasound. Modelled as a BeClinicalObservation (BeObservation)."
* status = #final (exactly)
* code = $LOINC#11878-6 "US Estimated number of fetuses" (exactly)
* subject 1..1
* subject only Reference(Patient)
* performer 1..1
* effective[x] only dateTime
* effectiveDateTime 1..1
* value[x] only integer
* valueInteger 1..1

// ─── Actual date of end of pregnancy ─────────────────────────────────────────
Profile: BePregnancyEndDate
Parent: $BeObservation
Id: be-pregnancy-end-date
Title: "Pregnancy - Actual Date of End of Pregnancy"
Description: "The actual end date of the pregnancy. Modelled as a BeClinicalObservation (BeObservation). NOTE: in Option A this information can alternatively be carried on Condition.abatementDateTime."
* status = #final (exactly)
* code = $SCT#289251005 "Pregnancy ended (finding)" (exactly)
* subject 1..1
* subject only Reference(Patient)
* performer 1..1
* effective[x] only dateTime
* effectiveDateTime 1..1
* value[x] only dateTime
* valueDateTime 1..1
