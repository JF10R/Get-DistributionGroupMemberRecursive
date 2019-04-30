# Get-DistributionGroupMemberRecursive
PowerShell script used to recursively get a list of all members within a Distribution Group.

# Initializing the connection (Office 365)  

Here is how to setup the connection with Office 365 Exchange servers through Powershell:
    
    $365Logon = Get-Credential
    $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $365Logon -Authentication Basic -AllowRedirection
    
If you have large Distribution Groups, make sure to ajust the `ResultSize` parameter of [`Get-DistributionGroup`](https://docs.microsoft.com/en-us/powershell/module/exchange/users-and-groups/get-distributiongroup?view=exchange-ps):
    
    Get-DistributionGroup -ResultSize Unlimited
    
# Credits

Thanks to [Mike Goldwin](https://social.technet.microsoft.com/Forums/ie/en-US/d6be3ddd-95fd-4b57-96e3-cb9f4d4f27db/getdistributiongroupmember-recursive-functionality?forum=winserverpowershell) for his original code.
