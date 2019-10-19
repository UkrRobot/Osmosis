unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;
const n=2000; mu=0.018; scale_n=1e26;  kB=1.38e-23; Tm=300;
      Patm=100000;   t_l=280;   hr=300;   dens=1000;
  t_r=380;   {100 = cylinder wigth}
type
  TForm1 = class(TForm)
    Image1: TImage;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Button3: TButton;
    RichEdit1: TRichEdit;
    Label7: TLabel;
    Label8: TLabel;
    Button4: TButton;
	procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure RichEdit1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button4Click(Sender: TObject);

     private
    { Private declarations }
  public
    { Public declarations }
  end;
       type
    molecula=object
    x,y,pos,col:integer;
   End;

var
  Form1: TForm1;
        nB,i,part_B:integer;
        m:array[1..n] of molecula;
        h,ntime,k:integer;
        postring:string;
        pa1,hn,pB,w,h0:real;
        dnblue:integer;
        stop_move:boolean;
         pa_array,pb_array,h_t:array[0..2000] of real;
implementation

{$R *.dfm}


           procedure Delay(dwMilliseconds: Longint);
 var
   iStart, iStop: DWORD;
 begin
   iStart := GetTickCount;
   repeat
     iStop := GetTickCount;
     Application.ProcessMessages;
   until (iStop - iStart) >= dwMilliseconds;
 end;

            Procedure putpixel(a,b,c:integer);
             Begin
              case c of
               0:form1.image1.Canvas.Pen.Color:=clBlack;
               1:form1.image1.Canvas.Pen.Color:=clBlue;
               2:form1.image1.Canvas.Pen.Color:=clGreen;
               3:form1.image1.Canvas.Pen.Color:=$FFFF00;
               4:form1.image1.Canvas.Pen.Color:=clRed;
               end;
              form1.Image1.Canvas.moveTo(a-1,b);
              form1.Image1.Canvas.LineTo(a,b);
             end;

             Procedure line(a,b,c,d:integer);
              Begin
               form1.Image1.Canvas.MoveTo(a,b);
               form1.Image1.Canvas.LineTo(c,d);
             end;

             Procedure rectangle(a,b,c,d:integer);
              Begin
               form1.Image1.Canvas.Rectangle(a,b,c,d);
              end;


              Procedure bar(a,b,c,d:integer);
              Begin
               form1.Image1.Canvas.FillRect(Rect(a,b,c,d));
              end;



             Procedure outtextxy(a,b:integer; s:string);
              Begin
               form1.Image1.Canvas.TextOut(a,b,s);
             end;

             Procedure setcolor(a:integer);
              Begin
               case a of
               0:form1.image1.Canvas.Pen.Color:=clBlack;

               1:form1.image1.Canvas.Pen.Color:=clBlue;

               2:form1.image1.Canvas.Pen.Color:=clGreen;

               3:form1.image1.Canvas.Pen.Color:=$FFFF00;

               4:form1.image1.Canvas.Pen.Color:=clRed;

               5:form1.image1.Canvas.Pen.Color:=$CA1F7B;

               6:form1.image1.Canvas.Pen.Color:=$800000;

               7:form1.image1.Canvas.Pen.Color:=$aaaaaa;

               14:form1.image1.Canvas.Pen.Color:=clyellow;

               15:form1.image1.Canvas.Pen.Color:=clwhite;

               end;
               end;

               Procedure cleardevice;
                 var br:integer;
               Begin
               form1.Image1.Canvas.Brush.Color:=clblack;
               form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
                   setcolor(2);
                   rectangle(1,1,639,479);
                   rectangle(600,1,630,45);
                        {***'watering can'***}
                   line(600,45,590,50);
                   line(630,45,640,50);
                   line(590,50,640,50);

                   br:=70;
                   while br<=290 do
                   begin
                   putpixel(615,br,3);
                   br:=br+20;
                   end;
                   setcolor(14);
{                   rectangle(t_l-1,60,t_r+1,Hr+10); {t_l=x_l,t_r=x_r??}
                   line(t_l-1,10,t_l-1,hr+10);
                   line(t_r,10,t_r,hr+10);

                   setcolor(3);            {lifting line}
                   line(1,Hr,639,Hr);
                   line(t_l,h,t_r,h);

                    setcolor(5);
                     line(t_l,hr,t_r,hr);
                    setcolor(7);
                     line(t_l,hr+1,t_r,hr+1);
                    setcolor(5);
                     line(t_l,hr+2,t_r,hr+2);

                   setcolor(0);
                    line(t_l,hr+10,t_r,hr+10);
              end;

              Procedure M_move;
              var g:real;
              q,bluenumber,n_blue:integer;
              heighthalt:boolean;
               Begin
                   {------------------------------------}
                    heighthalt:=false;
    while (ntime<=2000) and (stop_move=false) do Begin

                   ntime:=ntime+1;
                 pB:={pa*h0/hn*5;}10*nB/(28*hn*0.1*pi*sqr(50*0.1))
                 *scale_n*kB*Tm;
                 {pB:=pa*h0/hn*10;} {1e23/(pi*sqr(0.03)*(hn*3))*1.38e-23*293}
                 {pa1:=dens*9.8*hn*0.001+pa-pB;}
                 pb_array[ntime]:=Pb;

                 pa1:=(((bluenumber-nb)/hn)/(nb/h0)*Patm)+dens*    {nb+na0???}
                 9.8*hn*0.1{+pa}-pB;
                 pa_array[ntime]:=pa1; setcolor(0); line(t_l,60,t_r,60);
                 h_t[ntime]:=hn;
                 delay(2);
                 if stop_move=true then break;

                 cleardevice;


                  For i:=1 to n do begin   {all atoms!!!!!}
                        if stop_move=true then break;
                if (m[i].y<=Hr) and ((m[i].x<t_l) or (m[i].x>t_r))
                  then
                 case  random(2) of
            0:    m[i].pos:=3;
            1:    m[i].pos:=4;
                 end;

             {else if (m[i].y=Hr)and(m[i].col=3)and(m[i].x>t_l)and(m[i].x<t_r)
                   then begin m[i].pos:=1;}
                   { mnumber:=mnumber+1; end}
                  if (m[i].x=t_r) and (m[i].y<Hr) then
               case  random(2) of                  {hr - pertition}
            0:    m[i].pos:=2;
            1:    m[i].pos:=4;
                 end;
                  if (m[i].x=t_l) and (m[i].y<Hr) then
              case  random(2) of
            0:    m[i].pos:=3;
            1:    m[i].pos:=1;
                 end;

                  {if (m[i].x=t_r) and (m[i].y<Hr) then m[i].pos:=4;}
                 if (m[i].y<=h) then
             case  random(2) of                  {hr - pertition}
            0:    m[i].pos:=3;
            1:    m[i].pos:=4;
                 end;    
                     if m[i].x=640 then
               case  random(2) of                  {hr - pertition}
            0:   m[i].pos:=2;
            1:   m[i].pos:=4;
                 end;

                if m[i].x=0 then    {big volume, left wall}
                case  random(2) of
            0:    m[i].pos:=3;
            1:    m[i].pos:=1;
                 end;
                 if m[i].y=480 then
                  case  random(2) of
            0:    m[i].pos:=2;
            1:    m[i].pos:=1;
                 end;

               if (m[i].y=Hr) and (m[i].col=4) then
                 case  random(2) of                  {hr - pertition}
            0:   m[i].pos:=2;
            1:   m[i].pos:=1;
                 end;

                { m[i].col:=4 =   relevant red atoms}
                 // delay(2);  //sleep(t);
                    {if m[i].x=640 then m[i].pos:=4;
                    if m[i].y=480 then m[i].pos:=1; }

               if (m[i].y=Hr) and (m[i].col=3) then
               begin
               g:=random;
                 if pa1<0 then w:=1 else w:=(1-0.5*pa1/Patm); {pa-atm, pa1-A-komp}
                 if (g>w) and  ((m[i].pos=3) or (m[i].pos=4))
                 then   dec(bluenumber)  {on border}
                       else
                 case  random(2) of
            0:    m[i].pos:=2;
            1:    m[i].pos:=1;
                 end;

              if (g<w) and  ((m[i].pos=1) or (m[i].pos=2))
                 then  inc(bluenumber)           {on border}
                       else
                 case  random(2) of
            0:    m[i].pos:=3;
            1:    m[i].pos:=4;
                 end;
                    // delay(2);
              end;

                 {------- move:---------------------}
                       if m[i].pos=1 then
                   begin                    {rigth up}
                    inc(m[i].x);
                    dec(m[i].y);
                    putpixel(m[i].x,m[i].y,m[i].col);
                    putpixel(m[i].x-1,m[i].y+1,0);
                    end;
                       if m[i].pos=2 then begin    {left up}
                       dec(m[i].x);
                       dec(m[i].y);
                       putpixel(m[i].x,m[i].y,m[i].col);
                       putpixel(m[i].x+1,m[i].y+1,0);

                     end;
                   if m[i].pos=3 then begin        {down right}
                      inc(m[i].x);
                      inc(m[i].y);
                      putpixel(m[i].x,m[i].y,m[i].col);
                      putpixel(m[i].x-1,m[i].y-1,0);
                   end;
                  if m[i].pos=4 then begin       {down left}
                      dec(m[i].x);
                      inc(m[i].y);
                       putpixel(m[i].x,m[i].y,m[i].col);
                       putpixel(m[i].x+1,m[i].y-1,0);

                   end;
                                 //delay(10);
                               //sleep(2);
                   dnblue:=bluenumber - n_blue;
                    if abs(dnblue) >=20 then      { delta nA}
                begin
{=====>} //      delay(2);
                       if stop_move=true then break;
                      //mnumber:=0;
                      //cleardevice;
              if (Pa1<Patm) and (dnblue>0) then hn:=hn+1{round(1/nb*h0)};
              if (Pa1>Patm) and (dnblue<0) then hn:=hn-1{round(1/nb*h0)};
                  n_blue:=bluenumber;
                       h:=Hr{h}-round(hn); {h:=h-2;}
               {end;}
{--->}          { po:=(kn*8.31*293)/(3.14*sqr(0.03)*hn*mu);}
                 str(abs(pa1/Patm):5:3,postring);
                  form1.Label1.Caption:= 'W=  '+ postring;
                   {if abs(hn-po/(dens*9.8))<1 then heighthalt:=true;}
                   if ((pa1>0) and (1-pa1/Patm<0.01)) then heighthalt:=true;
                     if heighthalt=true then
                     begin
                       str(hn*0.01:5:3,postring);
                       form1.Label5.Caption:= 'H='+ postring;
                       
                     end;       {all atoms}
                     str(pa1:5:3,postring);
                     form1.Label2.Caption:= 'PA='+ postring;
                     str(pb:5:3,postring);
                     form1.Label3.Caption:= 'PB='+ postring;
                     str(bluenumber,postring);
                     form1.Label4.Caption:= 'Blue='+ postring;
                     bluenumber:=0;
 //                    ho:=hn;
                for q:=1 to n do
                if (m[q].col=3)and (m[q].y<Hr) then inc(bluenumber);
                 end; end;
                    end;

              End;


 Procedure build_graph;
        const kpoint=640;
        var x:byte;
            att,brr:real;
            p,br:integer;
            Begin
          p:=trunc(1/4);
              outtextxy(10,30,'Pb,Pa,H');
              x:=20;
              form1.Image1.Canvas.moveto(x,round(480-pa_array[0]/1e3));
                  setcolor(3);
                  for i:=1 to ntime do
                    form1.Image1.Canvas.lineto(i div 4+x,round(480-pa_array[i]*2e-3));
                    //delay(500);
                  form1.Image1.Canvas.moveto(x,round(480-pb_array[0]/1e3));
                  setcolor(4);
                  for i:=1 to ntime do
                   form1.Image1.Canvas.lineto(i div 4+x,round(480-pb_array[i]*2e-3));
                   form1.Image1.Canvas.moveto(x,round(480-h_t[0]*1));
                  setcolor(2);
                  for i:=1 to ntime do              {!!!!}
                    form1.Image1.Canvas.lineto(i div 4+x,round(480-h_t[i]*1));
                      form1.Image1.Canvas.moveto(x,round(480-Patm*2e-3));
                  setcolor(15);
                  for i:=1 to kpoint do
                    form1.Image1.Canvas.lineto(i+x,round(480-Patm*2e-3));
                                        str(hn*0.01:5:3,postring);
                       form1.Label5.Caption:= 'H='+ postring;

                       setcolor(15);


                       {coordinare axes}
                       line(20,479,640,479);
                       line(20,0,20,480);
                       line(600,280,600,480);
                       brr:=1;
                       outtextxy(0,260,'atm');
                       outtextxy(620,260,'m');
                       setcolor(15);
                       for br:=0 to 40 do
                          begin
                          {cina podilki}
                          line(15,280+(br*20),24,280+(br*20));
                          line(20+br*16,276,20+br*16,285);
                          line(598,280+(br*20),602,280+(br*20));
                          end;
                      setcolor(6);
                       for br:=0 to 40 do  begin
                          att:=0.2*(10-br);
                          str(att:0:3,postring);
                          outtextxy(603,280+(br*20),postring);
                          if br<=10 then
                             begin
                             att:=(10-br)/10;
                             str(att:0:2,postring);
                             outtextxy(0,280+(br*20),postring);
                             end;
                          end;
                        end;
                   


procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
Form1.Label5.Caption:='';
stop_move:=false;
nB:=0; dnblue:=0;
for i:=0 to ntime do
begin
   pa_array[i]:=0; pb_array[i]:=0;  h_t[i]:=0;
end;
ntime:=0;
 form1.Image1.Canvas.Brush.Color:=clblack;
 form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
//form1.Button1.Enabled:=false;
form1.ComboBox1.Enabled:=false;
form1.Button2.Enabled:=true;

case form1.ComboBox1.ItemIndex of
  0: part_B:=50;
  1: part_B:=30;
  2: part_B:=40;
end;

//part_B:=strtoint(ComboBox1.Text);
 Randomize;        {0.08;}
 // bluenumber:=0;
  setcolor(2);
 // mnumber:=1;
 // kn:=0;
  pa_array[0]:=0; pb_array[0]:=Patm;  h_t[0]:=hn;
  h:=280;   h0:=Hr-h;
  hn:=20;
  For i:=1 to n do begin
  k:=random(part_B);
   if k>part_B-2 then begin
    m[i].col:=4; inc(nB); end    {relevant red atoms}
  else if k<=part_B-2 then m[i].col:=3; {colour _ vody}
   if m[i].col=4 then begin
  m[i].x:=t_l+1+random(t_r-t_l-1);
  m[i].y:=h+random(Hr-h);
  {inc(kn);}end
  else if m[i].col=3 then begin
  m[i].x:=random(640);
  m[i].y:=Hr+1+random(480-Hr);
  end;
  m[i].pos:=random(4)+1;
  end;

 M_move;
 form1.Image1.Canvas.Brush.Color:=clblack;
 form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
 build_graph;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 //mnumber:=1;
 //kn:=0;
 {form1.Image1.Canvas.Brush.Color:=clblack;
 form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
stop_move:=true;
 delay(500); }
stop_move:=true;
// delay(500);
  form1.Image1.Canvas.Brush.Color:=clblack;
 form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
  build_graph;
end;

procedure TForm1.FormActivate(Sender: TObject);
begin
form1.Image1.Canvas.Font.Color:=clwhite;
form1.Image1.Canvas.Brush.Color:=clblack;
form1.Image1.Canvas.FillRect(form1.Image1.Canvas.ClipRect);
form1.ComboBox1.ItemIndex:=0;
form1.Button2.Enabled:=false;
form1.RichEdit1.Visible:=false;
form1.RichEdit1.Text:='Help:'+#13+'Mb - massa B-component;'+#13+'PA - pressure A-component (solvent);'
                      +#13+'PB - pressure B-component;'+#13+'Blue - the number of solvent molecules in the pipe;'
                      +#13+'H - fluid height in pipe;'+#13+#13+'chart:'
                      +#13+'PA - blue curve'
                      +#13+'PB - red curve'
                      +#13+'H - green curve';
end;



procedure TForm1.Button3Click(Sender: TObject);
begin
form1.RichEdit1.Visible:=not form1.RichEdit1.Visible;
end;

procedure TForm1.RichEdit1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
form1.RichEdit1.Visible:=false;
end;

procedure TForm1.Button4Click(Sender: TObject);
var mass,mol,R,T,V,ro,height,radius:real;
begin
 R:=8.31;
 T:=300;
 //height:=hn;
 radius:=0.02;
 ro:=1000;

V:=pi*sqr(radius)*hn;
mass:=(part_B*R*T*100)/(V*ro*9.8*hn);
str(mass:5:2,postring);
//Form1.Label8.Caption:= 'Mass ='+ postring + 'g/mol';
end;

end.
