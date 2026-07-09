# ex-pregnancy-status-contained - Belgian Pregnancy Implementation Guide v0.1.0

## Example Observation: ex-pregnancy-status-contained



## Resource Content

```json
{
  "resourceType" : "Observation",
  "id" : "ex-pregnancy-status-contained",
  "meta" : {
    "profile" : ["https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/be-pregnancy-status"]
  },
  "contained" : [{
    "resourceType" : "Observation",
    "id" : "edd",
    "meta" : {
      "profile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
    },
    "identifier" : [{
      "system" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/sid/observation",
      "value" : "edd-contained"
    }],
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "11778-8",
        "display" : "Delivery date Estimated"
      }]
    },
    "subject" : {
      "reference" : "Patient/ex-pregnant-woman"
    },
    "effectiveDateTime" : "2026-02-10",
    "performer" : [{
      "reference" : "Practitioner/ex-gynaecologist"
    }],
    "valueDateTime" : "2026-09-15"
  },
  {
    "resourceType" : "Observation",
    "id" : "children",
    "meta" : {
      "profile" : ["https://www.ehealth.fgov.be/standards/fhir/core-clinical/StructureDefinition/be-clinical-observation"]
    },
    "identifier" : [{
      "system" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/sid/observation",
      "value" : "children-contained"
    }],
    "status" : "final",
    "code" : {
      "coding" : [{
        "system" : "http://loinc.org",
        "code" : "11878-6",
        "display" : "Number of fetuses by US"
      }]
    },
    "subject" : {
      "reference" : "Patient/ex-pregnant-woman"
    },
    "effectiveDateTime" : "2026-02-10",
    "performer" : [{
      "reference" : "Practitioner/ex-gynaecologist"
    }],
    "valueInteger" : 1
  }],
  "identifier" : [{
    "system" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/sid/observation",
    "value" : "status-contained"
  }],
  "status" : "final",
  "code" : {
    "coding" : [{
      "system" : "http://loinc.org",
      "code" : "82810-3",
      "display" : "Pregnancy status"
    }]
  },
  "subject" : {
    "reference" : "Patient/ex-pregnant-woman"
  },
  "effectiveDateTime" : "2026-02-10",
  "performer" : [{
    "reference" : "Practitioner/ex-gynaecologist"
  }],
  "valueCodeableConcept" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "77386006",
      "display" : "Pregnant (finding)"
    }]
  },
  "hasMember" : [{
    "reference" : "#edd"
  },
  {
    "reference" : "#children"
  }]
}

```
