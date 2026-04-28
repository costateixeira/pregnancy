Logical: PregnancyStatusDataSet1
Id: PregnancyStatusDataSet1
Title: "Pregnancy Status Model"
Description: """
Logical model for the pregnancy-status data exchanged in transaction
**T1 - Submit Pregnancy**, as defined in Data Set 1 of the Pregnancy Status
project data dictionary.

This is the minimal data set used by the pilot project (Vitalink FHIR /
MAGDA / VUTG / mijnburgerprofiel.be / mijngezondheid.be / caregivers).
Elements in the pilot scope are marked **MUST HAVE**; elements that
appear in Data Set 1 but are out of scope of the pilot are marked
**ADDITIONAL**.
"""
Characteristics: #can-be-target

// ─── MUST HAVE (in scope of pilot project) ───────────────────────────────────

* patient 1..1 Reference(Patient) "Patient (pregnant woman)"
  "The patient who is pregnant. In the pilot, the reference identifies the
   patient by pseudonymised SSIN."

* practitioner 1..1 Reference(Practitioner) "Practitioner responsible for the observation"
  "The practitioner (gynaecologist, GP or midwife) responsible for the
   pregnancy observation. Identified by INSZ / NIHDI number and/or name."

* observationDate 1..1 date "Observation date"
  "The last date on which the pregnant woman was observed by her
   gynaecologist or midwife during the pregnancy."

* estimatedDateOfDelivery 1..1 date "Estimated date of delivery"
  "The date the practitioner expects the delivery, usually etimated from
   the ultrasound. It normally does not change after the initial etimation;
   the actual delivery date is typically within ±2 weeks."

* expectedNumberOfChildren 1..1 integer "Expected number of children"
  "The number of births the practitioner expects in the delivery, usually
   etimated from the ultrasound."

* dateOfEndOfPregnancy 0..1 date "Date of end of pregnancy"
  "The actual end date of the pregnancy."

* numberOfSilentBirths 0..1 integer "Number of silent births"
  "The number of fetal deaths in this delivery. Obligatory when
   `dateOfEndOfPregnancy` is filled in."

// ─── ADDITIONAL (not explicitly in scope of pilot project) ───────────────────

* numberOfAliveBirths 0..1 integer "Number of alive births"
  "The number of alive births in this delivery. Obligatory when
   `dateOfEndOfPregnancy` is filled in."

* recordedDateOfPregnancy 1..1 date "Recorded date of pregnancy"
  "The date the pregnancy was first registered in the system. This is not
   the date the pregnancy was observed, but the date it was entered in the
   system for the first time."

* pregnancyStatus 0..1 CodeableConcept "Pregnancy status"
  "Current pregnancy status of the woman at the date of observation
   (e.g. pregnant, not pregnant). Bound to SNOMED CT."
