IF OBJECT_ID('AddCenter', 'P') IS NOT NULL DROP PROC AddCenter;
IF OBJECT_ID('AddChild', 'P') IS NOT NULL DROP PROC AddChild;
IF OBJECT_ID('AddCompany', 'P') IS NOT NULL DROP PROC AddCompany;
IF OBJECT_ID('AddStaffType', 'P') IS NOT NULL DROP PROC AddStaffType;
IF OBJECT_ID('AddTask', 'P') IS NOT NULL DROP PROC AddTask;
IF OBJECT_ID('AddVolunteerType', 'P') IS NOT NULL DROP PROC AddVolunteerType;
IF OBJECT_ID('EditTask', 'P') IS NOT NULL DROP PROC EditTask;
IF OBJECT_ID('GetCenterForID', 'P') IS NOT NULL DROP PROC GetCenterForID;
IF OBJECT_ID('GetChildByChildID', 'P') IS NOT NULL DROP PROC GetChildByChildID;
IF OBJECT_ID('GetChildrenByVolunteerID', 'P') IS NOT NULL DROP PROC GetChildrenByVolunteerID;
IF OBJECT_ID('GetCompanies', 'P') IS NOT NULL DROP PROC GetCompanies;
IF OBJECT_ID('GetCompanyForID', 'P') IS NOT NULL DROP PROC GetCompanyForID;
IF OBJECT_ID('GetHoursForPeriodAndVolunteerID', 'P') IS NOT NULL DROP PROC GetHoursForPeriodAndVolunteerID;
IF OBJECT_ID('GetMonthlySummaryReport', 'P') IS NOT NULL DROP PROC GetMonthlySummaryReport;
IF OBJECT_ID('GetPIN', 'P') IS NOT NULL DROP PROC GetPIN;
IF OBJECT_ID('GetStaffTypeForID', 'P') IS NOT NULL DROP PROC GetStaffTypeForID;
IF OBJECT_ID('GetStaffTypes', 'P') IS NOT NULL DROP PROC GetStaffTypes;
IF OBJECT_ID('GetUserByUserId', 'P') IS NOT NULL DROP PROC GetUserByUserId;
IF OBJECT_ID('InactivateCenter', 'P') IS NOT NULL DROP PROC InactivateCenter;
IF OBJECT_ID('InsertNewUser', 'P') IS NOT NULL DROP PROC InsertNewUser;
IF OBJECT_ID('LogInKind', 'P') IS NOT NULL DROP PROC LogInKind;
IF OBJECT_ID('SelectAllUsers', 'P') IS NOT NULL DROP PROC SelectAllUsers;
IF OBJECT_ID('SelectCenter', 'P') IS NOT NULL DROP PROC SelectCenter;
IF OBJECT_ID('SelectReport', 'P') IS NOT NULL DROP PROC SelectReport;
IF OBJECT_ID('SelectReportForMonth', 'P') IS NOT NULL DROP PROC SelectReportForMonth;
IF OBJECT_ID('SelectTask', 'P') IS NOT NULL DROP PROC SelectTask;
IF OBJECT_ID('SelectUserByUserId', 'P') IS NOT NULL DROP PROC SelectUserByUserId;
IF OBJECT_ID('SelectVolunteerTypes', 'P') IS NOT NULL DROP PROC SelectVolunteerTypes;
IF OBJECT_ID('spInsertNewUser', 'P') IS NOT NULL DROP PROC spInsertNewUser;
IF OBJECT_ID('UpdateCenter', 'P') IS NOT NULL DROP PROC UpdateCenter;
IF OBJECT_ID('UpdateChild', 'P') IS NOT NULL DROP PROC UpdateChild;
IF OBJECT_ID('UpdateCompany', 'P') IS NOT NULL DROP PROC UpdateCompany;
IF OBJECT_ID('UpdateStaffType', 'P') IS NOT NULL DROP PROC UpdateStaffType;
IF OBJECT_ID('UpdateUser', 'P') IS NOT NULL DROP PROC UpdateUser;
IF OBJECT_ID('UpdateVolunteerType', 'P') IS NOT NULL DROP PROC UpdateVolunteerType;
IF OBJECT_ID('ValidateLogin', 'P') IS NOT NULL DROP PROC ValidateLogin;
IF OBJECT_ID('ValidateUserInfo', 'P') IS NOT NULL DROP PROC ValidateUserInfo;