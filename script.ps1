
function Get-DistributionGroupMemberRecursive ($GroupName) {
  $group = Get-DistributionGroup $GroupName
  $member_list = Get-DistributionGroupMember -Identity $group.Identity
  foreach ($member in $member_list) {
    if ($member.RecipientType -like '*Group*') {
       Get-DistributionGroupMemberRecursive -GroupIdentity $member.Identity
    } else {
      $member | Select-Object WindowsLiveID, Identity
    }
  }
}

#Get-DistributionGroupMemberRecursive -Group "GroupName" | Export-csv -Path C:\test.csv -Delimiter ';' -Encoding 'UTF8'
