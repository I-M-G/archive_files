@ECHO OFF

:Get the date (Ex. Wed 5/20/2020) without the day (5/20/2020).
:`token=2` gets the second item from the command.
FOR /F "tokens=2 USEBACKQ" %%F IN (`date /t`) DO (
  SET today=%%F
)
:ECHO %today%

:Need to replace / with - for folder name
SET formatted_date=%today:/=-%
:ECHO %formatted_date%

:Make Directory in archive\<FORMATTED DATE>
MD archive\%formatted_date%

:Move all the content in downloads folder to the newly created archive folder
MOVE %CD%\downloads\* %CD%\archive\%formatted_date%

:MOVE outputs how many files moved when complete or errors
:PAUSE to see the output or remove and create log files if running as a task
PAUSE