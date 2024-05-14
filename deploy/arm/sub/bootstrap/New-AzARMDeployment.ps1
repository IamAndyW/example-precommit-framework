Push-Location -Path $PSScriptRoot

# //static variables //
$templateFile = ".\template\bootstrap-template.json"

# // loading json configuration //
$configuration = Get-Content -Path .\bootstrap-configuration.json | ConvertFrom-Json -Depth 99
$tennantId = $configuration.tenantId
$partnerId = $configuration.partnerId

# // loading tags from template //
$resourceTags = (Get-Content -Path $templateFile | ConvertFrom-Json -AsHashtable -Depth 99).parameters.resourceTags.defaultValue

# // iterating over the subscriptions collection //
foreach ($subscription in $configuration.subscriptions) {

    Write-Host ("`nSubscription Name: {0}" -f $subscription.name)

    $resourceGroupNameElements = $subscription.resourceGroupName.Split("-")

    $resourceTags.Remove("company")
    $resourceTags.Add("company", $resourceGroupNameElements[0])
    $resourceTags.Remove("landing-zone")
    $resourceTags.Add("landing-zone", $resourceGroupNameElements[1])
    $resourceTags.Remove("resource-scope")
    $resourceTags.Add("resource-scope", $resourceGroupNameElements[2])
    $resourceTags.Remove("environment")
    $resourceTags.Add("environment", $resourceGroupNameElements[3])
    $resourceTags.Remove("repository")
    $resourceTags.Add("repository", $subscription.repository)


    switch ($resourceGroupNameElements.count) {
        7 {
            $resourceTags.Remove("component")
            $resourceTags.Add("component", $resourceGroupNameElements[5])
        }

        8 {
            $resourceTags.Remove("service")
            $resourceTags.Add("service", $resourceGroupNameElements[5])
            $resourceTags.Remove("component")
            $resourceTags.Add("component", $resourceGroupNameElements[6])

        }
    }

    $templateParameterObject = @{}
    $templateParameterObject.Add("storageAccountName", $subscription.storageAccountName)
    $templateParameterObject.Add("resourceTags", $resourceTags)

    $secureSecret= ConvertTo-SecureString -String $subscription.clientSecret -AsPlainText -Force
    $id = $subscription.clientId
    $credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $id, $secureSecret
    Connect-AzAccount -ServicePrincipal -TenantId $tennantId -Credential $credential
    Set-AzContext -Subscription $subscription.id

    if (-not [string]::IsNullOrEmpty($partnerId)) {
        $managementPartnerId = (Get-AzManagementPartner -ErrorAction SilentlyContinue).PartnerId
        Write-Host ("Current Partner Id: {0}" -f $managementPartnerId)
        if ($null -eq $managementPartnerId) {
            Write-Host ("Assinging Partner Id: {0}" -f $partnerId)
            New-AzManagementPartner -PartnerId $partnerId
        } elseif ($managementPartnerId -ne $partnerId) {
            Write-Host ("Update Partner Id: {1}" -f $partnerId)
            Update-AzManagementPartner -PartnerId $partnerId
        }
    }

    if (-not (Get-AzResourceGroup -Name $subscription.resourceGroupName -Location $subscription.location -ErrorAction SilentlyContinue)) {
        Write-Host ("Create Resource Group: {0}" -f $subscription.resourceGroupName)
        New-AzResourceGroup -Name $subscription.resourceGroupName -Location $subscription.location -Tags $resourceTags
    } else {
        Write-Host ("Update Resource Group: {0}" -f $subscription.resourceGroupName)
        Set-AzResourceGroup -Name $subscription.resourceGroupName -Tag $resourceTags
    }

    # // ARM deployment //
    Write-Host ("Deploying`nARM template: {0}" -f $templateFile)
    New-AzResourceGroupDeployment `
        -ResourceGroupName $subscription.resourceGroupName `
        -TemplateFile $templateFile `
        -templateParameterObject $templateParameterObject
}

Pop-Location
