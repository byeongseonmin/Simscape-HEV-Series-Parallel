% Test_0712.m

import sltest.testmanager.*

% 1. 프로젝트 열기
projectPath = fullfile(pwd, 'HEV_SeriesParallel.prj');
openProject(projectPath);

% 2. 테스트 파일 로드
testFilePath = fullfile(pwd, 'Scripts_Data', 'HEV_MODEL_TestManager.mldatx');
sltest.testmanager.load(testFilePath);  % <- 파일 로드만 함

% 3. 테스트 실행 (전체 활성된 테스트 실행)
resultSet = sltest.testmanager.run();  % <- 인자 없음!

% 4. 결과 저장 폴더 생성
resultFolder = fullfile(pwd, 'Test Result');
if ~exist(resultFolder, 'dir')
    mkdir(resultFolder);
end

% 5. 결과 저장
sltest.testmanager.exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.mldatx'));
%sltest.testmanager.exportResults(resultSet, fullfile(resultFolder, 'HEV_MODEL_TestResult.xml'), 'ExportFormat', 'JUnit');

% 6. 클린업
sltest.testmanager.clear;
