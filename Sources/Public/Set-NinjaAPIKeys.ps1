Function Set-NinjaAPIKeys {

    <#
    
        .SYNOPSIS
            Sets the Ninja API Keys in the system

        .DESCRIPTION
            Sets the Ninja API Keys in JSON format to the key.json file in the root of the module folder

        .PARAMETER AccessKeyID
        The public portion of the API key.

        .PARAMETER SecretAccessKey
        The private portion of the API key.

        .EXAMPLE
        PS C:> Set-NinjaAPIKeys -AccessKeyID 1234 -SecretAccessKey 567890
    
    #>
    
    PARAM (
        
        [Parameter(Mandatory=$True)]
        [String]$AccessKeyID,

        [Parameter(Mandatory=$True)]
        [String]$SecretAccessKey

    )

    #Creates a key object with the inputted keys
    $Keys = [PSCustomObject] @{

        "AccessKeyID" = $AccessKeyID
        "SecretAccessKey" = $SecretAccessKey

    }

    #Specifies the location of the module in the system
    $ModulePath = Get-Module -Name PoSH-NinjaRMM | Select-Object -ExpandProperty ModuleBase
    #Specified the name of the key file
    $KeyFileName = "key.json"

    #Takes the key object, converts it to JSON, and outputs it to the correct location
    $Keys | ConvertTo-JSON | Out-File -FilePath "$ModulePath\$KeyFileName" -Force
    
}