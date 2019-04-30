
function Get-DistributionGroupMemberRecursive ($GroupIdentity) {
  $member_list = Get-DistributionGroupMember -Identity $GroupIdentity
  foreach ($member in $member_list) {
    if ($member.RecipientType -like '*Group*') {
       Get-DistributionGroupMemberRecursive -GroupIdentity $member.Identity
    } else {
      $member | Select-Object WindowsLiveID, Identity
    }
  }
}
#$group = Get-DistributionGroup "GroupName"
#Get-DistributionGroupMemberRecursive -GroupIdentity $group.Identity | Export-csv -Path C:\test.csv -Delimiter ';' -Encoding 'UTF8'
