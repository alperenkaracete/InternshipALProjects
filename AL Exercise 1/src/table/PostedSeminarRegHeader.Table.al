table 50191 "Posted Seminar Reg. Header"
{
    DataClassification = CustomerContent;
    LookupPageId = "Posted Seminar Registration";
    DrillDownPageId = "Posted Seminar Registration";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';

        }
        field(2; "Starting Date"; Date)
        {
            Caption = 'Starting Date';

            trigger OnValidate()
            begin
                IF "Starting Date" <> xRec."Starting Date" THEN
                    TESTFIELD(Status, Status::Planning);
            end;

        }
        field(3; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
            TableRelation = Seminar;

        }
        field(4; "Seminar Name"; Text[50])
        {
            Caption = 'Seminar Name';


        }
        field(5; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor No.';
            TableRelation = Resource WHERE(Type = CONST(Person));
            trigger OnValidate()
            var
                myInt: Integer;
            begin
                BEGIN
                    CALCFIELDS("Instructor Name");
                END;
            end;

        }
        field(6; "Instructor Name"; Text[100])
        {
            Caption = 'Instructor Name';
            FieldClass = FlowField;
            CalcFormula = Lookup(Resource.Name WHERE("No." = FIELD("Instructor Resource No."), Type = CONST(Person)));

        }
        field(7; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

        }
        field(8; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(9; Status; Option)
        {

            OptionCaption = 'Planning,Registration,Closed,Canceled';
            OptionMembers = "Planning","Registration","Closed","Canceled";
            Caption = 'Status';
        }
        field(10; "Duration"; Decimal)
        {
            Caption = 'Duration';
            DecimalPlaces = 0 : 1;
        }
        field(11; "Minimum Participants"; Integer)
        {
            Caption = 'Minimum Participants';

        }
        field(12; "Maximum Participants"; Integer)
        {
            Caption = 'Maximum Participants';

        }
        field(13; "Room Resource No."; Code[20])
        {
            Caption = 'Room No.';
            TableRelation = Resource WHERE(Type = CONST(Machine));

        }
        field(14; "Room Name"; Text[30])
        {
            Caption = 'Room Name';

        }
        field(15; "Room Address"; Text[30])
        {
            Caption = 'Room Address';

        }
        field(16; "Room Address 2"; Text[30])
        {
            Caption = 'Room Address 2';

        }
        field(17; "Room Post Code"; Code[20])
        {
            Caption = 'Room Post Code';
            TableRelation = "Post Code"."Code";
            ValidateTableRelation = false;


        }
        field(18; "Room City"; Text[30])
        {
            Caption = 'Room City';


        }
        field(19; "Room Country/Reg. Code"; Code[10])
        {
            Caption = 'Room Country/Reg. Code';
            TableRelation = "Country/Region";

        }
        field(20; "Room County"; Text[30])
        {
            Caption = 'Room County';

        }
        field(21; "Gen. Prod. Posting Group"; Code[10])
        {
            Caption = 'Gen. Prod. Posting Group';
            TableRelation = "Gen. Product Posting Group"."Code";

        }
        field(22; "VAT Prod. Posting Group"; Code[10])
        {
            Caption = 'VAT Prod. Posting Group';
            TableRelation = "VAT Product Posting Group"."Code";

        }
        field(23; "Seminar Price"; Decimal)
        {
            Caption = 'Seminar Price';
            AutoFormatType = 1;

        }
        field(24; "Comment"; Boolean)
        {
            Caption = 'Posted Seminar Reg. Header';
            FieldClass = FlowField;
            CalcFormula = Exist("Seminar Comment Line" WHERE("Document Type" = CONST("Posted Seminar Registration"), "No." = FIELD("No.")));
            Editable = false;
        }
        field(25; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
            TableRelation = "Reason Code"."Code";

        }
        field(26; "No. Series"; Code[10])
        {
            Caption = 'No. Series';
            TableRelation = "No. Series"."Code";

        }
        field(27; "Registration No. Series"; Code[10])
        {
            Caption = 'Registration No. Series';
            TableRelation = "No. Series"."Code";


        }

        field(29; "User ID"; Code[20])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
            TestTableRelation = false;

        }
        field(30; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
            TableRelation = "Source Code";
        }
    }

    keys
    {
        key(Key1; "No.")
        {
            Clustered = true;
        }
        key(key2; "Room Resource No.")
        {
            SumIndexFields = Duration;
        }
    }

    var

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}
