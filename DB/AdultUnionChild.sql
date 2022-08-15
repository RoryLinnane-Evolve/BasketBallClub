SELECT PlayerId, BI_PIN,Name, DateOfBirth, Gender,Address, Email AS 'Email/Parent Email', PhoneNumber AS 'Phone/Parent Phone', MedicalConditions, Allergies, MedicalNotes, RoleId, RegistrarEmail, Payed, EmergencyContactNumber AS 'EmergencyContactPhone/CountryOfBirth', EmergencyContactRelationship AS 'EmergencyContactRel/ParentName', DateRegistered
FROM Players WHERE RoleId = 1
UNION
SELECT PlayerId, BI_PIN,Name, DateOfBirth, Gender,Address, ParentEmail,ParentPhoneNumber, MedicalConditions, Allergies, MedicalNotes, RoleId, RegistrarEmail, Payed,	CountryOfBirth, ParentName, DateRegistered
FROM Players WHERE RoleId = 2;