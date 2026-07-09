# Pregnancy Status Model - Belgian Pregnancy Implementation Guide v0.1.0

## Logical Model: Pregnancy Status Model 

 
Logical model for the pregnancy-status data. 
This is the minimal data set for the pregnancy status (consumed, for example, via Vitalink FHIR / MAGDA / VUTG / mijnburgerprofiel.be / mijngezondheid.be / caregivers). 

This logical model captures the **scope-independent** information of the pregnancy-status data set. It describes **what** data is exchanged, independently of **how** it is represented in FHIR resources.

When this data set is mapped onto FHIR, the IG distinguishes two related but different concepts, each with its own scope and each represented by a different resource type:

* **Pregnancy status** — a **point-in-time clinical finding** (“is this person pregnant, and what is the status as of the observation date?”). Represented as an `Observation`, aligned with the IPS **Pregnancy status** observation. See [BePregnancyStatusObservation](StructureDefinition-be-observation-pregnancy-status.md).
* **The pregnancy itself** — the **longitudinal clinical episode** with an onset, due date, expected number of children and an end. Represented as a `Condition`. See [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.md).

In both cases the supporting detail elements (expected date of delivery, expected number of children, actual end date) are carried as separate `BeClinicalObservation`s. See the [Information model — two scopes, two resources](index.md) section of the home page for the full rationale.

**Usages:**

* This Logical Model is not used by any profiles in this Specification

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/be.fhir.pregnancy|current/StructureDefinition/StructureDefinition-PregnancyStatusDataSet.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-PregnancyStatusDataSet.csv), [Excel](../StructureDefinition-PregnancyStatusDataSet.xlsx) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "PregnancyStatusDataSet",
  "extension" : [{
    "url" : "http://hl7.org/fhir/StructureDefinition/structuredefinition-type-characteristics",
    "valueCode" : "can-be-target"
  }],
  "url" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/PregnancyStatusDataSet",
  "version" : "0.1.0",
  "name" : "PregnancyStatusDataSet",
  "title" : "Pregnancy Status Model",
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
  "description" : "Logical model for the pregnancy-status data.\n\nThis is the minimal data set for the pregnancy status (consumed, for example, via\nVitalink FHIR / MAGDA / VUTG / mijnburgerprofiel.be / mijngezondheid.be /\ncaregivers).",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE",
      "display" : "Belgium"
    }]
  }],
  "fhirVersion" : "4.0.1",
  "kind" : "logical",
  "abstract" : false,
  "type" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/PregnancyStatusDataSet",
  "baseDefinition" : "http://hl7.org/fhir/StructureDefinition/Base",
  "derivation" : "specialization",
  "differential" : {
    "element" : [{
      "id" : "PregnancyStatusDataSet",
      "path" : "PregnancyStatusDataSet",
      "short" : "Pregnancy Status Model",
      "definition" : "Logical model for the pregnancy-status data.\n\nThis is the minimal data set for the pregnancy status (consumed, for example, via\nVitalink FHIR / MAGDA / VUTG / mijnburgerprofiel.be / mijngezondheid.be /\ncaregivers)."
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy",
      "path" : "PregnancyStatusDataSet.pregnancy",
      "short" : "Pregnancy Episode",
      "definition" : "Pregnancy Episode",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.patient",
      "path" : "PregnancyStatusDataSet.pregnancy.patient",
      "short" : "Patient (pregnant woman)",
      "definition" : "The patient who is pregnant. The reference may identify the patient by pseudonymised SSIN, depending on the implementation.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Patient"]
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.author",
      "path" : "PregnancyStatusDataSet.pregnancy.author",
      "short" : "The healthcare professional who takes responsibility for the recording of the pregnancy information",
      "definition" : "The healthcare professional who takes responsibility for the recording of the pregnancy information",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.updateDate",
      "path" : "PregnancyStatusDataSet.pregnancy.updateDate",
      "short" : "Last update date",
      "definition" : "The last date on which the pregnant woman was observed by her gynaecologist or midwife during the pregnancy.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.firstRecordedDate",
      "path" : "PregnancyStatusDataSet.pregnancy.firstRecordedDate",
      "short" : "Recorded date of pregnancy",
      "definition" : "The date the pregnancy was first registered in the system. This is not the date the pregnancy was observed, but the date it was entered in the system for the first time.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus",
      "short" : "Pregnancy status (observation)",
      "definition" : "Observation conveying the current pregnancy status of the woman at the date of observation (e.g. pregnant, not pregnant). Bound to SNOMED CT, EHDS Patient Summary aligned.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.value",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.value",
      "short" : "The actual value",
      "definition" : "Coded pregnancy status (e.g. pregnant, not pregnant).",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.author",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.author",
      "short" : "Practitioner who recorded the pregnancy status",
      "definition" : "Practitioner who recorded the pregnancy status",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["http://hl7.org/fhir/StructureDefinition/Practitioner"]
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.pregnancyStartDate",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.pregnancyStartDate",
      "short" : "Date the pregnancy started",
      "definition" : "The date the pregnancy began, usually estimated as the first day of the last menstrual period (LMP) or from an early ultrasound.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.pregnancyStartDate.value",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.pregnancyStartDate.value",
      "short" : "The actual value",
      "definition" : "The actual value",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.estimatedDateOfDelivery",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.estimatedDateOfDelivery",
      "short" : "Estimated date of delivery",
      "definition" : "The date the practitioner expects the delivery, usually etimated from the ultrasound. It normally does not change after the initial etimation; the actual delivery date is typically within ±2 weeks.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.estimatedDateOfDelivery.value",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.estimatedDateOfDelivery.value",
      "short" : "The actual value",
      "definition" : "The actual value",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.dateOfEndOfPregnancy",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.dateOfEndOfPregnancy",
      "short" : "Date of end of pregnancy",
      "definition" : "The actual end date of the pregnancy.",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.dateOfEndOfPregnancy.value",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.dateOfEndOfPregnancy.value",
      "short" : "The actual value",
      "definition" : "The actual value",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "date"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.expectedNumberOfChildren",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.expectedNumberOfChildren",
      "short" : "Expected number of children",
      "definition" : "The number of births the practitioner expects in the delivery, usually estimated from the ultrasound.",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "Base"
      }]
    },
    {
      "id" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.expectedNumberOfChildren.value",
      "path" : "PregnancyStatusDataSet.pregnancy.pregnancyStatus.expectedNumberOfChildren.value",
      "short" : "The actual value",
      "definition" : "The actual value",
      "min" : 1,
      "max" : "1",
      "type" : [{
        "code" : "integer"
      }]
    }]
  }
}

```
