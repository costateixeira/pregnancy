# Pregnancy (Condition) - Belgian Pregnancy Implementation Guide v0.1.0

## Resource Profile: Pregnancy (Condition) 

 
Option A: the pregnancy modelled as a Condition. The detail data (EDD, expected number of children, end date) are carried in separate BeClinicalObservations. 

This profile represents **the pregnancy itself** — the **longitudinal clinical episode**: a pregnancy that begins, runs over time and eventually ends. It has an onset, an (estimated) due date, an expected number of children and an actual end date, and a clinical status that moves from active to resolved. Onset and abatement map naturally to the start and end of the pregnancy.

It is one of the two scopes the IG distinguishes:

* **The pregnancy itself** (this profile) — the longitudinal episode, represented as a `Condition`.
* **Pregnancy status** — a point-in-time clinical finding for **administrative sharing**, represented as an `Observation` aligned with the IPS **Pregnancy status** observation. See [BePregnancyStatusObservation](StructureDefinition-be-observation-pregnancy-status.md).

The supporting detail data — expected date of delivery, expected number of children and actual end date — are carried as separate `BeClinicalObservation`s referencing this Condition via `Observation.focus` (the actual end date may alternatively be carried on `Condition.abatementDateTime`). See the [pregnancy status](pregnancy-status.md) page for the full rationale, and the logical model [PregnancyStatusDataSet](StructureDefinition-PregnancyStatusDataSet.md) for the underlying data set.

**Usages:**

* Examples for this Profile: [Condition/ex-pregnancy-condition](Condition-ex-pregnancy-condition.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/be.fhir.pregnancy|current/StructureDefinition/StructureDefinition-be-pregnancy-condition.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-be-pregnancy-condition.csv), [Excel](../StructureDefinition-be-pregnancy-condition.xlsx), [Schematron](../StructureDefinition-be-pregnancy-condition.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "be-pregnancy-condition",
  "url" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/be-pregnancy-condition",
  "version" : "0.1.0",
  "name" : "BePregnancyCondition",
  "title" : "Pregnancy (Condition)",
  "status" : "draft",
  "date" : "2026-07-09T11:32:30+00:00",
  "publisher" : "Departement Zorg",
  "contact" : [{
    "name" : "Departement Zorg",
    "telecom" : [{
      "system" : "url",
      "value" : "https://www.departementzorg.be"
    }]
  }],
  "description" : "Option A: the pregnancy modelled as a Condition. The detail data (EDD, expected number of children, end date) are carried in separate BeClinicalObservations.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE",
      "display" : "Belgium"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "mapping" : [{
    "identity" : "workflow",
    "uri" : "http://hl7.org/fhir/workflow",
    "name" : "Workflow Pattern"
  },
  {
    "identity" : "sct-concept",
    "uri" : "http://snomed.info/conceptdomain",
    "name" : "SNOMED CT Concept Domain Binding"
  },
  {
    "identity" : "v2",
    "uri" : "http://hl7.org/v2",
    "name" : "HL7 v2 Mapping"
  },
  {
    "identity" : "rim",
    "uri" : "http://hl7.org/v3",
    "name" : "RIM Mapping"
  },
  {
    "identity" : "w5",
    "uri" : "http://hl7.org/fhir/fivews",
    "name" : "FiveWs Pattern Mapping"
  },
  {
    "identity" : "sct-attr",
    "uri" : "http://snomed.org/attributebinding",
    "name" : "SNOMED CT Attribute Binding"
  }],
  "kind" : "resource",
  "abstract" : false,
  "type" : "Condition",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Condition",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Condition",
      "path" : "Condition"
    },
    {
      "id" : "Condition.clinicalStatus",
      "path" : "Condition.clinicalStatus",
      "min" : 1
    },
    {
      "id" : "Condition.code",
      "path" : "Condition.code",
      "min" : 1,
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "77386006",
          "display" : "Pregnant (finding)"
        }]
      }
    },
    {
      "id" : "Condition.subject",
      "path" : "Condition.subject",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }]
    },
    {
      "id" : "Condition.abatement[x]",
      "path" : "Condition.abatement[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Condition.recordedDate",
      "path" : "Condition.recordedDate",
      "min" : 1
    },
    {
      "id" : "Condition.recorder",
      "path" : "Condition.recorder",
      "min" : 1,
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    }]
  }
}

```
