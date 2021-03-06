unit ListViewSimple;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.ListView.Types,
  Data.Bind.GenData, Fmx.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope, FMX.ListView, FMX.StdCtrls, FMX.MobilePreview;

type
  TSimpleListViewDelete = class(TForm)
    TopToolbar: TToolBar;
    BottomToolbar: TToolBar;
    TitleLabel: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    EditButton: TSpeedButton;
    BindingsList1: TBindingsList;
    LinkFillControlToField1: TLinkFillControlToField;
    ListView1: TListView;
    LinkFillControlToField2: TLinkFillControlToField;
    DoneButton: TSpeedButton;
    DeleteButton: TSpeedButton;
    procedure EditButtonClick(Sender: TObject);
    procedure DoneButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SimpleListViewDelete: TSimpleListViewDelete;

implementation

{$R *.fmx}

procedure TSimpleListViewDelete.EditButtonClick(Sender: TObject);
begin
  ListView1.EditMode := True;
  DoneButton.Visible := True;
  DeleteButton.Visible := True;
  EditButton.Visible := False;
end;

procedure TSimpleListViewDelete.DeleteButtonClick(Sender: TObject);
var
  I: integer;
begin
  ListView1.BeginUpdate;
  try
 for I in ListView1.Items.CheckedIndexes do
    ListView1.Items.Delete(I);

  finally
  ListView1.EndUpdate;
  end;
end;

procedure TSimpleListViewDelete.DoneButtonClick(Sender: TObject);
begin
  ListView1.EditMode := False;
  DoneButton.Visible := False;
  DeleteButton.Visible := False;
  EditButton.Visible := True;
end;

end.
