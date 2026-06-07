# Pregnancy status

Pregnancy and birth involve a broad set of administrative and clinical data,
contributed and consumed by many initiatives and stakeholders over the full course
of care — from the first confirmation of a pregnancy, through follow-up and
screening, to birth and post-natal follow-up of mother and child (eBirth, RIZIV,
Born in Belgium, Zoet Zwanger, PALS, the *moeder/kind boekje*, ...).

The **pregnancy status** is a minimal, well-bounded data set, sufficient to support
business cases such as entitlement to the *Groeipakket*, the on-line pregnancy
certificate, and consultation by the woman and her caregivers. The rest of the
broader pregnancy care set is **out of scope of this iteration**, but the
information model is designed so that it can be added later without redesign. See
the [home page](index.html) for the full scope and roadmap.

## The information model

Within the pregnancy-status scope, the IG distinguishes two related but different
concepts, each represented by a different FHIR resource type:

- **Pregnancy status** — a *point-in-time clinical finding* ("is this person
  pregnant, and what is the status as of the observation date?"). Represented as an
  `Observation`, aligned with the IPS *Pregnancy status* observation. See
  [BePregnancyStatusObservation](StructureDefinition-be-pregnancy-status-observation.html).
- **The pregnancy itself** — the *longitudinal clinical episode* with an onset,
  actual end date, and linking to other details, such as due date, expected number of children, etc.. Represented as a `Condition`.
  See [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.html).

In both cases the supporting detail elements (expected date of delivery, expected
number of children, actual end date) are carried as separate
`BeClinicalObservation`s. The shared, scope-independent information model is the
logical model
[PregnancyStatusDataSet](StructureDefinition-PregnancyStatusDataSet.html).


The diagram below shows the two representations and how the design is
**incremental**: a project can start with the `PregnancyStatus` Observation and its
member observations, and add the `Pregnancy` Condition later with no redesign of the
existing observations.

<figure>
  {% include pregnancystatus.svg %}
</figure>