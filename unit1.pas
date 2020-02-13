unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    cosinus: TButton;
    sinus: TButton;
    koren: TButton;
    Label1: TLabel;
    mult: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    clear: TButton;
    Button2: TButton;
    equal: TButton;
    plus: TButton;
    minus: TButton;
    Button6: TButton;
    Button7: TButton;
    division: TButton;
    Button9: TButton;
    Edit1: TEdit;
    procedure digitClick(Sender: TObject);
    procedure clearClick(Sender: TObject);
    procedure equalClick(Sender: TObject);
    procedure equalCalculate;
    procedure funcClick(Sender: TObject);
    procedure operationClick(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  last: real = 0;
  oper: longint = -1;
  newstr: boolean = true;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.digitClick(Sender: TObject);
begin
  if newstr = true then begin
    Edit1.Text := '';
    newstr := false;
  end;
  Edit1.Text := Edit1.Text + TButton(Sender).Caption;

end;

procedure TForm1.clearClick(Sender: TObject);
begin
  Edit1.Text := '';
  oper := -1;
end;

procedure TForm1.equalClick(Sender: TObject);
begin
     equalcalculate;
     oper := -1;
end;

procedure TForm1.equalCalculate;
begin
  if (oper = 0) then
     last := last + StrToInt(Edit1.Text)
  else if (oper = 1) then
     last := last - StrToInt(Edit1.Text)
  else if (oper = 2) then
     last := last * StrToInt(Edit1.Text)
  else if (oper = 3) then
     last := last / StrToInt(Edit1.Text)
  else if (oper = 100) then
     last := sqrt(StrToInt(Edit1.Text))
  else if (oper = 101) then
     last := cos(StrToFloat(Edit1.Text))
  else if (oper = 102) then
     last := sin(StrToFloat(Edit1.Text));
  Edit1.Text := FloatToStr(last);
end;

procedure TForm1.funcClick(Sender: TObject);
begin
   if TButton(Sender).Caption = '√' then
     oper := 100
   else if TButton(Sender).Caption = 'cos' then
     oper := 101
   else if TButton(Sender).Caption = 'sin' then
     oper := 102;
   equalCalculate;
   newstr := true;
end;

procedure TForm1.operationClick(Sender: TObject);
begin
  if (oper = -1) then begin
    last := StrToFloat(Edit1.Text);
  end
  else begin
    equalCalculate;
  end;
  if TButton(Sender).Caption = '+' then
     oper := 0
  else if TButton(Sender).Caption = '-' then
     oper := 1
  else if TButton(Sender).Caption = '*' then
     oper := 2
  else if TButton(Sender).Caption = '/' then
     oper := 3;
  newstr := true;
end;

end.

