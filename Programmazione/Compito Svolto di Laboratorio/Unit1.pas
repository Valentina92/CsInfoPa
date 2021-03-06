unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Grids, ComCtrls, Menus;

type

  matrice = array [0..50,0..10] of 0..3;

  rec = record
    nome: ShortString;
    mosse: integer;
    livello: integer;
    end;

  lista=^salva;
  salva=record
    nome: ShortString;
    mosse: integer;
    livello: integer;
    pun: lista;
    end;

  TForm1 = class(TForm)
    DrawGrid1: TDrawGrid;
    LabDischi: TLabel;
    BStart: TButton;
    BReset: TButton;
    BTorre1: TButton;
    BTorre2: TButton;
    BTorre3: TButton;
    Timer1: TTimer;
    LabTempo: TLabel;
    LabSecondi: TLabel;
    LabMosse: TLabel;
    LabContMosse: TLabel;
    LabNome: TLabel;
    EditNome: TEdit;
    BClassifica: TButton;
    TrackBar1: TTrackBar;
    LabLivelli: TLabel;
    MainMenu1: TMainMenu;
    SpiegazionedelGioco1: TMenuItem;
    Spiegazionedelgioco2: TMenuItem;
    N1: TMenuItem;
    Realizzatoda1: TMenuItem;
    LabTitolo: TLabel;
    BSalva: TButton;
    SaveDialog1: TSaveDialog;
    Esci2: TMenuItem;
    Soluzioni1: TMenuItem;
    Per3dischi1: TMenuItem;
    Per4dischi1: TMenuItem;
    Per5dischi1: TMenuItem;
    Per6dischi1: TMenuItem;
    Per7dischi1: TMenuItem;
    ProgressBar1: TProgressBar;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BStartClick(Sender: TObject);
    procedure BResetClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure BTorre1Click(Sender: TObject);
    procedure BTorre2Click(Sender: TObject);
    procedure BTorre3Click(Sender: TObject);
    procedure Spiegazionedelgioco2Click(Sender: TObject);
    procedure Realizzatoda1Click(Sender: TObject);
    procedure BSalvaClick(Sender: TObject);
    procedure BClassificaClick(Sender: TObject);
    procedure Esci2Click(Sender: TObject);
    procedure Per3dischi1Click(Sender: TObject);
    procedure Per4dischi1Click(Sender: TObject);
    procedure Per5dischi1Click(Sender: TObject);
    procedure Per6dischi1Click(Sender: TObject);
    procedure Per7dischi1Click(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
    procedure coloracella(coll,row: integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  mat: matrice;
  cont: integer;
  mosse: integer;
  h: file of rec;
  p: rec;
  l: lista;

implementation

uses Unit2,Unit3,Unit4,Unit5,Unit6,Unit7,Unit8;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i,j: integer;
begin

for i:=0 to 50 do
  for j:=0 to 10 do
    mat[i,j]:=0;
end;


procedure TForm1.coloracella(coll, row: integer);
begin

case mat[coll,row] of

0:  begin
    DrawGrid1.Canvas.Pen.Color:=clWhite;
    DrawGrid1.Canvas.Brush.Color:=clWhite;
    DrawGrid1.Canvas.rectangle(DrawGrid1.CellRect(coll,row));
    end;
1:  begin
    DrawGrid1.Canvas.Pen.Color:=clBlack;
    DrawGrid1.Canvas.Brush.Color:=clBlack;
    DrawGrid1.Canvas.rectangle(DrawGrid1.CellRect(coll,row));
    end;
2:  begin
    DrawGrid1.Canvas.Pen.Color:=clBlue;
    DrawGrid1.Canvas.Brush.Color:=clBlue;
    DrawGrid1.Canvas.rectangle(DrawGrid1.CellRect(coll,row));
    end;
3:  begin
    DrawGrid1.Canvas.Pen.Color:=clRed;
    DrawGrid1.Canvas.Brush.Color:=clRed;
    DrawGrid1.Canvas.rectangle(DrawGrid1.CellRect(coll,row));
    end;
end;
end;



procedure TForm1.FormPaint(Sender: TObject);
var i,j: integer;
begin

for i:=0 to 50 do
  for j:=0 to 50 do
    coloracella(i,j);

end;



procedure TForm1.BStartClick(Sender: TObject);
var i,j: integer;
begin

  if (BStart.Tag=0) then begin

    BTorre1.Enabled:=true;
    BTorre2.Enabled:=true;
    BTorre3.Enabled:=true;
    TrackBar1.Enabled:=false;
    mosse:=0;
    Timer1.Enabled:=true;
    Timer2.Enabled:=true;
    BStart.Tag:=1;
    cont:=0;

    i:=9;
    for j:=1 to 49 do begin
      mat[j,i]:=1;
      coloracella(j,i);
      end;

    j:=9;
    for i:=1 to 9 do begin
    mat[j,i]:=1;
      coloracella(j,i);
      end;

    j:=25;
    for i:=1 to 9 do begin
    mat[j,i]:=1;
      coloracella(j,i);
      end;

    j:=41;
    for i:=1 to 9 do begin
    mat[j,i]:=1;
      coloracella(j,i);
      end;


   case TrackBar1.Position of
   3: begin
      i:=8;
      for j:=6 to 12 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=7;
      for j:=7 to 11 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=6;
      for j:=8 to 10 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      end;
   4: begin

      begin
      i:=8;
      for j:=5 to 13 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=7;
      for j:=6 to 12 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=6;
      for j:=7 to 11 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=5;
      for j:=8 to 10 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      end;

      end;
   5: begin

      i:=8;
      for j:=4 to 14 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=7;
      for j:=5 to 13 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=6;
      for j:=6 to 12 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=5;
      for j:=7 to 11 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=4;
      for j:=8 to 10 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      end;
   6: begin

      i:=8;
      for j:=3 to 15 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=7;
      for j:=4 to 14 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=6;
      for j:=5 to 13 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=5;
      for j:=6 to 12 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=4;
      for j:=7 to 11 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=3;
      for j:=8 to 10 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      end;
   7: begin

      i:=8;
      for j:=2 to 16 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=7;
      for j:=3 to 15 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=6;
      for j:=4 to 14 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=5;
      for j:=5 to 13 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=4;
      for j:=6 to 12 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=3;
      for j:=7 to 11 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      i:=2;
      for j:=8 to 10 do begin
        mat[j,i]:=2;
        coloracella(j,i);
        end;

      end;
     end;


    end
   else
    ShowMessage('Operazione non valida.');

end;

procedure TForm1.BResetClick(Sender: TObject);
begin

  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
  ProgressBar1.Position:=0;
  BStart.Tag:=0;
  FormCreate(sender);
  FormPaint(sender);

  BTorre1.Tag:=0;
  BTorre2.Tag:=0;
  BTorre3.Tag:=0;
  BTorre1.Enabled:=false;
  BTorre2.Enabled:=false;
  BTorre3.Enabled:=false;
  TrackBar1.Enabled:=true;
  EditNome.Text:='';
  LabContMosse.Caption:='0';
  LabSecondi.Caption:='0';

end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i,j,dischi: integer;
begin

dischi:=0;

j:=41;
for i:=9 downto 0 do
  if mat[j,i]=2 then
    dischi:=dischi+1;

if TrackBar1.Position<>dischi then begin


cont:=cont+1;
LabSecondi.Caption:=IntToStr(cont);

case TrackBar1.Position of
3: begin
   if cont=30 then begin
    Timer1.Enabled:=false;
    ShowMessage('GIOCO TERMINATO!!!');
    end;
   end;
4: begin
   if cont=60 then begin
    Timer1.Enabled:=false;
    ShowMessage('GIOCO TERMINATO!!!');
    end
   end;
5: begin
   if cont=120 then begin
    Timer1.Enabled:=false;
    ShowMessage('GIOCO TERMINATO!!!');
    end
   end;
6: begin
   if cont=240 then begin
    Timer1.Enabled:=false;
    ShowMessage('GIOCO TERMINATO!!!');
    end
   end;
7: begin
   if cont=420 then begin
    Timer1.Enabled:=false;
    ShowMessage('GIOCO TERMINATO!!!');
    end
   end;
end;

end
else begin
  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
  BTorre1.Enabled:=false;
  BTorre2.Enabled:=false;
  BTorre3.Enabled:=false;
  BSalva.Enabled:=true;
  ShowMessage('COMPLIMENTI!!! HAI VINTO!!!');
  end;

end;

procedure TForm1.BTorre1Click(Sender: TObject);
var i,j,riga,rigadisco,colonnadisco,conta,meta,rigarossa,verifica: integer;
begin
  rigadisco:=0;
  colonnadisco:=0;
  conta:=0;
  riga:=8;
  rigarossa:=0;
  verifica:=0;

  case BTorre1.Tag of

  0: begin

     riga:=9;
     j:=9;
     for i:=10 downto 0 do
      if mat[j,i]=2 then begin
        riga:=i;
        end;

     if riga <>9 then begin

     for j:=2 to 16 do
      if mat[j,riga]=2 then
        mat[j,riga]:=3;

     FormPaint(sender);
     BTorre1.Tag:=2;
     BTorre2.Tag:=1;
     BTorre3.Tag:=1;

     end
     else
      ShowMessage('Non vi sono dischi da selezionare.');

     end;

  1: begin

     for j:=50 downto 0 do                //cerco dove sono i rossi...
      for i:=0 to 10 do                   //...salvo da dove partono
        if mat[j,i]=3 then begin
          rigadisco:=i;
          colonnadisco:=j;
          end;

     i:=rigadisco;                       //conto quanti dischi devo passare
     for j:=colonnadisco to 50 do
      if mat[j,i]=3 then
        conta:=conta+1;

     j:=9;            //controllo dove dovrei andare a mettere il disco
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

    i:=riga+1;                  //controllo se nella riga sotto non vi �
    for j:=2 to 16 do             //...un disco pi� grande
      if mat[j,i]=2 then
        verifica:=verifica+1;

    if (verifica>conta) or (verifica=0) then begin

                     //cancello  i rossi

     meta:=(conta div 2);
     mat[colonnadisco+meta,rigadisco]:=1;

     i:=rigadisco;
     for j:=colonnadisco to colonnadisco+(conta) do
      if mat[j,i]=3 then
        mat[j,i]:=0;

                  //trasferisco i blu sul mio piolo
     j:=9;
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

     for j:=(j - meta) to (j + meta) do
      mat[j,riga]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     mosse:=mosse+1;
     LabContMosse.Caption:=IntToStr(mosse);

     end
     else
      ShowMessage('Mossa non consentita.');

     end;

  2: begin
     j:=9;
     for i:=8 downto 0 do
       if mat[j,i]=3 then
        rigarossa:=i;

     for j:=2 to 16 do
      if mat[j,rigarossa]=3 then
        mat[j,rigarossa]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     end;

  end;
end;

procedure TForm1.BTorre2Click(Sender: TObject);
var i,j,riga,rigadisco,colonnadisco,conta,meta,rigarossa,verifica: integer;
begin
  rigadisco:=0;
  colonnadisco:=0;
  conta:=0;
  riga:=8;
  rigarossa:=0;
  verifica:=0;

  case BTorre2.Tag of

  0: begin

     riga:=9;
     j:=25;
     for i:=10 downto 0 do
      if mat[j,i]=2 then begin
        riga:=i;
        end;

     if riga <>9 then begin

     for j:=17 to 33 do
      if mat[j,riga]=2 then
        mat[j,riga]:=3;

     FormPaint(sender);
     BTorre1.Tag:=1;
     BTorre2.Tag:=2;
     BTorre3.Tag:=1;

     end
     else
      ShowMessage('Non vi sono dischi da selezionare.');

     end;

  1: begin

     for j:=50 downto 0 do                //cerco dove sono i rossi...
      for i:=0 to 10 do                   //...salvo da dove partono
        if mat[j,i]=3 then begin
          rigadisco:=i;
          colonnadisco:=j;
          end;

     i:=rigadisco;                       //conto quanti dischi devo passare
     for j:=colonnadisco to 50 do
      if mat[j,i]=3 then
        conta:=conta+1;

     j:=25;            //controllo dove dovrei andare a mettere il disco
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

    i:=riga+1;                  //controllo se nella riga sotto non vi �
    for j:=17 to 33 do             //...un disco pi� grande
      if mat[j,i]=2 then
        verifica:=verifica+1;

    if (verifica>conta) or (verifica=0) then begin

                     //cancello  i rossi

     meta:=(conta div 2);
     mat[colonnadisco+meta,rigadisco]:=1;

     i:=rigadisco;
     for j:=colonnadisco to colonnadisco+(conta) do
      if mat[j,i]=3 then
        mat[j,i]:=0;

                  //trasferisco i blu sul mio piolo
     j:=25;
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

     for j:=(j - meta) to (j + meta) do
      mat[j,riga]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     mosse:=mosse+1;
     LabContMosse.Caption:=IntToStr(mosse);

     end
     else
      ShowMessage('Mossa non consentita.');

     end;

  2: begin
     j:=25;
     for i:=8 downto 0 do
       if mat[j,i]=3 then
        rigarossa:=i;

     for j:=17 to 33 do
      if mat[j,rigarossa]=3 then
        mat[j,rigarossa]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     end;

  end;
end;

procedure TForm1.BTorre3Click(Sender: TObject);
var i,j,riga,rigadisco,colonnadisco,conta,meta,rigarossa,verifica: integer;
begin
  rigadisco:=0;
  colonnadisco:=0;
  conta:=0;
  riga:=8;
  rigarossa:=0;
  verifica:=0;

  case BTorre3.Tag of

  0: begin

     riga:=9;
     j:=41;
     for i:=9 downto 0 do
      if mat[j,i]=2 then begin
        riga:=i;
        end;

     if riga <>9 then begin

      for j:=35 to 48 do
        if mat[j,riga]=2 then
          mat[j,riga]:=3;

      FormPaint(sender);

      BTorre1.Tag:=1;
      BTorre2.Tag:=1;
      BTorre3.Tag:=2;
      end
     else
      ShowMessage('Non vi sono dischi da selezionare.');

     end;

  1: begin

     for j:=50 downto 0 do                //cerco dove sono i rossi...
      for i:=0 to 10 do                   //...salvo da dove partono
        if mat[j,i]=3 then begin
          rigadisco:=i;
          colonnadisco:=j;
          end;

     i:=rigadisco;                       //conto quanti dischi devo passare
     for j:=colonnadisco to 50 do
      if mat[j,i]=3 then
        conta:=conta+1;

     j:=41;            //controllo dove dovrei andare a mettere il disco
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

    i:=riga+1;                  //controllo se nella riga sotto non vi �
    for j:=35 to 48 do             //...un disco pi� grande
      if mat[j,i]=2 then
        verifica:=verifica+1;

    if (verifica>conta) or (verifica=0) then begin

                     //cancello  i rossi

     meta:=(conta div 2);
     mat[colonnadisco+meta,rigadisco]:=1;

     i:=rigadisco;
     for j:=colonnadisco to colonnadisco+(conta) do
      if mat[j,i]=3 then
        mat[j,i]:=0;

                  //trasferisco i blu sul mio piolo
     j:=41;
    for i:=0 to 8 do
      if mat[j,i]=1 then begin
        riga:=i;
        end;

     for j:=(j - meta) to (j + meta) do
      mat[j,riga]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     mosse:=mosse+1;
     LabContMosse.Caption:=IntToStr(mosse);

     end
     else
      ShowMessage('Mossa non consentita.');

     end;

  2: begin
     j:=41;
     for i:=8 downto 0 do
       if mat[j,i]=3 then
        rigarossa:=i;

     for j:=32 to 48 do
      if mat[j,rigarossa]=3 then
        mat[j,rigarossa]:=2;

     FormPaint(sender);

     BTorre1.Tag:=0;
     BTorre2.Tag:=0;
     BTorre3.Tag:=0;

     mosse:=mosse+1;

     end;
  end;
end;



procedure TForm1.Esci2Click(Sender: TObject);
begin
Close;
end;

procedure TForm1.Spiegazionedelgioco2Click(Sender: TObject);
var spiegazioni: TForm2;
begin

spiegazioni:=TForm2.Create(application);
spiegazioni.Show;

end;

procedure TForm1.Realizzatoda1Click(Sender: TObject);
var realizzato: TForm3;
begin

realizzato:=TForm3.Create(application);
realizzato.Show;

end;

procedure TForm1.BSalvaClick(Sender: TObject);

begin

  if EditNome.Text='' then
    ShowMessage('Inserire il Nome del giocatore per salvare.')
  else begin

    p.nome:=EditNome.Text;
    p.mosse:=StrToInt(LabContMosse.Caption);
    p.livello:=TrackBar1.Position;


    AssignFile(h,'history'+IntToStr(TrackBar1.Position)+'.cuc');

    if FileExists('history'+IntToStr(TrackBar1.Position)+'.cuc') then begin
      reset(h);
      seek(h,Filesize(h));
      end
    else
      Rewrite(h);

    write(h,p);
    CloseFile(h);

    ShowMessage('SALVATAGGIO EFFETTUATO!!!');

    end;


end;



procedure ins_ord (var l:lista; r:rec);
begin

  if l=NIL then begin
    new(l);
    l^.nome:=r.nome;
    l^.mosse:=r.mosse;
    l^.livello:=r.livello;
    l^.pun:=NIL;
    end
  else
    ins_ord(l^.pun,r);
end;


procedure dafilealista (var l:lista; k:shortstring);
var  m:shortstring;

begin

  l:=NIL;
  m:='history'+k+'.cuc';
  AssignFile(h,m);
  if FileExists(m) then begin
    reset(h);
    while not eof(h) do begin
      read(h,p);
      ins_ord(l,p);
      end;
    CloseFile(h);
  end;

end;


procedure dalistaafile (l:lista; k:shortstring);
var
     r: rec;
     i: integer;

begin
  i:=0;
  AssignFile(h,'history'+k+'.cuc');
  if FileExists('history'+k+'.cuc') then begin
  Rewrite(h);

  while (l<>NIL) and (i<=10) do begin
    r.nome:=l^.nome;
    r.mosse:=l^.mosse;
    r.livello:=l^.livello;
    write(h,r);
    l:=l^.pun;
    i:=i+1;
    end;

  closefile(h);
  end;
end;


procedure TForm1.BClassificaClick(Sender: TObject);
var classifica: TForm;
    l:lista;
    i,k: integer;
    t:shortstring;
    spazio1,spazio2,spazio3: string[20];

begin

classifica:= TForm.Create(self);
  with classifica do begin
    Caption:='CLASSIFICA';
    Left:=400;
    Top:=200;
    ClientHeight:=400;
    ClientWidth:=500;
    Color:=clScrollBar;
  end;

  t:=IntToStr(TrackBar1.Position);
  dafilealista(l,t);
  dalistaafile(l,t);

  spazio1:=' �  -  ';
  spazio2:='    Mosse:  ';
  spazio3:='    Livello:  ';
  k:=5;
  i:=1;

  while (l<>NIL) and (i<=10) do begin
    with TLabel.Create(self) do begin
      parent:=classifica;
      Caption:=IntToStr(i)+spazio1+l^.nome+spazio2+(IntToStr(l^.mosse))+spazio3+(IntToStr(l^.livello));
      Font.Name:='Comic Sans MS';
      Font.Color:=clHotLight;
      Font.Height:=25;
      Left:=20;
      Height:=35;
      Top:=k+(i-1)*height+15;

    end;
    l:=l^.pun;
    i:=i+1;
  end;

  classifica.ShowModal;
  classifica.Free;
end;



procedure TForm1.Per3dischi1Click(Sender: TObject);
var tre: TForm4;
begin

tre:=TForm4.Create(application);
tre.ShowModal;
tre.Free;

end;

procedure TForm1.Per4dischi1Click(Sender: TObject);
var quattro: TForm5;
begin

quattro:=TForm5.Create(application);
quattro.ShowModal;
quattro.Free;

end;

procedure TForm1.Per5dischi1Click(Sender: TObject);
var cinque: TForm6;
begin

cinque:=TForm6.Create(application);
cinque.ShowModal;
cinque.Free;

end;

procedure TForm1.Per6dischi1Click(Sender: TObject);
var sei: TForm7;
begin

sei:=TForm7.Create(application);
sei.ShowModal;
sei.Free;

end;

procedure TForm1.Per7dischi1Click(Sender: TObject);
var sette: TForm8;
begin

sette:=TForm8.Create(application);
sette.ShowModal;
sette.Free;

end;

procedure TForm1.TrackBar1Change(Sender: TObject);
begin

case TrackBar1.Position of
  3: ProgressBar1.Max:=30;
  4: ProgressBar1.Max:=60;
  5: ProgressBar1.Max:=120;
  6: ProgressBar1.Max:=240;
  7: ProgressBar1.Max:=420;
end;

end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

ProgressBar1.Position:=(ProgressBar1.Position)+1;

end;

end.
