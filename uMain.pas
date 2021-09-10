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
      procedure DrawContactsMsg;
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

procedure TViewChat.DrawContactsMsg;
var
   vContactCard, vContactText, vTopContent, vBottomContent: TRectangle;
   vProfileIcon: TCircle;
   vTitle, vDateMsg: TLabel;
begin
   // Create a base Card
   vContactCard := TRectangle.Create(VertScrollBox);
   vContactCard.Height := 70;
   vContactCard.Align := TAlignLayout.Top;
   vContactCard.Stroke.Kind := TBrushKind.None;
   vContactCard.Fill.Color := $FFF2F2F2;
   vContactCard.Margins.Top := 5;
   vContactCard.Margins.Bottom := 5;
   vContactCard.Padding.Top := 5;
   vContactCard.Padding.Bottom := 5;
   vContactCard.Padding.Right := 10;
   vContactCard.Padding.Left := 10;
   vContactCard.Cursor := crHandPoint;

   vProfileIcon := TCircle.Create(vContactCard);
   vProfileIcon.Width := 40;
   vProfileIcon.Align := TAlignLayout.Left;
   vProfileIcon.Fill.Color := $FFA1A1A1;
   vProfileIcon.Stroke.Kind := TBrushKind.None;
   vContactCard.AddObject(vProfileIcon);

   // Create a content info
   vContactText := TRectangle.Create(vContactCard);
   vContactText.Align := TAlignLayout.Client;
   vContactText.Fill.Color := $FFF2F2F2;
   vContactText.Margins.Left := 5;
   vContactText.Stroke.Kind := TBrushKind.None;
   vContactCard.AddObject(vContactText);

   // Create a top content text
   vTopContent := TRectangle.Create(vContactCard);
   vTopContent.Align := TAlignLayout.Top;
   vTopContent.Height := 25;
   vTopContent.Fill.Color := $FFF2F2F2;
   vTopContent.Stroke.Kind := TBrushKind.None;
   vContactText.AddObject(vTopContent);

   vTitle := TLabel.Create(vTopContent);
   vTitle.Align := TAlignLayout.FitLeft;
   vTitle.Width := 111;
   vTitle.TextSettings.Font.Family := 'Roboto';
   vTitle.TextSettings.Font.Size := 14;
   vTitle.TextSettings.Font.Style := [TFontStyle.fsBold];
   vTitle.Text := 'Nome do candango!';
   vTopContent.AddObject(vTitle);

   vDateMsg := TLabel.Create(vTopContent);
   vDateMsg.Align := TAlignLayout.Client;
   vDateMsg.TextSettings.Font.Family := 'Roboto';
   vDateMsg.TextSettings.Font.Size := 14;
   vDateMsg.TextSettings.FontColor := $FFA8A6A6;
   vDateMsg.TextSettings.HorzAlign := TTextAlign.Trailing;
   vDateMsg.TextSettings.VertAlign := TTextAlign.Leading;
   vDateMsg.TextSettings.Font.Style := [TFontStyle.fsBold];
   vDateMsg.Text := '15:25';
   vTopContent.AddObject(vDateMsg);

   // Create a bottom content text
   vBottomContent := TRectangle.Create(vContactCard);
   vBottomContent.Align := TAlignLayout.Client;
   vBottomContent.Height := 25;
   // vBottomContent.Fill.Color := $FFF2F2F2;
   vBottomContent.Fill.Color := $FFFFF2F2;
   vBottomContent.Stroke.Kind := TBrushKind.None;
   vContactText.AddObject(vBottomContent);

   VertScrollBox.AddObject(vContactCard);
end;

procedure TViewChat.FormShow(Sender: TObject);
begin
   fOnline := false;
   DrawContactsMsg;
end;

end.
