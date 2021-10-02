cd $(dirname "$0")

source ./.common.sh

sfdx force:data:tree:export -q "SELECT Name, BillingStreet, BillingCity, BillingState, BillingPostalCode, Phone, Website,(Select Title,Department,FirstName, LastName,Email,Phone,HomePhone,MobilePhone,Fax,LeadSource FROM  Contacts),(SELECT Origin,Priority,Status,Subject,Type FROM Cases),(SELECT Name,Amount,CloseDate,StageName,Type FROM Opportunities) FROM Account WHERE BillingStreet != NULL AND BillingCity != NULL and BillingState != NULL" -d ../data/basic  -u "${HUB_USERNAME}" --prefix basic --plan