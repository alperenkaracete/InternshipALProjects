page 50102 "Seminar Manager Role Center"
{
    PageType = RoleCenter;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "My Seminar";
    Description = 'Seminar Manager Role Center';
    Caption = 'Seminar Manager Role Center';

    layout
    {
        area(RoleCenter)
        {


            group("Control1")
            {

                part(Activities; "Seminar Manager Activities")
                {

                    ApplicationArea = All;
                    Caption = 'Seminar Manager Activities';
                }

                systempart(Outlook; Outlook)
                {

                    ApplicationArea = All;

                }
            }

            group("Control2")
            {
                Caption = 'Control2';

                part(MySeminars; "My Seminars")
                {
                    ApplicationArea = All;
                    Caption = 'My Seminars';
                }
                part(MyCustomers; "My Customers")
                {
                    ApplicationArea = All;
                    Caption = 'My Customers';
                }

                systempart(MyNotes; MyNotes)
                {
                    ApplicationArea = All;
                }
            }
        }


    }

    actions
    {
        area(Processing)
        {
            action("Seminar Registrations")
            {
                ApplicationArea = All;

                RunObject = page "Seminar Registration List";
                Caption = 'Seminar Registrations';
                ToolTip = 'Executes the Seminar Registrations action.';
            }
            action("Seminars")
            {
                ApplicationArea = All;

                RunObject = page "Seminar List";
                Caption = 'Seminars';
                ToolTip = 'Executes the Seminars action.';
            }
            action("Instructor")
            {
                ApplicationArea = All;

                RunObject = page "Resource List";
                RunPageView = where(Type = const(Machine));
                Caption = 'Instructor';
                ToolTip = 'Executes the Instructor action.';
            }
            action("Rooms")
            {
                ApplicationArea = All;

                RunObject = page "Resource List";
                RunPageView = where(Type = const(Person));
                Caption = 'Rooms';
                ToolTip = 'Executes the Rooms action.';
            }
            action("Customer")
            {
                ApplicationArea = All;

                RunObject = page "Customer List";
                Caption = 'Customer';
                ToolTip = 'Executes the Customer action.';
            }
            action("Contacts")
            {
                ApplicationArea = All;

                RunObject = page "Contact List";
                Caption = 'Contacts';
                ToolTip = 'Executes the Contacts action.';
            }
            group("Posted Documents")
            {
                Caption = 'Posted Documents';
                action("Posted Seminar Registrations")
                {

                    ApplicationArea = All;
                    RunObject = page "Posted Seminar Reg. List";
                    Caption = 'Posted Seminar Registrations';
                    ToolTip = 'Executes the Posted Seminar Registrations action.';
                }

                action("Posted Sales Invoice")
                {

                    ApplicationArea = All;
                    RunObject = page "Posted Sales Invoice";
                    Caption = 'Posted Sales Invoice';
                    ToolTip = 'Executes the Posted Sales Invoice action.';
                }

                action("Registers")
                {

                    ApplicationArea = All;
                    RunObject = page "Seminar Registers";
                    Caption = 'Registers';
                    ToolTip = 'Executes the Registers action.';
                }

            }
            group("New Document Items")
            {
                Caption = 'New Document Items';

                action("Seminar Registration")
                {
                    ApplicationArea = All;
                    Image = NewTimesheet;
                    RunObject = page "Seminar Registration";
                    RunPageMode = Create;
                    Caption = 'Seminar Registration';
                    ToolTip = 'Executes the Seminar Registration action.';
                }

                action("Sales Invoice")
                {
                    ApplicationArea = All;
                    Image = NewInvoice;
                    RunObject = page "Sales Invoice";
                    RunPageMode = Create;
                    Caption = 'Sales Invoice';
                    ToolTip = 'Executes the Sales Invoice action.';

                }
            }

            group("Action Items")
            {
                Caption = 'Action Items';

                action("Create Invoices")
                {
                    ApplicationArea = All;
                    RunObject = report "Create Seminar Invoices";
                    Image = CreateJobSalesInvoice;
                    RunPageMode = Create;
                    Caption = 'Create Invoices';
                    ToolTip = 'Executes the Create Invoices action.';
                }
            }

            group("Reports")
            {
                Caption = 'Reports';

                /*action("Participant List")
                {
                    ApplicationArea = All;
                    RunObject = report;
                }*/
            }

        }



    }

    var
        myInt: Integer;
}