page 50505 "Seminar Registration Subform"
{
    PageType = ListPart;
    DelayedInsert = true;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "Seminar Registration Line";
    AutoSplitKey = true;
    Caption = 'Lines';


    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                Caption = 'Group';
                field("Bill-to Customer No."; Rec."Bill-to Customer No.")
                {
                    ApplicationArea = All;
                    Caption = 'Bill-to Customer No.';
                    ToolTip = 'Specifies the value of the Bill-to Customer No. field.';
                    trigger OnValidate()
                    var
                        myInt: Integer;
                    begin
                        Rec.ShowShortcutDimCode(ShortcutDimCode);
                    end;

                }
                field("Participant Contact No."; Rec."Participant Contact No.")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Contact No.';
                    ToolTip = 'Specifies the value of the Participant Contact No. field.';

                }
                field("Participant Name"; Rec."Participant Name")
                {
                    ApplicationArea = All;
                    Caption = 'Participant Name';
                    ToolTip = 'Specifies the value of the Participant Name field.';

                }
                field(Participated; Rec.Participated)
                {
                    ApplicationArea = All;
                    Caption = 'Participated';
                    ToolTip = 'Specifies the value of the Participated field.';

                }
                field("Registration Date"; Rec."Registration Date")
                {
                    ApplicationArea = All;
                    Caption = 'Registration Date';
                    ToolTip = 'Specifies the value of the Registration Date field.';

                }
                field("Confirmation Date"; Rec."Confirmation Date")
                {
                    ApplicationArea = All;
                    Caption = 'Confirmation Date';
                    ToolTip = 'Specifies the value of the Confirmation Date field.';

                }
                field("To Invoice"; Rec."To Invoice")
                {
                    ApplicationArea = All;
                    Caption = 'To Invoice';
                    ToolTip = 'Specifies the value of the To Invoice field.';

                }
                field(Registered; Rec.Registered)
                {
                    ApplicationArea = All;
                    Caption = 'Registered';
                    ToolTip = 'Specifies the value of the Registered field.';

                }
                field("Seminar Price"; Rec."Seminar Price")
                {
                    ApplicationArea = All;
                    Caption = 'Seminar Price';
                    ToolTip = 'Specifies the value of the Seminar Price field.';

                }
                field("Line Discount %"; Rec."Line Discount %")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount';
                    ToolTip = 'Specifies the value of the Line Discount field.';

                }
                field("Line Discount Amount"; Rec."Line Discount Amount")
                {
                    ApplicationArea = All;
                    Caption = 'Line Discount Amount';
                    ToolTip = 'Specifies the value of the Line Discount Amount field.';

                }
                field("Shortcut Dimension 1 Code"; Rec."Shortcut Dimension 1 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 1, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Caption = 'Shortcut Dimension 1 Code';

                }
                field("Shortcut Dimension 2 Code"; Rec."Shortcut Dimension 2 Code")
                {
                    ApplicationArea = Dimensions;
                    ToolTip = 'Specifies the code for Shortcut Dimension 2, which is one of two global dimension codes that you set up in the General Ledger Setup window.';
                    Caption = 'Shortcut Dimension 2 Code';

                }
                field(ShortcutDimCode3; ShortcutDimCode[3])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,3';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(3),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[3]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[3] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(3, ShortcutDimCode[3]);
                    end;
                }
                field(ShortcutDimCode4; ShortcutDimCode[4])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,4';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(4),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[4]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[4] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(4, ShortcutDimCode[4]);
                    end;
                }
                field(ShortcutDimCode5; ShortcutDimCode[5])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,5';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(5),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[5]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[5] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(5, ShortcutDimCode[5]);
                    end;
                }
                field(ShortcutDimCode6; ShortcutDimCode[6])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,6';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(6),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[6]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[6] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(6, ShortcutDimCode[6]);
                    end;
                }
                field(ShortcutDimCode7; ShortcutDimCode[7])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,7';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(7),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[7]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[7] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(7, ShortcutDimCode[7]);
                    end;
                }
                field(ShortcutDimCode8; ShortcutDimCode[8])
                {
                    ApplicationArea = Dimensions;
                    CaptionClass = '1,2,8';
                    TableRelation = "Dimension Value".Code WHERE("Global Dimension No." = CONST(8),
                                                                  "Dimension Value Type" = CONST(Standard),
                                                                  Blocked = CONST(false));
                    Caption = 'ShortcutDimCode[8]';
                    ToolTip = 'Specifies the value of the ShortcutDimCode[8] field.';


                    trigger OnValidate()
                    begin
                        DimMgt.ValidateDimValueCode(8, ShortcutDimCode[8]);
                    end;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {

            group(Line)
            {
                Caption = 'Line';

                action(Dimensions)
                {
                    ApplicationArea = All;
                    Caption = 'Dimensions';
                    ToolTip = 'Executes the Dimensions action.';

                    trigger OnAction()
                    begin
                        Rec.ShowDimensions;
                    end;
                }
            }

        }
    }

    trigger OnAfterGetRecord()
    var
        myInt: Integer;
    begin
        Rec.ShowShortcutDimCode(ShortcutDimCode);
    end;

    trigger OnNewRecord(bool: Boolean)
    var
        myInt: Integer;
    begin
        CLEAR(ShortcutDimCode);
    end;

    var
        ShortcutDimCode: array[8] of Code[20];
        DimMgt: Codeunit DimensionManagement;
}