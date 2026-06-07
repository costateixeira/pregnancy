This profile represents **the pregnancy itself** — the *longitudinal clinical episode*: a pregnancy that begins, runs over time and eventually ends. It has an onset, an (estimated) due date, an expected number of children and an actual end date, and a clinical status that moves from active to resolved. Onset and abatement map naturally to the start and end of the pregnancy.

It is one of the two scopes the IG distinguishes:

- **The pregnancy itself** (this profile) — the longitudinal episode, represented as a `Condition`.
- **Pregnancy status** — a point-in-time clinical finding, represented as an `Observation` aligned with the IPS *Pregnancy status* observation. See [BePregnancyStatusObservation](StructureDefinition-be-pregnancy-status-observation.html).

The supporting detail data — expected date of delivery, expected number of children and actual end date — are carried as separate `BeClinicalObservation`s linked to this Condition (the actual end date may alternatively be carried on `Condition.abatementDateTime`). See the [Information model — two scopes, two resources](index.html) section of the home page for the full rationale, and the logical model [PregnancyStatusDataSet1](StructureDefinition-PregnancyStatusDataSet1.html) for the underlying data set.
