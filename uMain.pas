unit uMain;

interface

uses
   System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
   FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
   FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Layouts, FMX.Edit, FMX.Effects;

type
   TViewChat = class(TForm)
      ProfileCard: TRectangle;
      ProfileImg: TCircle;
      LbNameProfile: TLabel;
      LbOffice: TLabel;
      BtnOnOffLine: TRoundRect;
      BtnOnlineCircle: TCircle;
      LbOnline: TLabel;
    Contacts: TRectangle;
    Message: TRectangle;
    SideLeft: TRectangle;
    VertScrollBox: TVertScrollBox;
    EdtType: TEdit;
    RoundRect1: TRoundRect;
    RoundRect2: TRoundRect;
    ShadowEffect1: TShadowEffect;
    ShadowEffect2: TShadowEffect;
    ScrollMessage: TVertScrollBox;
    ImgSend: TImage;
    EdtMessage: TRoundRect;
    RoundRect3: TRoundRect;
    Label1: TLabel;
    ContactCard: TRectangle;
    ProfileIcon: TCircle;
    ContactText: TRectangle;
    Title: TLabel;
    Text: TLabel;
    DateText: TLabel;
    TopContent: TRectangle;
    BottomContent: TRectangle;
    CountMsg: TCircle;
    CountMsgText: TLabel;
      procedure BtnOnOffLineClick(Sender: TObject);
      procedure FormShow(Sender: TObject);
   private
      { Private declarations }
      fOnline: Boolean;
   public
      { Public declarations }
   end;

var
   ViewChat: TViewChat;

implementation

{$R *.fmx}

procedure TViewChat.BtnOnOffLineClick(Sender: TObject);
begin
   if fOnline then
   begin
      fOnline := false;
      BtnOnOffLine.Fill.Color := $FF00FF00;
      LbOnline.Text := 'ON';
      LbOnline.TextAlign := TTextAlign.Trailing;
      BtnOnlineCircle.Align := TAlignLayout.FitLeft;
   end
   else
   begin
      fOnline := true;
      BtnOnOffLine.Fill.Color := $FFFF0000;
      LbOnline.Text := 'OFF';
      LbOnline.TextAlign := TTextAlign.Leading;
      BtnOnlineCircle.Align := TAlignLayout.FitRight;
   end;
end;

procedure TViewChat.FormShow(Sender: TObject);
begin
   fOnline := false;
end;

end.
