Program VGA_Test;

Uses Crt, Graph, Dos, Objects;

Var Mode, Driver, Size, A : Integer;

Begin;
  TextBackground(0);
  Randomize;
  ClrScr;

  Driver := VGA;
  Mode := VGAHI;
  InitGraph(Driver, Mode,'C:\BP\BGI\');

  For a := 1 to 10 Do
      Begin;
        SetTextStyle(A, HorizDir, 4);
        OutTextXY(1, A * 40 - 40, 'Mein Name ist Mathias Nitzsche...');
      End;
  Repeat
  Until keyPressed
End.