// ═══════════════════════════════════════════════════════════════════════════════
//  Examples — the same pregnancy data shown under each framing, and the
//  transitions between them.
//
//  The detail observations (expected date of delivery, expected number of
//  children, ...) are the ROBUST CORE: they carry the actual values and stay
//  unchanged regardless of how the pregnancy as a whole is represented. Over that
//  core there are two framings:
//
//    Summary framing   the pregnancy status as a point-in-time Observation that
//                      asserts "pregnant / not pregnant" and groups the detail
//                      observations via Observation.hasMember (IPS-aligned).
//
//    Episode framing   the pregnancy as a Condition (onset, clinical status, end).
//                      The observations point to it via Observation.focus — both
//                      the status Observation and its members — so any observation
//                      that belongs to a pregnancy is known.
//
//  Whichever framing is not present is an OPTIONAL ADD-ON that can be derived from
//  the same core later, without touching the details. The examples below show each
//  framing on its own, both together, and confirm that moving between them needs no
//  rework of the detail observations.
//
//  Note: hasMember (summary -> its members) and focus (observation -> Condition)
//  are independent. hasMember has nothing to do with the Condition.
//
//  STATUS: the `focus` link is NOT constrained by the profiles yet; it will be
//  added once a Condition profile is in place. Until then it is unused and the
//  observations stand on their own under the summary Observation. The `*-linked`
//  instances illustrate the future state — the same observations after that one
//  `focus` reference has been added.
// ═══════════════════════════════════════════════════════════════════════════════

Alias: $CondClinical = http://terminology.hl7.org/CodeSystem/condition-clinical


// ─── Shared actors ───────────────────────────────────────────────────────────

Instance:   ex-pregnant-woman
InstanceOf: Patient
Usage:      #example
Title:      "Example pregnant woman"
Description: "Patient used by all pregnancy-status examples."
* name.family = "Peeters"
* name.given = "Jana"
* gender = #female

Instance:   ex-gynaecologist
InstanceOf: Practitioner
Usage:      #example
Title:      "Example gynaecologist"
Description: "Practitioner who records the pregnancy data in all examples."
* name.family = "De Vries"
* name.given = "Anke"


// ═══════════════════════════════════════════════════════════════════════════════
//  THE ROBUST CORE — detail observations
//
//  These carry the actual values and do not point to any parent. They are reused
//  as-is by every framing below; nothing here changes when a framing is added or
//  removed.
// ═══════════════════════════════════════════════════════════════════════════════

Instance:   ex-edd
InstanceOf: BeEstimatedDateOfDeliveryObservation
Usage:      #example
Title:      "Expected date of delivery (core detail observation)"
Description: "Estimated date of delivery. Part of the robust core: identical under every framing."
* status = #final
* code = $LOINC#11778-8 "Delivery date Estimated"
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueDateTime = "2026-09-15"

Instance:   ex-children
InstanceOf: BeExpectedNumberOfChildrenObservation
Usage:      #example
Title:      "Expected number of children (core detail observation)"
Description: "Expected number of children. Part of the robust core: identical under every framing."
* status = #final
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueQuantity.value = 1


// ═══════════════════════════════════════════════════════════════════════════════
//  SUMMARY FRAMING — pregnancy status as an Observation (no Condition)
//
//  This is the current scope. The status Observation asserts the finding and
//  groups the core observations via hasMember. The members do not point back, so
//  they are reusable as-is. No Condition is involved.
// ═══════════════════════════════════════════════════════════════════════════════

Instance:   ex-pregnancy-status
InstanceOf: BePregnancyStatusObservation
Usage:      #example
Title:      "Pregnancy status as a summary Observation (no Condition)"
Description: "Summary framing: pregnancy status as a point-in-time Observation that asserts the finding and groups the core detail observations via hasMember. IPS-aligned. This is the current scope."
* status = #final
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueCodeableConcept = $SCT#77386006 "Pregnant (finding)"
* hasMember[edd] = Reference(ex-edd)
* hasMember[+] = Reference(ex-children)


// ═══════════════════════════════════════════════════════════════════════════════
//  EPISODE FRAMING — pregnancy as a Condition
//
//  The pregnancy is a clinical episode (onset, clinicalStatus, optional end). The
//  observations reference it via Observation.focus — it is the observation that
//  points to the Condition, not the reverse.
// ═══════════════════════════════════════════════════════════════════════════════

Instance:   ex-pregnancy-condition
InstanceOf: BePregnancyCondition
Usage:      #example
Title:      "Pregnancy as a Condition (clinical episode)"
Description: "Episode framing: the pregnancy modelled as a longitudinal Condition, with onset and clinical status. The detail observations reference it via focus."
* clinicalStatus = $CondClinical#active
* subject = Reference(ex-pregnant-woman)
* recorder = Reference(ex-gynaecologist)
* recordedDate = "2026-02-10"
* onsetDateTime = "2026-01-05"

// ex-edd-linked / ex-children-linked are IDENTICAL to the core ex-edd /
// ex-children except for the single `focus` line. That one optional reference is
// the ONLY change needed to place a core observation under a Condition — nothing
// else about the observation changes.
Instance:   ex-edd-linked
InstanceOf: BeEstimatedDateOfDeliveryObservation
Usage:      #example
Title:      "Expected date of delivery, referencing the Condition"
Description: "The core EDD observation (ex-edd) with the single addition of focus -> the pregnancy Condition."
* status = #final
* code = $LOINC#11778-8 "Delivery date Estimated"
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueDateTime = "2026-09-15"
* focus = Reference(ex-pregnancy-condition) // the only difference vs ex-edd

Instance:   ex-children-linked
InstanceOf: BeExpectedNumberOfChildrenObservation
Usage:      #example
Title:      "Expected number of children, referencing the Condition"
Description: "The core expected-number-of-children observation (ex-children) with the single addition of focus -> the pregnancy Condition."
* status = #final
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueQuantity.value = 1
* focus = Reference(ex-pregnancy-condition) // the only difference vs ex-children


// ═══════════════════════════════════════════════════════════════════════════════
//  BOTH FRAMINGS TOGETHER — the summary Observation over a Condition
//
//  The core observations are simultaneously grouped by the summary Observation
//  (hasMember) and reference the Condition (focus). Neither link requires the
//  other, and neither requires changing the observation's clinical content. Here
//  the summary Observation is an optional, IPS-compatible view over the episode.
//
//  Transitions — none of them touch the detail observations' clinical content:
//    add an episode    : start from the summary framing, add a Condition and the
//                        one `focus` reference (ex-edd -> ex-edd-linked, etc.).
//    add a summary     : start from the episode framing, add a summary Observation
//                        whose hasMember references the observations.
//    remove the episode: drop the Condition; the observations lose only `focus`.
//    remove the summary: drop the summary Observation; the observations are untouched.
// ═══════════════════════════════════════════════════════════════════════════════

Instance:   ex-pregnancy-status-with-condition
InstanceOf: BePregnancyStatusObservation
Usage:      #example
Title:      "Summary Observation over a Condition (both framings)"
Description: "Both framings together: the same summary Observation, grouping the core observations via hasMember, and — like its members — referencing the pregnancy Condition via focus."
* status = #final
* subject = Reference(ex-pregnant-woman)
* performer = Reference(ex-gynaecologist)
* effectiveDateTime = "2026-02-10"
* valueCodeableConcept = $SCT#77386006 "Pregnant (finding)"
* hasMember[edd] = Reference(ex-edd-linked)
* hasMember[+] = Reference(ex-children-linked)
* focus = Reference(ex-pregnancy-condition) // the summary points to the Condition too
