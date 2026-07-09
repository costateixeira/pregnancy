# Pregnancy Status (administrative) - Belgian Pregnancy Implementation Guide v0.1.0

## Resource Profile: Pregnancy Status (administrative) 

 
Administrative pregnancy status: a single `BeClinicalObservation` (LOINC `82810-3`, value `CodeableConcept` as in IPS) that **contains** its detail observations and groups them via `Observation.hasMember`. 
The detail observations — estimated date of delivery (LOINC `11778-8`, `dateTime` as in IPS), expected number of children (LOINC `11878-6`, `integer`) and actual end of pregnancy (SNOMED `289251005`, `dateTime`) — are carried as **contained** resources, constrained by slicing `contained` by type and code. Codes are **fixed values**, not bindings. `bodySite`, `component`, `specimen`, `referenceRange`, `device`, `method` and `interpretation` are not used. 
There is **no StructureDefinition per detail type**; the slicing and profiling live on the contained resources. Pregnancy status is for administrative sharing, **not clinical care**; for clinical care the pregnancy is more commonly represented as a `Condition` (see [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.md)). 

**Usages:**

* Examples for this Profile: [Observation/ex-pregnancy-status-contained](Observation-ex-pregnancy-status-contained.md)

You can also check for [usages in the FHIR IG Statistics](https://packages2.fhir.org/xig/resource/be.fhir.pregnancy|current/StructureDefinition/StructureDefinition-be-pregnancy-status.json)

### Formal Views of Profile Content

 [Description Differentials, Snapshots, and other representations](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#structure-definitions). 

 

Other representations of profile: [CSV](../StructureDefinition-be-pregnancy-status.csv), [Excel](../StructureDefinition-be-pregnancy-status.xlsx), [Schematron](../StructureDefinition-be-pregnancy-status.sch) 



## Resource Content

```json
{
  "resourceType" : "StructureDefinition",
  "id" : "be-pregnancy-status",
  "url" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/be-pregnancy-status",
  "version" : "0.1.0",
  "name" : "BePregnancyStatus",
  "title" : "Pregnancy Status (administrative)",
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
  "description" : "Administrative pregnancy status: a single `BeClinicalObservation` (LOINC `82810-3`,\nvalue `CodeableConcept` as in IPS) that **contains** its detail observations and\ngroups them via `Observation.hasMember`.\n\nThe detail observations — estimated date of delivery (LOINC `11778-8`, `dateTime` as\nin IPS), expected number of children (LOINC `11878-6`, `integer`) and actual end of\npregnancy (SNOMED `289251005`, `dateTime`) — are carried as **contained**\nresources, constrained by slicing `contained` by type and code. Codes are **fixed\nvalues**, not bindings. `bodySite`, `component`, `specimen`, `referenceRange`,\n`device`, `method` and `interpretation` are not used.\n\nThere is **no StructureDefinition per detail type**; the slicing and profiling live\non the contained resources. Pregnancy status is for administrative sharing, **not\nclinical care**; for clinical care the pregnancy is more commonly represented as a\n`Condition` (see [BePregnancyCondition](StructureDefinition-be-pregnancy-condition.html)).",
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
  "type" : "Observation",
  "baseDefinition" : "https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation",
  "derivation" : "constraint",
  "differential" : {
    "element" : [{
      "id" : "Observation",
      "path" : "Observation"
    },
    {
      "id" : "Observation.contained",
      "path" : "Observation.contained",
      "slicing" : {
        "discriminator" : [{
          "type" : "type",
          "path" : "$this"
        },
        {
          "type" : "pattern",
          "path" : "code"
        }],
        "rules" : "open"
      }
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery",
      "path" : "Observation.contained",
      "sliceName" : "estimatedDateOfDelivery",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Observation",
        "profile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.code",
      "path" : "Observation.contained.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "11778-8"
        }]
      }
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.value[x]",
      "path" : "Observation.contained.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.interpretation",
      "path" : "Observation.contained.interpretation",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.bodySite",
      "path" : "Observation.contained.bodySite",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.method",
      "path" : "Observation.contained.method",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.specimen",
      "path" : "Observation.contained.specimen",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.device",
      "path" : "Observation.contained.device",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.referenceRange",
      "path" : "Observation.contained.referenceRange",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:estimatedDateOfDelivery.component",
      "path" : "Observation.contained.component",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren",
      "path" : "Observation.contained",
      "sliceName" : "expectedNumberOfChildren",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Observation",
        "profile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.code",
      "path" : "Observation.contained.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "11878-6"
        }]
      }
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.value[x]",
      "path" : "Observation.contained.value[x]",
      "type" : [{
        "code" : "integer"
      }]
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.interpretation",
      "path" : "Observation.contained.interpretation",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.bodySite",
      "path" : "Observation.contained.bodySite",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.method",
      "path" : "Observation.contained.method",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.specimen",
      "path" : "Observation.contained.specimen",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.device",
      "path" : "Observation.contained.device",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.referenceRange",
      "path" : "Observation.contained.referenceRange",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:expectedNumberOfChildren.component",
      "path" : "Observation.contained.component",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate",
      "path" : "Observation.contained",
      "sliceName" : "endOfPregnancyDate",
      "min" : 0,
      "max" : "1",
      "type" : [{
        "code" : "Observation",
        "profile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
      }],
      "mustSupport" : true
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.code",
      "path" : "Observation.contained.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://snomed.info/sct",
          "code" : "289251005"
        }]
      }
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.value[x]",
      "path" : "Observation.contained.value[x]",
      "type" : [{
        "code" : "dateTime"
      }]
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.interpretation",
      "path" : "Observation.contained.interpretation",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.bodySite",
      "path" : "Observation.contained.bodySite",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.method",
      "path" : "Observation.contained.method",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.specimen",
      "path" : "Observation.contained.specimen",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.device",
      "path" : "Observation.contained.device",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.referenceRange",
      "path" : "Observation.contained.referenceRange",
      "max" : "0"
    },
    {
      "id" : "Observation.contained:endOfPregnancyDate.component",
      "path" : "Observation.contained.component",
      "max" : "0"
    },
    {
      "id" : "Observation.code",
      "path" : "Observation.code",
      "patternCodeableConcept" : {
        "coding" : [{
          "system" : "http://loinc.org",
          "code" : "82810-3"
        }]
      }
    },
    {
      "id" : "Observation.value[x]",
      "path" : "Observation.value[x]",
      "type" : [{
        "code" : "CodeableConcept"
      }]
    },
    {
      "id" : "Observation.interpretation",
      "path" : "Observation.interpretation",
      "max" : "0"
    },
    {
      "id" : "Observation.bodySite",
      "path" : "Observation.bodySite",
      "max" : "0"
    },
    {
      "id" : "Observation.method",
      "path" : "Observation.method",
      "max" : "0"
    },
    {
      "id" : "Observation.specimen",
      "path" : "Observation.specimen",
      "max" : "0"
    },
    {
      "id" : "Observation.device",
      "path" : "Observation.device",
      "max" : "0"
    },
    {
      "id" : "Observation.referenceRange",
      "path" : "Observation.referenceRange",
      "max" : "0"
    },
    {
      "id" : "Observation.hasMember",
      "path" : "Observation.hasMember",
      "type" : [{
        "code" : "Reference",
        "targetProfile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
      }]
    },
    {
      "id" : "Observation.component",
      "path" : "Observation.component",
      "max" : "0"
    }]
  }
}

```
