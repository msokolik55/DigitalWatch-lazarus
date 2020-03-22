program project1;
uses dos, graph, wincrt;

var
  gd, gm: smallint;
  h, m, s, ms, h0, m0, s0, ms0: word;

function hodnota0(udaj: word): string;
begin
  str(udaj, hodnota0);

  if(length(hodnota0) < 2) then
    hodnota0 := '0' + hodnota0;
end;

function cas(h, m, s: word): string;
begin
  cas := hodnota0(h) + ':' + hodnota0(m) + ':' + hodnota0(s);
end;

begin
  gd := detect;
  initgraph(gd, gm, '');

  settextstyle(1, 0, 3);

  repeat
    gettime(h, m, s, ms);

    if(s <> s0) then
    begin
      setcolor(black);
      outtextxy(getmaxx div 2 - 100, getmaxy div 2, cas(h0, m0, s0));
      setcolor(white);
    end;

    outtextxy(getmaxx div 2 - 100, getmaxy div 2, cas(h, m, s));

    h0 := h;
    m0 := m;
    s0 := s;
    ms0 := ms;
  until keypressed;

  closegraph();
end.

