unit UMenuPricipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, System.Actions,
  Vcl.ActnList, Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    MainMenu1: TMainMenu;
    CadastrarUsuario1: TMenuItem;
    ActionList1: TActionList;
    ImList: TImageList;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    CadastrarUsuario: TAction;
    CadastrarUsuario2: TMenuItem;
    procedure CadastrarUsuarioExecute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses UCadUsuario;



procedure TForm1.CadastrarUsuarioExecute(Sender: TObject);
begin
  Form_CadUsuario := TForm_CadUsuario.Create(Self);
  Form_CadUsuario.ShowModal;
  Form_CadUsuario.Release;
  Form_CadUsuario := nil;
end;

end.
