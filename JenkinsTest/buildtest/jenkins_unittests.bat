REM Path variables
 SET FolderPath=%WORKSPACE%\JenkinsTest
 SET ResultsPath=C:\UnitTestResults
 SET CoverageHistoryPath=C:\CoverageHistory
 
 SET NunitPath=%FolderPath%\packages\NUnit.ConsoleRunner.3.8.0\tools
 SET ReportUnitPath=%FolderPath%\packages\ReportUnit.1.2.1\tools
 SET OpenCoverPath=%FolderPath%\packages\OpenCover.4.6.519\tools
 SET ReportGeneratorPath=%FolderPath%\packages\ReportGenerator.3.1.2\tools
 
 SET UnitTestProj=%FolderPath%\JenkinsTest.Tests\bin\Debug\JenkinsTest.Tests.dll%
 
 REM Recreate Results Folder
 rd /S /Q %ResultsPath%
 md %ResultsPath%
 
 REM Create coverage history folder if not exists
 if not exist "%CoverageHistoryPath%" mkdir %CoverageHistoryPath%
 
 REM Run Nunit3 for tests, it produces TestResult.xml report
 "%NunitPath%\nunit3-console.exe" "%UnitTestProj%" --result=%ResultsPath%\TestResult.xml
 
 REM Get nunit command errorlevel
 SET NunitError=%ERRORLEVEL%

 REM Fail if Nunit has found an error on tests
 exit /b %NunitError%