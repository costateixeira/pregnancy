# Belgian Pregnancy Implementation Guide

## Introduction

This Implementation Guide (IG) defines how pregnancy data is exchanged in Belgium using HL7 FHIR. It is published by Departement Zorg in the context of a project that connects [Vitalink](https://www.vitalink.be) (the Flemish vault for citizens' medical data) and [MAGDA](https://www.vlaanderen.be/digitaal-vlaanderen/onze-oplossingen/magda) (the Flemish data-exchange platform between Flemish and Federal government agencies), to make pregnancy data available to government agencies, to the pregnant woman herself, and to her caregivers.

The current release is the **first pilot iteration** and intentionally covers a small, well-bounded data set ("pregnancy status"). The IG is designed to grow: subsequent iterations are expected to add administrative and clinical pregnancy data contributed by other stakeholders and related projects.

## Scope of the pilot

The pilot covers a minimal pregnancy data set, sufficient to support the following business cases:

1. **Automated entitlement to the *Groeipakket* (start amount).**
   [VUTG (Agentschap Uitbetaling Groeipakket)](https://www.groeipakket.be) needs to determine the right of a pregnant woman to receive the *startbedrag* of the *Groeipakket* (formerly *kinderbijslag*). To do so, VUTG needs to know:
   - that the pregnancy has reached at least 200 days;
   - the number of children expected;
   - the planned date of giving birth.

   In the case of a *silent birth*, the entitlement also applies if the pregnancy reached at least 180 days.

   Today this information is provided on a paper PDF form, signed by a gynaecologist, GP or midwife. The pilot replaces that paper flow with an automated process based on pregnancy data already available in EMR / hospital systems and shared via Vitalink FHIR.

2. **On-line pregnancy certificate via [mijnburgerprofiel.be](https://www.mijnburgerprofiel.be).**
   The pregnant woman can request a pregnancy certificate on-line, for purposes such as official notification to the employer, NMBS first-class travel entitlement, etc.

3. **Consultation by the pregnant woman** of her own pregnancy data via [mijngezondheid.be](https://www.mijngezondheid.be).

4. **Consultation by caregivers** (first-line and others) via EMR / hospital software and professional viewer applications (CoZo, Nexuzhealth, …).

Even within this limited scope, the data has immediate clinical value — for example, allowing an ER physician to know whether an unconscious patient is pregnant.

## Out of scope (for this iteration)

The requirements analysis for a broader set of pregnancy data is **not** part of this pilot. However, the solution is designed with that broader scope in mind, anticipated for a later iteration (possibly 2027 or later).

## Roadmap — incremental scope

This IG is intended to evolve as additional stakeholders and projects contribute pregnancy-related data and use cases. Related initiatives that may inform or contribute to future iterations include:

- **eBirth** (RIZIV) — sharing of pregnancy and birth data in support of the BI process;
- **RIZIV** project to share pregnancy data for follow-up, support and collaboration on low-risk pregnancies;
- **Born in Belgium (BIB)** (RIZIV) — pregnancy data (screening) for integrated care of high-risk pregnancies in vulnerable women;
- **Zoet Zwanger** (Diabetes Liga) — pregnancy data (screening) for follow-up of women with pregnancy-diabetes;
- **PALS Initiative** (Stad Gent / District09) — *Pro-Actieve dienstverlening rond Life-event Services* (including pregnancy and child birth);
- **AZ Turnhout** pilot to digitalize the *moeder/kind boekje* using SOLID principles.

These projects are *related* but not direct dependencies of the current pilot.

## Stakeholders

- Digitaal Vlaanderen
- Departement Zorg
- Vitalink
- Opgroeien / VUTG
- Pilot EMR/hospital partners — short term: AZ Sint Maarten and Nexuzhealth KWS; long term: EMRs of all hospitals and other healthcare providers
- Citizen platforms — MijnGezondheid.be, MijnBurgerProfiel.be, …
- Domain experts — Consortium SNOMED-CT, HL7, and relevant work groups

## Status

This IG is in **draft** status. Content, profiles, terminology bindings and examples are subject to change. Feedback is welcome via the issue tracker of this IG repository.
