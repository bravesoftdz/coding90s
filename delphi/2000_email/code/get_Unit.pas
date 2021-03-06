unit get_Unit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Psock, NMpop3, Grids, ComCtrls;

type
  TGet = class(TForm)
    Button1: TButton;
    ListView: TListView;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
  end;

var
  Get: TGet;

implementation

uses User_Unit, main_Unit;

{$R *.DFM}

procedure TGet.Button1Click(Sender: TObject);
  var A : integer;
begin
   main.pop3.Host := user.pop3server.text;
   main.pop3.Password := user.passwort.Text;
   if user.Konto.text <> '' then main.pop3.UserID := user.Konto.text else main.pop3.UserID := user.adresse.Text;

   main.pop3.Connect;
   For A := 1 to main.pop3.MailCount Do
   Begin;
     main.pop3.GetSummary(A);
     Listview.Items.Add.Caption := main.Pop3.Summary.Header.Values['from'];
     Listview.Items.Item[A - 1].SubItems.add(main.Pop3.Summary.Header.Values['subject']);
     Listview.Items.Item[A - 1].SubItems.add(main.Pop3.Summary.Header.Values['']);
     Listview.Items.Item[A - 1].SubItems.add(main.Pop3.Summary.Header.Values['Date']);
   End;
   main.pop3.Disconnect;
 end;


procedure TGet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Main.enabled := true;
end;

end.
