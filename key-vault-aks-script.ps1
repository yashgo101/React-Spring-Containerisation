$keyvlt_name="Key-Vault-Integration";
$aks_name="Azure-AKS-Devops-Deploy";
$acs_name="AzureACRDeploy";
$res_grp="Resgrp2";
$loc="centralindia";

# Getting the client ID of AKS Cluster's Managed Identity
$arr=az identity show --name "$aks_name-agentpool" --resource-group "MC`_$res_grp`_$aks_name`_$loc";
$aks_client_id=$arr[1].Split(":")[1].Replace(',', '').Replace('"','').Replace(' ', '')

# Setting the permissions on Key Vault for AKS Cluster
az keyvault set-policy -n $keyvlt_name --spn $aks_client_id --secret-permissions get;

Write-Host "`n ------------------------------------- `n"

# Creating secrets in the Key Vault
az --% keyvault secret set --vault-name "Key-Vault-Integration" --name SPRING-DATASOURCE-URL --value "jdbc:mysql://yashserver2.mysql.database.azure.com:3306/employeedb?serverTimezone=UTC&createDatabaseIfNotExist=true"
az --% keyvault secret set --vault-name "Key-Vault-Integration" --name SPRING-DATASOURCE-USERNAME --value "host"
az --% keyvault secret set --vault-name "Key-Vault-Integration" --name SPRING-DATASOURCE-PASSWORD --value "player"

Write-Host "`n ------------------------------------- `n"

# Connecting the AKS Cluster to ACR and enabling CSI drivers on the AKS
# az aks get-credentials --name $aks_name --resource-group $res_grp
az aks enable-addons --addons=azure-keyvault-secrets-provider --name=$aks_name --resource-group=$res_grp
az aks update -n $aks_name -g $res_grp --attach-acr $acs_name

Write-Host "`n ------------------------------------- `n"

Write-Host "The clientId of $aks_name-agentpool: $aks_client_id"
