Alias: LNC = http://loinc.org
Alias: HGNCGeneID = http://www.genenames.org/geneId
Alias: HGNCGeneGroup = http://www.genenames.org/genegroup

Profile:        MyObservation
Parent:         Observation    
Id:             myobservation
Title:          "My Observation"
Description:    "Profile of Observation"
* code ^patternCodeableConcept = LNC#84413-4 // Genotype display name
* component ^slicing.discriminator.type = #pattern
* component ^slicing.discriminator.path = "code"
* component ^slicing.rules = #open
* component ^slicing.ordered = false
* component ^slicing.description = "Slice based on component.code pattern"
* component contains
    gene-studied 1..1 MS
* component[gene-studied].code = LNC#48018-6 // Gene studied [ID]
* component[gene-studied].value[x] only CodeableConcept
* component[gene-studied].valueCodeableConcept from HLAGeneIdVS
* value[x] only CodeableConcept
* valueCodeableConcept 1..1
* valueCodeableConcept ^patternCodeableConcept.coding.system = "http://glstring.org"

Instance:   MyObservationExample
InstanceOf: myobservation
Usage: #example
Title:      "HLA-A Genotype Example"
Description: "Example of HLA-A genotyping using IMGT/HLA 3.25 nomenclature"
* status = #final
* valueCodeableConcept.coding.system = "http://glstring.org"
* valueCodeableConcept.coding.code = #hla#3.25.0#HLA-A*01:01:01:01+HLA-A*01:02
* component[gene-studied].valueCodeableConcept.coding.system =  "http://www.genenames.org/geneId"
* component[gene-studied].valueCodeableConcept.coding.code =  #HGNC:4931 
* component[gene-studied].valueCodeableConcept.coding.display = "HLA-A"

ValueSet:  HLAGeneIdVS
Title: "HLA Gene Name Value Set"
Id: hla-geneid-valueset
Description:  "HLA HGNC GeneIds Value Set"
* HGNCGeneID#HGNC:4931   "HLA-A"
* HGNCGeneID#HGNC:4932   "HLA-B"
* HGNCGeneID#HGNC:4933   "HLA-C"
// * ^compose.include.system = "http://www.genenames.org/geneId"
// * ^compose.include.concept[0].code = #HGNC:4931
// * ^compose.include.concept[0].display = "HLA-A"
// * ^compose.include.concept[1].code = #HGNC:4932
// * ^compose.include.concept[1].display = "HLA-B"
// * ^compose.include.concept[2].code = #HGNC:4933
// * ^compose.include.concept[2].display = "HLA-C"

CodeSystem: HLAGeneIdCS
Title: "HLA HGNC GeneID CodeSystem"
Id: hla-genename-codesystem
Description: "CodeSystem of HLA gene group subset of HGNC GeneId Codesystem"
* ^url = "http://www.genenames.org/geneId"
* ^version = "2020"
* ^status = #active
* ^experimental = false
* ^publisher = "NMDP/CIBMTR"
* ^copyright = "National Human Genome Research Institute (NHGRI)"
* ^content = #fragment
* #HGNC:4931  "HLA-A"     "major histocompatibility complex, class I, A"
* #HGNC:4932  "HLA-B"     "major histocompatibility complex, class I, B"
* #HGNC:4933  "HLA-C"     "major histocompatibility complex, class I, C"
* #HGNC:4934  "HLA-DMA"   "major histocompatibility complex, class II, DM alpha"
* #HGNC:4935  "HLA-DMB"   "major histocompatibility complex, class II, DM beta"
* #HGNC:4936  "HLA-DOA"   "major histocompatibility complex, class II, DO alpha"
* #HGNC:4937  "HLA-DOB"   "major histocompatibility complex, class II, DO beta"
* #HGNC:4938  "HLA-DPA1"  "major histocompatibility complex, class II, DP alpha 1"
* #HGNC:4939  "HLA-DPA2"  "major histocompatibility complex, class II, DP alpha 2 (pseudogene)"
* #HGNC:19393 "HLA-DPA3"  "major histocompatibility complex, class II, DP alpha 3 (pseudogene)"
* #HGNC:4940  "HLA-DPB1"  "major histocompatibility complex, class II, DP beta 1"
* #HGNC:4941  "HLA-DPB2"  "major histocompatibility complex, class II, DP beta 2 (pseudogene)"
* #HGNC:4942  "HLA-DQA1"  "major histocompatibility complex, class II, DQ alpha 1"
* #HGNC:4943  "HLA-DQA2"  "major histocompatibility complex, class II, DQ alpha 2"
* #HGNC:4944  "HLA-DQB1"  "major histocompatibility complex, class II, DQ beta 1"
* #HGNC:4945  "HLA-DQB2"  "major histocompatibility complex, class II, DQ beta 2"
* #HGNC:4946  "HLA-DQB3"  "major histocompatibility complex, class II, DQ beta 3"
* #HGNC:4947  "HLA-DRA"   "major histocompatibility complex, class II, DR alpha"
* #HGNC:4948  "HLA-DRB1"  "major histocompatibility complex, class II, DR beta 1"
* #HGNC:4950  "HLA-DRB2"  "major histocompatibility complex, class II, DR beta 2 (pseudogene)"
* #HGNC:4951  "HLA-DRB3"  "major histocompatibility complex, class II, DR beta 3"
* #HGNC:4952  "HLA-DRB4"  "major histocompatibility complex, class II, DR beta 4"
* #HGNC:4953  "HLA-DRB5"  "major histocompatibility complex, class II, DR beta 5"
* #HGNC:4954  "HLA-DRB6"  "major histocompatibility complex, class II, DR beta 6 (pseudogene)"
* #HGNC:4955  "HLA-DRB7"  "major histocompatibility complex, class II, DR beta 7 (pseudogene)"
* #HGNC:4956  "HLA-DRB8"  "major histocompatibility complex, class II, DR beta 8 (pseudogene)"
* #HGNC:4957  "HLA-DRB9"  "major histocompatibility complex, class II, DR beta 9 (pseudogene)"

CodeSystem: GLStringCS
Title: "Genotype List String Code CodeSystem"
Id: glstring-codesystem
Description: "Genotype List String Codesystem used for HLA reporting"
* ^url = "http://glstring.org"
* ^compositional = true
* ^version = "1.0"
* ^status = #active
* ^copyright = "National Marrow Donor Program"
* ^publisher = "NMDP/CIBMTR"
* ^content = #not-present