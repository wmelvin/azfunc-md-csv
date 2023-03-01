# ----------------------------------------------------------------------
#  az-setup.ps1
# ----------------------------------------------------------------------

# az login


# ----------------------------------------------------------------------

# -- Create resources for Python Azure Function.
#    https://learn.microsoft.com/en-us/azure/azure-functions/create-first-function-cli-python?pivots=python-mode-configuration&tabs=azure-cli%2Cbash#create-supporting-azure-resources-for-your-function


#  Try using the resources created for the 'FlaskFileUpAz' project.
#  This assumes that the 'az-setup-1-storage.ps1' script in that
#  project has been run and the resources exist. Make sure the
#  resource names below still match what that script creates.

$rgName = "fileupaz_rg"
$location = "eastus"
$storageAcct = "fileupaz01storage"
$appServName = "fileupaz01appserv"


#  Resources for the function app.

$funcAppName = "fileupaz01funcapp"


Write-Host "$rgName"
Write-Host "$location"
Write-Host "$storageAcct"
Write-Host "$appServName"
Write-Host "$funcAppName"


# -- Get the storage account key.
#    Example found in Microsoft Docs: "Mount a file share to a Python function app - Azure CLI"
#    https://docs.microsoft.com/en-us/azure/azure-functions/scripts/functions-cli-mount-files-storage-linux

$storageKey = $(az storage account keys list -g $rgName -n $storageAcct --query '[0].value' -o tsv)


# -- Create storage container for function app output.
#    https://docs.microsoft.com/en-us/cli/azure/storage/container?view=azure-cli-latest#az-storage-container-create

az storage container create `
    --account-key $storageKey `
    --account-name $storageAcct `
    --name "output-md"


# -- Create the function app.
#    https://docs.microsoft.com/en-us/cli/azure/functionapp?view=azure-cli-latest#az-functionapp-create

# # -- Use consumption plan.
# az functionapp create `
#     -g $rgName `
#     --consumption-plan-location $location `
#     --runtime python `
#     --runtime-version 3.8 `
#     --functions-version 4 `
#     --name $funcAppName `
#     --os-type linux `
#     --storage-account $storageAcct

# -- Use existing App Service Plan.
az functionapp create `
    -g $rgName `
    --plan $appServName `
    --runtime python `
    --runtime-version 3.8 `
    --functions-version 4 `
    --name $funcAppName `
    --os-type linux `
    --storage-account $storageAcct
