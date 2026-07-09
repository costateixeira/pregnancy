# Pregnancy status value set (BE) - Belgian Pregnancy Implementation Guide v0.1.0

## ValueSet: Pregnancy status value set (BE) 

 
Codes describing the current pregnancy status of a woman, aligned with the IPS pregnancy status value set. 

 **References** 

This value set is not used here; it may be used elsewhere (e.g. specifications and/or implementations that use this content)

### Logical Definition (CLD)

 

### Expansion

-------

 [Description of the above table(s)](http://build.fhir.org/ig/FHIR/ig-guidance/readingIgs.html#terminology). 



## Resource Content

```json
{
  "resourceType" : "ValueSet",
  "id" : "be-pregnancy-status-vs",
  "url" : "https://www.ehealth.fgov.be/standards/fhir/pregnancy/ValueSet/be-pregnancy-status-vs",
  "version" : "0.1.0",
  "name" : "BePregnancyStatusVS",
  "title" : "Pregnancy status value set (BE)",
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
  "description" : "Codes describing the current pregnancy status of a woman, aligned with the IPS pregnancy status value set.",
  "jurisdiction" : [{
    "coding" : [{
      "system" : "urn:iso:std:iso:3166",
      "code" : "BE",
      "display" : "Belgium"
    }]
  }],
  "compose" : {
    "include" : [{
      "system" : "http://snomed.info/sct",
      "concept" : [{
        "code" : "77386006",
        "display" : "Pregnant (finding)"
      },
      {
        "code" : "60001007",
        "display" : "Not pregnant (finding)"
      },
      {
        "code" : "102874004",
        "display" : "Possible pregnancy (finding)"
      }]
    }]
  }
}

```
