report 52000 "SeminarRegReport"

{
    UsageCategory = ReportsAndAnalysis;
    Caption = 'Seminar Reg.- Participant List';
    DefaultLayout = RDLC;
    ApplicationArea = All;

    RDLCLayout = 'SeminarRegReport.rdl';

    dataset
    {
        dataitem(SeminarRegHeader; "Seminar Registration Header")
        {
            RequestFilterFields = "No.", "Seminar No.";
            DataItemTableView = SORTING("No.");
            PrintOnlyIfDetail = false;
            MaxIteration = 0;

            column(No_; "No.")
            {

                IncludeCaption = true;

            }
            column(Seminar_No_; "Seminar No.")
            {
                IncludeCaption = true;


            }
            column(Seminar_Name; "Seminar Name")
            {

                IncludeCaption = true;

            }
            column(Starting_Date; "Starting Date")
            {

                IncludeCaption = true;

            }
            column(Duration; Duration)
            {

                IncludeCaption = true;

            }
            column(Instructor_Name; "Instructor Name")
            {

                IncludeCaption = true;

            }
            column(Room_Name; "Room Name")
            {
                IncludeCaption = true;


            }

            trigger OnAfterGetRecord()
            var
                myInt: Integer;
            begin
                CALCFIELDS("Instructor Name");
            end;

        }

        dataitem(SeminarRegLine; "Seminar Registration Line")
        {
            DataItemTableView = sorting("Document No.", "Line No.");
            DataItemLinkReference = SeminarRegHeader;
            DataItemLink = "Document No." = field("No.");
            column(Bill_to_Customer_No_; "Bill-to Customer No.")
            {
                IncludeCaption = true;
            }
            column(Participant_Contact_No_; "Participant Contact No.")
            {
                IncludeCaption = true;

            }
            column(Participant_Name; "Participant Name")
            {
                IncludeCaption = true;

            }

        }

        dataitem(Integer; Integer)
        {
            DataItemTableView = WHERE(Number = CONST(1));

            column(CompanyInfo; CompanyInfo.Name)
            {
                IncludeCaption = true;

            }

            trigger OnPreDataItem()
            var
            begin
                CompanyInfo.Get();

            end;

        }

    }

    labels
    {

        LabelName = 'Seminar Registration Header', Comment = 'Header';
    }

    var
        SeminarRegistrationHeader: Label 'Seminar Registration Header';
        CompanyInfo: Record "Company Information";
}
