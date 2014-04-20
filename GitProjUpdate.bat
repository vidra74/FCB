D: > D:\gitUpdate.txt

echo "Sredi Klijent projekt" >> D:\gitUpdate.txt

cd "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt

del *.pas >> D:\gitUpdate.txt
del *.dfm >> D:\gitUpdate.txt
del *.res >> D:\gitUpdate.txt
del *.dpr >> D:\gitUpdate.txt
del *.dproj >> D:\gitUpdate.txt
del *.groupproj >> D:\gitUpdate.txt

cd "D:\Delphi_XE_Projekti\DataSnap_TcpIp\Klijent" >> D:\gitUpdate.txt

copy *.pas "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt
copy *.dfm "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt
copy *.res "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt
copy *.dpr "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt
copy *.dproj "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt
copy *.groupproj "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt

cd "D:\GitHub\FCB\Klijent" >> D:\gitUpdate.txt

dir >> D:\gitUpdate.txt 

echo "Sredi Server projekt" >> D:\gitUpdate.txt

cd "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt

del *.pas >> D:\gitUpdate.txt
del *.dfm >> D:\gitUpdate.txt
del *.res >> D:\gitUpdate.txt
del *.ridl >> D:\gitUpdate.txt
del *.tlb >> D:\gitUpdate.txt
del *.dpr >> D:\gitUpdate.txt
del *.dproj >> D:\gitUpdate.txt

cd "D:\Delphi_XE_Projekti\DataSnap_TcpIp\Server" >> D:\gitUpdate.txt 

copy *.pas "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.dfm "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.res "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.ridl "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.tlb "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.dpr "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt
copy *.dproj "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt

cd "D:\GitHub\FCB\Server" >> D:\gitUpdate.txt

dir >> D:\gitUpdate.txt

cd "D:\GitHub\FCB" >> D:\gitUpdate.txt

dir >> D:\gitUpdate.txt

echo "Sredi ReadMe.txt" >> D:\gitUpdate.txt

notepad ReadMe.txt >> D:\gitUpdate.txt

notepad D:\gitUpdate.txt