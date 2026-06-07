# Belgian Pregnancy Implementation Guide

## Introduction

This Implementation Guide (IG) defines how pregnancy data is exchanged in Belgium using HL7 FHIR. Pregnancy and birth involve a broad pregnancy care set, contributed and consumed by many initiatives and stakeholders over the full course of care. This IG is the common specification for that care set, designed to be reused across projects and to extend as additional stakeholders contribute their data and use cases.

It specifies the [**pregnancy status**](pregnancy-status.html) data set — a well-bounded, widely reusable part of that care set, making pregnancy data available to government agencies, to the pregnant woman herself, and to her caregivers.

## Information model — two scopes, two resources

The IG deliberately distinguishes two related but different concepts. Each has its own scope, and each is represented by a different FHIR resource type.

1. **Pregnancy status** — a *point-in-time clinical finding*: at a given observation date, is the person pregnant and what is the status (pregnant / not pregnant / possibly pregnant)? This is the question that an ER physician or an automated entitlement check needs answered "as of now". It is naturally a **point-in-time Observation**, aligned with the international *Pregnancy status* observation (IPS, LOINC `82810-3`, SNOMED-coded value).

2. **The pregnancy itself** — the *longitudinal clinical episode*: a pregnancy that begins, runs over time and eventually ends. It has an onset, an (estimated) due date, an expected number of children and an actual end date, and a clinical status that moves from active to resolved. This is naturally a **clinical Condition / episode**, where onset and abatement map to the start and end of the pregnancy.

Because the two concepts have different scopes, the IG represents them with two distinct resource types:

| Concept | Scope | FHIR resource | Profile |
|---|---|---|---|
| Pregnancy status | point-in-time finding | `Observation` | [BePregnancyStatusObservation](StructureDefinition-be-pregnancy-status-observation.html) |
| The pregnancy itself | longitudinal episode | `Condition` | [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.html) |

In both cases the supporting detail data — expected date of delivery, expected number of children and actual end date — are carried as separate `BeClinicalObservation`s, grouped under the pregnancy-status Observation (via `Observation.hasMember`) or linked to the pregnancy Condition. The shared, scope-independent information model for this data set is the logical model [PregnancyStatusDataSet](StructureDefinition-PregnancyStatusDataSet.html).

## Out of scope

A broader set of administrative and clinical pregnancy data is out of scope of the pregnancy status data set. The information model is deliberately designed with that broader scope in mind, so it can be extended without redesign.
