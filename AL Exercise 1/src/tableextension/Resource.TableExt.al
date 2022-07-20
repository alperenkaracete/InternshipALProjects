tableextension 70000 "Resource" extends Resource
{
    fields
    {
        field(50150; "Internal/External"; Option)
        {

            DataClassification = CustomerContent;
            OptionMembers = "Internal","External";
            OptionCaption = 'Internal,External';
            Caption = 'Internal-External Operations';
        }
        field(50151; "Maximum Participants"; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Maximum Participants';

        }
        field(50152; "Quantity Per Day"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Quantity Per Day';
        }
    }

    var

}