@@echo off

REM Please, change the path where batch is sourced.
REM Batch file does sql script in files which consist only in the same folder

pushd \\fstrain\Exchange\Lv-468.DB\StagingTables\1

FOR %%A IN (*.SQL) DO ( sqlcmd -S "192.168.195.147" -d "test2_ihor" -U "Lv-468.DB" -P "Lv-468.DB" -i "%%A" -I )

popd
