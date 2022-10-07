program Project1;

uses
  Vcl.Forms,
  UMenuPricipal in 'UMenuPricipal.pas' {Form1},
  UCadUsuario in 'UCadUsuario.pas' {Form_CadUsuario},
  UDm in 'UDm.pas' {dm: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tdm, dm);
  Application.Run;
end.
