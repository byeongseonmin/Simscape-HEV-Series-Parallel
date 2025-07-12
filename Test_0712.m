% Test_0712.m

import sltest.testmanager.*

% 1. 프로젝트 열기
projectPath = fullfile(pwd, 'Simscape-HEV-Series-Parallel', 'HEV_SeriesParallel.prj');
openProject(projectPath);

% 2. 테스트 파일 로드 및 실행
testFilePath = fullfile(pwd, 'Simscape-HEV-Series-Parallel', 'Scripts_Data', 'HEV_MODEL_TestManager.mldatx');
tf = TestFile(testFilePath);
resultSet = run(tf);

% 3. 결과 저장 폴더 생성
resultFolder = fullfile(pwd, 'Simscape-HEV-Series-Parallel', 'Test Result');
if ~exist(resultFolder, 'dir')
    mkdir(resultFolder);
end

% 4. 결과 저장 (mldatx + JUnit 형식)
exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.mldatx'));
exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.xml'), 'ExportFormat', 'JUnit');

% 5. 후처리
clear;
sltest.testmanager.clear;
