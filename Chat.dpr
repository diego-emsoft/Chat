program Chat;

uses
  System.StartUpCopy,
  FMX.Forms,
  uMain in 'uMain.pas' {ViewChat};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TViewChat, ViewChat);
  Application.Run;
end.
