% Test_0712.m

import sltest.testmanager.*

% 1. 프로젝트 열기
projectPath = fullfile(pwd, 'HEV_SeriesParallel.prj');
openProject(projectPath);

% 2. 테스트 파일 경로
testFilePath = fullfile(pwd, 'Scripts_Data', 'HEV_MODEL_TestManager.mldatx');

% 3. 테스트 실행
resultSet = sltest.testmanager.run(testFilePath);

% 4. 결과 저장 폴더 생성
resultFolder = fullfile(pwd, 'Test Result');
if ~exist(resultFolder, 'dir')
    mkdir(resultFolder);
end

% 5. 결과 저장
sltest.testmanager.exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.mldatx'));
sltest.testmanager.exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.xml'), 'ExportFormat', 'JUnit');

% 6. 후처리
sltest.testmanager.clear;
