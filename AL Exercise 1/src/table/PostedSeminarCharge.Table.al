table 50187 "Posted Seminar Charge"

{
    Caption = 'Posted Seminar Charge';


    fields
    {
        field(1; "Document No."; Code[20])
        {
            TableRelation = "Posted Seminar Reg. Header";
            NotBlank = true;
            Caption = 'Document No.';
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            trigger OnValidate()
            BEGIN
                IF Type <> xRec.Type THEN BEGIN
                    Description := '';
                END;
            END;
        }
        field(3; "Type"; Option)
        {
            OptionCaption = 'Resource,G/L Account';
            OptionMembers = "Resource","G/L Account";
            Caption = 'Type';

        }
        field(4; "No."; Code[20])
        {
            TableRelation = IF (Type = CONST(Resource)) Resource."No."
            ELSE
            IF (Type = CONST("G/L Account")) "G/L Account"."No.";
            Caption = 'No.';

        }
        field(5; "Description"; Text[50])
        {
            Caption = 'Description';

        }
        field(6; "Quantitiy"; Decimal)
        {
            DecimalPlaces = 0 : 5;
            Caption = 'Quantitiy';
            trigger OnValidate()
            BEGIN
                "Total Price" := ROUND("Unit Price" * Quantitiy, 0.01);
            END;

        }
        field(7; "Unit Price"; Decimal)
        {
            MinValue = 0;
            AutoFormatType = 2;
            Caption = 'Unit Price';
            trigger OnValidate()
            begin
                "Total Price" := ROUND("Unit Price" * Quantitiy, 0.01);
            end;

        }
        field(8; "Total Price"; Decimal)
        {
            Editable = false;
            AutoFormatType = 1;
            Caption = 'Total Price';
        }
        field(9; "To Invoice"; Boolean)
        {
            InitValue = true;
            Caption = 'To Invoice';
        }
        field(10; "Bill-to Customer No."; Code[20])
        {
            TableRelation = Customer."No.";
            Caption = 'Bill-to Customer No.';
        }
        field(11; "Unit of Measure Code"; Code[10])
        {
            TableRelation = if (Type = CONST(Resource)) "Resource Unit of Measure".Code WHERE("Resource No." = field("No."))
            else
            "Unit of Measure".Code;
            Caption = 'Unit of Measure Code';

        }
        field(12; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group"."Code";
            Caption = 'Gen. Prod. Posting Group';
        }
        field(13; "VAT Prod. Posting Group"; Code[10])
        {
            TableRelation = "VAT Product Posting Group"."Code";
            Caption = 'VAT Prod. Posting Group';
        }
        field(14; "Qty. per Unit of Measure"; Decimal)
        {
            Caption = 'Qty. per Unit of Measure';

        }
        field(15; Registered; Boolean)
        {
            Editable = false;
            Caption = 'Registered';
        }
    }

    keys
    {
        key(Key1; "Document No.", "Line No.")
        {
            Clustered = true;
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
        TESTFIELD(Registered, FALSE);
    end;

    trigger OnRename()
    begin

    end;

}