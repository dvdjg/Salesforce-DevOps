#!/bin/bash
cd $(dirname "$0")/..

source bin/.common.sh

echo ""
echo "Installing scratch org ($ORG_ALIAS)"
echo ""

# Install script
echo "Cleaning previous scratch org..."
sfdx force:org:delete -p -u $ORG_ALIAS &> /dev/null
echo ""

echo "Creating scratch org..."
sfdx force:org:create -s -f config/project-scratch-def.json --durationdays 30 --json -a $ORG_ALIAS
echo ""

# {
#   "status": 0,
#   "result": {
#     "orgId": "00D0E000000FK42UAG",
#     "username": "test-8x0xlfoxjeq8@example.com"
#   }
# }

echo "Pushing source..."
sfdx force:source:push
echo ""

#echo "Assigning permission sets..."
#sfdx force:user:permset:assign -n DevOps
#echo ""

# sfdx force:data:soql:query -q "SELECT Id FROM Opportunity" --resultformat csv > delete.csv; sfdx force:data:bulk:delete -s Opportunity -f delete.csv 
# sfdx force:data:soql:query -q "SELECT Id FROM Case" --resultformat csv > delete.csv; sfdx force:data:bulk:delete -s Case -f delete.csv 
# sfdx force:data:soql:query -q "SELECT Id FROM Contact" --resultformat csv > delete.csv; sfdx force:data:bulk:delete -s Contact -f delete.csv 
# sfdx force:data:soql:query -q "SELECT Id FROM Account" --resultformat csv > delete.csv; sfdx force:data:bulk:delete -s Account -f delete.csv 

echo "Importing sample data..."
sfdx force:data:tree:import -p data/basic/basic-Account-Contact-Case-Opportunity-plan.json -u $ORG_ALIAS
echo ""

# Creación de registros desde CLI:
# sfdx force:data:record:create -s Account -v "Name='Marriott Marquis' BillingStreet='780 Mission St' BillingCity='San Francisco' BillingState='CA' BillingPostalCode='94103' Phone='(415) 896-1600' Website='www.marriott.com'"
# sfdx force:data:record:create -s Account -v "Name='Hilton Union Square' BillingStreet='333 O Farrell St' BillingCity='San Francisco' BillingState='CA' BillingPostalCode='94102' Phone='(415) 771-1400' Website='www.hilton.com'"
# sfdx force:data:record:create -s Account -v "Name='Hyatt' BillingStreet='5 Embarcadero Center' BillingCity='San Francisco' BillingState='CA' BillingPostalCode='94111' Phone='(415) 788-1234' Website='www.hyatt.com'"

echo "Opening org..."
sfdx force:org:open -p lightning/page/home -u $ORG_ALIAS
echo ""

EXIT_CODE="$?"
echo ""

# Check exit code
echo ""
if [ "$EXIT_CODE" -eq 0 ]; then
  echo "Installation completed."
else
    echo "Installation failed."
fi
exit $EXIT_CODE
