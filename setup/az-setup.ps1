
# az login

# -- Create resources for Python Azure Function.
#    https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-python?pivots=python-mode-configuration&tabs=azure-cli%2Cbash#create-supporting-azure-resources-for-your-function


#  Try using the resources created for the FlaskFileUpAz project.
#  That is a Linux

$rgName = "fileupaz_rg"
$location = "eastus"
$storageAcct = "fileupaz01storage"
$funcAppName = "fileupaz01funcapp"

Write-Host "$rgName"
Write-Host "$location"
Write-Host "$storageAcct"
Write-Host "$funcAppName"


# -- Create the function app.

az functionapp create `
    -g $rgName `
    --consumption-plan-location $location `
    --runtime python `
    --runtime-version 3.8 `
    --functions-version 4 `
    --name $funcAppName `
    --os-type linux `
    --storage-account $storageAcct

