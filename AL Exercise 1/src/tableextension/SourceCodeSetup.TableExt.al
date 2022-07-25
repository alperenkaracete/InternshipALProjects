tableextension 50180 "SourceCodeSetup" extends "Source Code Setup"
{
    fields
    {

        field(50156; "Seminar"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Source Code";
        }

    }

    var
        myInt: Integer;
}