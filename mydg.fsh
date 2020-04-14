

// Profile:        MyReport
// Parent:         DiagnosticReport    
// Id:             mydiagnosticreport
// Title:          "My Diagnostic Report"
// Description:    "Profile of Diagnostic Report"
// * code.coding ^slicing.discriminator.type = #pattern
// * code.coding ^slicing.discriminator.path = "system"
// * code.coding ^slicing.rules = #open
// * code.coding ^slicing.description = "slicing system"
// * code.coding contains 
//     MasterGeneticPanel 1..1 and
//     HLAGeneGroup 1..1
// * code.coding[MasterGeneticPanel].system = "http://loinc.org" (exactly)
// * code.coding[MasterGeneticPanel].code = #81247-9 (exactly) // "Master HL7 genetic variant reporting panel"
// * code.coding[HLAGeneGroup].system = "http://www.genenames.org/genegroup" (exactly)
// * code.coding[HLAGeneGroup].code = #588 (exactly) // HLA Gene Group

// Profile:        MyObservation
// Parent:         Observation    
// Id:             myobservation
// Title:          "My Observation"
// Description:    "Profile of Observation"
// * code ^patternCodeableConcept = LNC#84413-4 // Genotype display name
// * component ^slicing.discriminator.type = #pattern
// * component ^slicing.discriminator.path = "code"
// * component ^slicing.rules = #open
// * component ^slicing.ordered = false
// * component ^slicing.description = "Slice based on component.code pattern"
// * component contains
//     gene-studied 1..1 MS
// * component[gene-studied].code = LNC#48018-6 // Gene studied [ID]
// * component[gene-studied].value[x] only CodeableConcept
// * component[gene-studied].valueCodeableConcept from HLAGeneIdVS
// * value[x] only CodeableConcept
// * valueCodeableConcept 1..1
// * valueCodeableConcept ^patternCodeableConcept.coding.system = "http://glstring.org"

// Instance:    MyReportExample
// InstanceOf:  mydiagnosticreport
// Usage:       #example
// Title:       "My Report Example"
// Description: "Example of Report"
// * code.coding[HLAGeneGroup] = GeneGroupCS#588 // "Histocompatibility complex (HLA)"
// * code.coding[MasterGeneticPanel] = LNC#81247-9 // "Master HL7 genetic variant reporting panel"
// * status = #final
// * subject.type = "Patient"
// * subject.identifier.system = "http://example.org/mysubject_identifers"
// * subject.identifier.value = "1234"