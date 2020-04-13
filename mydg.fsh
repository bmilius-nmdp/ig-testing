Alias: GeneGroupCS = http://www.genenames.org/genegroup
Alias: LNC = http://loinc.org

Profile:        MyReport
Parent:         DiagnosticReport    
Id:             mydiagnosticreport
Title:          "My Diagnostic Report"
Description:    "Profile of Diagnostic Report"
* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open
* code.coding ^slicing.description = "slicing system"
* code.coding contains 
    MasterGeneticPanel 1..1 and
    HLAGeneGroup 0..1
* code.coding[MasterGeneticPanel].system = "http://loinc.org" (exactly)
* code.coding[MasterGeneticPanel].code = #81247-9 (exactly) // "Master HL7 genetic variant reporting panel"
* code.coding[HLAGeneGroup].system = "http://www.genenames.org/genegroup" (exactly)
* code.coding[HLAGeneGroup].code = #588 (exactly) // HLA Gene Group


Instance:    MyReportExample
InstanceOf:  mydiagnosticreport
Usage:       #example
Title:       "My Report Example"
Description: "Example of Report"
* code.coding[HLAGeneGroup] = GeneGroupCS#588 // "Histocompatibility complex (HLA)"
* code.coding[MasterGeneticPanel] = LNC#81247-9 // "Master HL7 genetic variant reporting panel"
* status = #final
* subject.type = "Patient"
* subject.identifier.system = "http://example.org/mysubject_identifers"
* subject.identifier.value = "1234"
