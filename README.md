# Get-DistributionGroupMemberRecursive
PowerShell script used to recursively get a list of all members within a Distribution Group.

## How to use

1. Execute the function code.
2. Call the function:  
    
       Get-DistributionGroupMemberRecursive -Group "GroupName" | Export-csv -Path C:\test.csv -Delimiter ',' -Encoding 'UTF8'

# Initializing the connection (Office 365)  

Here is how to setup the connection with Office 365 Exchange servers through Powershell:

    Set-ExecutionPolicy RemoteSigned    
    $365Logon = Get-Credential
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $365Logon -Authentication Basic -AllowRedirection
    
If you have large Distribution Groups, make sure to ajust the `ResultSize` parameter of [`Get-DistributionGroup`](https://docs.microsoft.com/en-us/powershell/module/exchange/users-and-groups/get-distributiongroup?view=exchange-ps):
    
    Get-DistributionGroup -ResultSize Unlimited
    
# Credits

Thanks to [Mike Goldwin](https://social.technet.microsoft.com/Forums/ie/en-US/d6be3ddd-95fd-4b57-96e3-cb9f4d4f27db/getdistributiongroupmember-recursive-functionality?forum=winserverpowershell) for his original code.  
Thanks to [JScott](https://stackoverflow.com/a/21042554/1451422) for column header labels code.
