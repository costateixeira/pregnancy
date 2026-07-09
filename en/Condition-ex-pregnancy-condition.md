# Pregnancy as a Condition (clinical episode) - Belgian Pregnancy Implementation Guide v0.1.0

## Example Condition: Pregnancy as a Condition (clinical episode)

Profile: [Pregnancy (Condition)](StructureDefinition-be-pregnancy-condition.md)

**clinicalStatus**: Active

**code**: Pregnant (finding)

**subject**: [Jana Peeters Female, DoB Unknown](Patient-ex-pregnant-woman.md)

**onset**: 2026-01-05

**recordedDate**: 2026-02-10

**recorder**: [Practitioner Anke De Vries ](Practitioner-ex-gynaecologist.md)



## Resource Content

```json
{
  "resourceType" : "Condition",
  "id" : "ex-pregnancy-condition",
  "meta" : {
    "profile" : ["https://www.ehealth.fgov.be/standards/fhir/pregnancy/StructureDefinition/be-pregnancy-condition"]
  },
  "clinicalStatus" : {
    "coding" : [{
      "system" : "http://terminology.hl7.org/CodeSystem/condition-clinical",
      "code" : "active"
    }]
  },
  "code" : {
    "coding" : [{
      "system" : "http://snomed.info/sct",
      "code" : "77386006",
      "display" : "Pregnant (finding)"
    }]
  },
  "subject" : {
    "reference" : "Patient/ex-pregnant-woman"
  },
  "onsetDateTime" : "2026-01-05",
  "recordedDate" : "2026-02-10",
  "recorder" : {
    "reference" : "Practitioner/ex-gynaecologist"
  }
}

```
